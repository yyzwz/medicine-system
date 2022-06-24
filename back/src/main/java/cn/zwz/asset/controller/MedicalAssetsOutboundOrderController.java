package cn.zwz.asset.controller;

import cn.zwz.asset.entity.MedicalAssets;
import cn.zwz.asset.entity.MedicalAssetsOutboundOrder;
import cn.zwz.asset.service.IMedicalAssetsService;
import cn.zwz.asset.service.IMedicalAssetsOutboundOrderService;
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
@Api(tags = "医疗资产出库单")
@RequestMapping("/zwz/medicalAssetsOutboundOrder")
@Transactional
public class MedicalAssetsOutboundOrderController {

    @Autowired
    private IMedicalAssetsOutboundOrderService iMedicalAssetsOutboundOrderService;

    @Autowired
    private IMedicalAssetsService iMedicalAssetsService;

    @ApiOperation(value = "查询资产出库清单")
    @RequestMapping(value = "/getByPage", method = RequestMethod.GET)
    public Result<IPage<MedicalAssetsOutboundOrder>> getByPage(@ModelAttribute MedicalAssetsOutboundOrder medicalAssetsOutboundOrder, @ModelAttribute PageVo page){
        QueryWrapper<MedicalAssetsOutboundOrder> qw = new QueryWrapper<>();
        if(!ZwzNullUtils.isNull(medicalAssetsOutboundOrder.getNature())) {
            qw.eq("nature", medicalAssetsOutboundOrder.getNature());
        }
        if(!ZwzNullUtils.isNull(medicalAssetsOutboundOrder.getAssetName())) {
            qw.like("asset_name", medicalAssetsOutboundOrder.getAssetName());
        }
        if(!ZwzNullUtils.isNull(medicalAssetsOutboundOrder.getRecipients())) {
            qw.like("recipients", medicalAssetsOutboundOrder.getRecipients());
        }
        IPage<MedicalAssetsOutboundOrder> data = iMedicalAssetsOutboundOrderService.page(PageUtil.initMpPage(page),qw);
        for (MedicalAssetsOutboundOrder wh : data.getRecords()) {
            MedicalAssets medicalAssets = iMedicalAssetsService.getById(wh.getAssetId());
            wh.setExistNumber(medicalAssets.getExistingNumber().add(wh.getNumber()));
        }
        return new ResultUtil<IPage<MedicalAssetsOutboundOrder>>().setData(data);
    }

    @ApiOperation(value = "资产出库")
    @RequestMapping(value = "/insertOrUpdate", method = RequestMethod.POST)
    public Result<MedicalAssetsOutboundOrder> saveOrUpdate(MedicalAssetsOutboundOrder medicalAssetsOutboundOrder){
        MedicalAssetsOutboundOrder oldMedicalAssetsOutboundOrder = iMedicalAssetsOutboundOrderService.getById(medicalAssetsOutboundOrder.getId());
        BigDecimal oldNumber = BigDecimal.ZERO;
        if(oldMedicalAssetsOutboundOrder != null){
            oldNumber = oldMedicalAssetsOutboundOrder.getNumber();
        }
        // outNumber 要出库的数量
        BigDecimal outNumber = medicalAssetsOutboundOrder.getNumber();
        MedicalAssets oldMedicalAssets = iMedicalAssetsService.getById(medicalAssetsOutboundOrder.getAssetId());
        if(oldMedicalAssets != null){
            // newNumber 出库后还有的数量 = 仓库原本还有的数量 - 出库单的出库数量 + 原有出库单的出库数量
            BigDecimal newNumber = oldMedicalAssets.getExistingNumber().subtract(outNumber).add(oldNumber);
            if(newNumber.compareTo(BigDecimal.ZERO) >= 0){
                oldMedicalAssets.setExistingNumber(newNumber);
                iMedicalAssetsService.saveOrUpdate(oldMedicalAssets);
            }else{
                return ResultUtil.error("手慢啦!库存不足!");
            }
        }
        if(iMedicalAssetsOutboundOrderService.saveOrUpdate(medicalAssetsOutboundOrder)){
            return new ResultUtil<MedicalAssetsOutboundOrder>().setData(medicalAssetsOutboundOrder);
        }
        return ResultUtil.error();
    }

    @ApiOperation(value = "删除资产出库清单")
    @RequestMapping(value = "/delByIds", method = RequestMethod.POST)
    public Result<Object> delAllByIds(@RequestParam String[] ids){
        for(String id : ids){
            MedicalAssetsOutboundOrder medicalAssetsOutboundOrder = iMedicalAssetsOutboundOrderService.getById(id);
            if(medicalAssetsOutboundOrder != null){
                MedicalAssets medicalAssets = iMedicalAssetsService.getById(medicalAssetsOutboundOrder.getAssetId());
                // 出库单删除之后的库存 = 现有库存 + 出库单的资产数量
                BigDecimal newNumber = medicalAssets.getExistingNumber().add(medicalAssetsOutboundOrder.getNumber());
                medicalAssets.setExistingNumber(newNumber);
                iMedicalAssetsService.saveOrUpdate(medicalAssets);
            }
            iMedicalAssetsOutboundOrderService.removeById(id);
        }
        return ResultUtil.success();
    }
}
