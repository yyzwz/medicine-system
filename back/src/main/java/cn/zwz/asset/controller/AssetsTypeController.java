package cn.zwz.asset.controller;

import cn.hutool.core.util.StrUtil;
import cn.zwz.asset.entity.AssetsType;
import cn.zwz.asset.service.IAssetsTypeService;
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
@Api(tags = "医用设备档案")
@RequestMapping("/zwz/assetsType")
@Transactional
public class AssetsTypeController {

    @Autowired
    private IAssetsTypeService iAssetsTypeService;

    @ApiOperation(value = "查询行政耗材品类")
    @RequestMapping(value = "/getByPage", method = RequestMethod.GET)
    public Result<IPage<AssetsType>> getByPage(@ModelAttribute AssetsType assetsType, @ModelAttribute PageVo page, @RequestParam(required = false) String natureType) {
        QueryWrapper<AssetsType> qw = new QueryWrapper<AssetsType>();
        if(StrUtil.isNotBlank(natureType)) {
            if(natureType.equals("1")){
                qw.eq("nature", "固定资产");
            }else{
                qw.eq("nature", "耗材");
            }
        }
        if(!ZwzNullUtils.isNull(assetsType.getNature())) {
            qw.eq("nature", assetsType.getNature());
        }
        if(!ZwzNullUtils.isNull(assetsType.getAssetName())) {
            qw.like("asset_name", assetsType.getAssetName());
        }
        return new ResultUtil<IPage<AssetsType>>().setData(iAssetsTypeService.page(PageUtil.initMpPage(page),qw));
    }

    @ApiOperation(value = "增改资产种类")
    @RequestMapping(value = "/insertOrUpdate", method = RequestMethod.POST)
    public Result<AssetsType> saveOrUpdate(AssetsType assetsType){
        if(assetsType.getNumber() == null){
            assetsType.setNumber("0");
            assetsType.setTotalPrice("0");
        }
        if(assetsType.getExistingNumber() == null){
            assetsType.setExistingNumber("0");
        }
        if(iAssetsTypeService.saveOrUpdate(assetsType)){
            return new ResultUtil<AssetsType>().setData(assetsType);
        }
        return ResultUtil.error();
    }

    @ApiOperation(value = "删除资产种类")
    @RequestMapping(value = "/delByIds", method = RequestMethod.POST)
    public Result<Object> delByIds(@RequestParam String[] ids){
        for(String id : ids){
            iAssetsTypeService.removeById(id);
        }
        return ResultUtil.success();
    }
}
