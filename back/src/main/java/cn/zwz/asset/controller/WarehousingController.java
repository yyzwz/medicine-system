package cn.zwz.asset.controller;

import cn.zwz.asset.entity.AssetsType;
import cn.zwz.asset.entity.Warehousing;
import cn.zwz.asset.service.IAssetsTypeService;
import cn.zwz.asset.service.IWarehousingService;
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
@Api(tags = "入库管理")
@RequestMapping("/zwz/warehousing")
@Transactional
public class WarehousingController {

    @Autowired
    private IWarehousingService iWarehousingService;

    @Autowired
    private IAssetsTypeService iAssetsTypeServicel;

    @ApiOperation(value = "查询资产入库清单")
    @RequestMapping(value = "/getByPage", method = RequestMethod.GET)
    public Result<IPage<Warehousing>> getByPage(@ModelAttribute Warehousing warehousing, @ModelAttribute PageVo page){
        QueryWrapper<Warehousing> qw = new QueryWrapper<Warehousing>();
        if(!ZwzNullUtils.isNull(warehousing.getNature())) {
            qw.eq("nature", warehousing.getNature());
        }
        if(!ZwzNullUtils.isNull(warehousing.getAssetName())) {
            qw.like("asset_name", warehousing.getAssetName());
        }
        if(!ZwzNullUtils.isNull(warehousing.getInvoice())) {
            qw.like("invoice", warehousing.getInvoice());
        }
        return new ResultUtil<IPage<Warehousing>>().setData(iWarehousingService.page(PageUtil.initMpPage(page),qw));
    }

    @ApiOperation(value = "资产入库")
    @RequestMapping(value = "/insertOrUpdate", method = RequestMethod.POST)
    public Result<Warehousing> insertOrUpdate(Warehousing warehousing){
        Warehousing oldWarehousing = iWarehousingService.getById(warehousing.getId());
        double oldNumber = 0.0;
        if(oldWarehousing != null){
            oldNumber = oldWarehousing.getNumber() == null ? 0.0 : Double.parseDouble(oldWarehousing.getNumber());
        }
        // 入库,更新库存
        AssetsType assetsType = iAssetsTypeServicel.getById(warehousing.getAssetId());
        if(assetsType != null){
            // number = 现在仓库总数量 + 该入库单现增加数量 - 该入库单原有增加数量
            double number = Double.parseDouble(assetsType.getNumber()) + Double.parseDouble(warehousing.getNumber()) - oldNumber;
            assetsType.setNumber(number + "");
            assetsType.setTotalPrice((Double.parseDouble(assetsType.getUnitPrice()) * number) + "");
            // existNumber = 现在仓库存在数量 + 该入库单现增加数量 - 该入库单原有增加数量
            double existNumber = Double.parseDouble(assetsType.getExistingNumber()) + Double.parseDouble(warehousing.getNumber()) - oldNumber;
            if(existNumber < 0)  {
                return ResultUtil.error("入库数量大于已出库数量!");
            }
            assetsType.setExistingNumber(existNumber + "");
            iAssetsTypeServicel.saveOrUpdate(assetsType);
        }
        if(iWarehousingService.saveOrUpdate(warehousing)){
            return new ResultUtil<Warehousing>().setData(warehousing);
        }
        return ResultUtil.error();
    }

    @ApiOperation(value = "删除资产入库清单")
    @RequestMapping(value = "/delByIds", method = RequestMethod.POST)
    public Result<Object> delAllByIds(@RequestParam String[] ids){
        for(String id : ids){
            // 删除仓库内的数量
            Warehousing warehousing = iWarehousingService.getById(id);
            if(warehousing != null){
                // 获取入库单的数量
                Double number = Double.parseDouble(warehousing.getNumber());
                // 获取入库单的资产ID
                String assetId = warehousing.getAssetId();
                AssetsType assetsType = iAssetsTypeServicel.getById(assetId);
                if(assetsType != null){
                    double newNumber = Double.parseDouble(assetsType.getNumber()) - number;
                    assetsType.setNumber(newNumber < 0 ? "0" : "" + newNumber);
                    double totalPrice = newNumber * Double.parseDouble(assetsType.getUnitPrice());
                    assetsType.setTotalPrice(totalPrice < 0 ? "0" : "" + totalPrice);
                    double existNumber = Double.parseDouble(assetsType.getExistingNumber()) - number;
                    if(existNumber < 0) {
                        return ResultUtil.error(assetsType.getAssetName() + "出库数量大于库存,删除失败!");
                    }
                    assetsType.setExistingNumber(existNumber + "");
                    iAssetsTypeServicel.saveOrUpdate(assetsType);
                }
            }
            iWarehousingService.removeById(id);
        }
        return ResultUtil.success();
    }
}
