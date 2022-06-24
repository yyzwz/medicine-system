package cn.zwz.asset.controller;

import cn.zwz.asset.entity.MedicalAssets;
import cn.zwz.asset.entity.MedicalAssetsWarehousingOrder;
import cn.zwz.asset.service.IMedicalAssetsService;
import cn.zwz.asset.service.IMedicalAssetsWarehousingOrderService;
import cn.zwz.basics.baseVo.PageVo;
import cn.zwz.basics.baseVo.Result;
import cn.zwz.basics.utils.PageUtil;
import cn.zwz.basics.utils.ResultUtil;
import cn.zwz.data.utils.ZwzNullUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;

/**
 * @author 郑为中
 */
@RestController
@Api(tags = "医疗资产入库单管理")
@RequestMapping("/zwz/medicalAssetsWarehousingOrder")
@Transactional
public class MmedicalAssetsWarehousingOrderController {

    @Autowired
    private IMedicalAssetsWarehousingOrderService iMedicalAssetsWarehousingOrderService;

    @Autowired
    private IMedicalAssetsService iMedicalAssetsService;

    @ApiOperation(value = "查询资产入库清单")
    @RequestMapping(value = "/getByPage", method = RequestMethod.GET)
    public Result<IPage<MedicalAssetsWarehousingOrder>> getByPage(@ModelAttribute MedicalAssetsWarehousingOrder medicalAssetsWarehousingOrder, @ModelAttribute PageVo page){
        QueryWrapper<MedicalAssetsWarehousingOrder> qw = new QueryWrapper<>();
        if(!ZwzNullUtils.isNull(medicalAssetsWarehousingOrder.getNature())) {
            qw.eq("nature", medicalAssetsWarehousingOrder.getNature());
        }
        if(!ZwzNullUtils.isNull(medicalAssetsWarehousingOrder.getAssetName())) {
            qw.like("asset_name", medicalAssetsWarehousingOrder.getAssetName());
        }
        if(!ZwzNullUtils.isNull(medicalAssetsWarehousingOrder.getInvoice())) {
            qw.like("invoice", medicalAssetsWarehousingOrder.getInvoice());
        }
        return new ResultUtil<IPage<MedicalAssetsWarehousingOrder>>().setData(iMedicalAssetsWarehousingOrderService.page(PageUtil.initMpPage(page),qw));
    }

    @ApiOperation(value = "资产入库")
    @RequestMapping(value = "/insertOrUpdate", method = RequestMethod.POST)
    public Result<MedicalAssetsWarehousingOrder> insertOrUpdate(MedicalAssetsWarehousingOrder medicalAssetsWarehousingOrder){
        MedicalAssetsWarehousingOrder oldMedicalAssetsWarehousingOrder = iMedicalAssetsWarehousingOrderService.getById(medicalAssetsWarehousingOrder.getId());
        BigDecimal oldNumber = BigDecimal.ZERO;
        if(oldMedicalAssetsWarehousingOrder != null){
            oldNumber = oldMedicalAssetsWarehousingOrder.getNumber() == null ? BigDecimal.ZERO : oldMedicalAssetsWarehousingOrder.getNumber();
        }
        // 入库,更新库存
        MedicalAssets medicalAssets = iMedicalAssetsService.getById(medicalAssetsWarehousingOrder.getAssetId());
        if(medicalAssets != null){
            // number = 现在仓库总数量 + 该入库单现增加数量 - 该入库单原有增加数量
            BigDecimal number = medicalAssets.getNumber().add(medicalAssetsWarehousingOrder.getNumber()).subtract(oldNumber);
            medicalAssets.setNumber(number);
            medicalAssets.setTotalPrice(medicalAssets.getUnitPrice().multiply(number));
            // existNumber = 现在仓库存在数量 + 该入库单现增加数量 - 该入库单原有增加数量
            BigDecimal existNumber = medicalAssets.getExistingNumber().add(medicalAssetsWarehousingOrder.getNumber()).subtract(oldNumber);
            if(existNumber.compareTo(BigDecimal.ZERO) < 0)  {
                return ResultUtil.error("入库数量大于已出库数量!");
            }
            medicalAssets.setExistingNumber(existNumber);
            iMedicalAssetsService.saveOrUpdate(medicalAssets);
        }
        if(iMedicalAssetsWarehousingOrderService.saveOrUpdate(medicalAssetsWarehousingOrder)){
            return new ResultUtil<MedicalAssetsWarehousingOrder>().setData(medicalAssetsWarehousingOrder);
        }
        return ResultUtil.error();
    }

    @ApiOperation(value = "删除资产入库清单")
    @RequestMapping(value = "/delByIds", method = RequestMethod.POST)
    public Result<Object> delAllByIds(@RequestParam String[] ids){
        for(String id : ids){
            // 删除仓库内的数量
            MedicalAssetsWarehousingOrder medicalAssetsWarehousingOrder = iMedicalAssetsWarehousingOrderService.getById(id);
            if(medicalAssetsWarehousingOrder != null){
                // 获取入库单的数量
                BigDecimal number = medicalAssetsWarehousingOrder.getNumber();
                // 获取入库单的资产ID
                String assetId = medicalAssetsWarehousingOrder.getAssetId();
                MedicalAssets assetsType = iMedicalAssetsService.getById(assetId);
                if(assetsType != null){
                    BigDecimal newNumber = assetsType.getNumber().subtract(number);
                    assetsType.setNumber(newNumber.compareTo(BigDecimal.ZERO) < 0 ? BigDecimal.ZERO : newNumber);
                    BigDecimal totalPrice = newNumber.multiply(assetsType.getUnitPrice());
                    assetsType.setTotalPrice(totalPrice.compareTo(BigDecimal.ZERO) < 0 ? BigDecimal.ZERO : totalPrice);
                    BigDecimal existNumber = assetsType.getExistingNumber().subtract(number);
                    if(existNumber.compareTo(BigDecimal.ZERO) < 0) {
                        return ResultUtil.error(assetsType.getAssetName() + "出库数量大于库存,删除失败!");
                    }
                    assetsType.setExistingNumber(existNumber);
                    iMedicalAssetsService.saveOrUpdate(assetsType);
                }
            }
            iMedicalAssetsWarehousingOrderService.removeById(id);
        }
        return ResultUtil.success();
    }
}
