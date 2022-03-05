package cn.zwz.asset.controller;

import cn.zwz.asset.entity.AssetsType;
import cn.zwz.asset.entity.WarehouseOut;
import cn.zwz.asset.service.IAssetsTypeService;
import cn.zwz.asset.service.IWarehouseOutService;
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

/**
 * @author 郑为中
 */
@RestController
@Api(tags = "出库管理")
@RequestMapping("/zwz/warehouseOut")
@Transactional
public class WarehouseOutController {

    @Autowired
    private IWarehouseOutService iWarehouseOutService;

    @Autowired
    private IAssetsTypeService iAssetsTypeService;

    @ApiOperation(value = "查询资产出库清单")
    @RequestMapping(value = "/getByPage", method = RequestMethod.GET)
    public Result<IPage<WarehouseOut>> getByPage(@ModelAttribute WarehouseOut warehouseOut, @ModelAttribute PageVo page){
        QueryWrapper<WarehouseOut> qw = new QueryWrapper<WarehouseOut>();
        if(!ZwzNullUtils.isNull(warehouseOut.getNature())) {
            qw.eq("nature", warehouseOut.getNature());
        }
        if(!ZwzNullUtils.isNull(warehouseOut.getAssetName())) {
            qw.like("asset_name", warehouseOut.getAssetName());
        }
        if(!ZwzNullUtils.isNull(warehouseOut.getRecipients())) {
            qw.like("recipients", warehouseOut.getRecipients());
        }
        IPage<WarehouseOut> data = iWarehouseOutService.page(PageUtil.initMpPage(page),qw);
        for (WarehouseOut wh : data.getRecords()) {
            AssetsType assetsType = iAssetsTypeService.getById(wh.getAssetId());
            double existnumber = Double.parseDouble(assetsType.getExistingNumber()) + Double.parseDouble(wh.getNumber());
            wh.setExistNumber("" + existnumber);
        }
        return new ResultUtil<IPage<WarehouseOut>>().setData(data);
    }

    @ApiOperation(value = "资产出库")
    @RequestMapping(value = "/insertOrUpdate", method = RequestMethod.POST)
    public Result<WarehouseOut> saveOrUpdate(WarehouseOut warehouseOut){
        WarehouseOut oldWarehouseOut = iWarehouseOutService.getById(warehouseOut.getId());
        double oldNumber = 0.0;
        if(oldWarehouseOut != null){
            oldNumber = Double.parseDouble(oldWarehouseOut.getNumber());
        }
        // outNumber 要出库的数量
        double outNumber = Double.parseDouble(warehouseOut.getNumber());
        AssetsType oldAssetsType = iAssetsTypeService.getById(warehouseOut.getAssetId());
        if(oldAssetsType != null){
            // newNumber 出库后还有的数量 = 仓库原本还有的数量 - 出库单的出库数量 + 原有出库单的出库数量
            Double newNumber = Double.parseDouble(oldAssetsType.getExistingNumber()) - outNumber + oldNumber;
            if(newNumber >= 0){
                oldAssetsType.setExistingNumber(newNumber + "");
                iAssetsTypeService.saveOrUpdate(oldAssetsType);
            }else{
                return ResultUtil.error("手慢啦!库存不足!");
            }
        }
        if(iWarehouseOutService.saveOrUpdate(warehouseOut)){
            return new ResultUtil<WarehouseOut>().setData(warehouseOut);
        }
        return ResultUtil.error();
    }

    @ApiOperation(value = "删除资产出库清单")
    @RequestMapping(value = "/delByIds", method = RequestMethod.POST)
    public Result<Object> delAllByIds(@RequestParam String[] ids){
        for(String id : ids){
            WarehouseOut warehouseOut = iWarehouseOutService.getById(id);
            if(warehouseOut != null){
                AssetsType assetsType = iAssetsTypeService.getById(warehouseOut.getAssetId());
                // 出库单删除之后的库存 = 现有库存 + 出库单的资产数量
                double newNumber = Double.parseDouble(assetsType.getExistingNumber()) + Double.parseDouble(warehouseOut.getNumber());
                assetsType.setExistingNumber("" + newNumber);
                iAssetsTypeService.saveOrUpdate(assetsType);
            }
            iWarehouseOutService.removeById(id);
        }
        return ResultUtil.success();
    }
}
