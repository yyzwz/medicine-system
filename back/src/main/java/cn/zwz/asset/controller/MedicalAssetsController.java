package cn.zwz.asset.controller;

import cn.hutool.core.util.StrUtil;
import cn.zwz.asset.entity.MedicalAssets;
import cn.zwz.asset.service.IMedicalAssetsService;
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
@Api(tags = "医用设备档案")
@RequestMapping("/zwz/medicalAssets")
@Transactional
public class MedicalAssetsController {

    @Autowired
    private IMedicalAssetsService iMedicalAssetsService;

    @ApiOperation(value = "查询行政耗材品类")
    @RequestMapping(value = "/getByPage", method = RequestMethod.GET)
    public Result<IPage<MedicalAssets>> getByPage(@ModelAttribute MedicalAssets MedicalAssets, @ModelAttribute PageVo page, @RequestParam(required = false) String natureType) {
        QueryWrapper<MedicalAssets> qw = new QueryWrapper<>();
        if(StrUtil.isNotBlank(natureType)) {
            if(natureType.equals("1")){
                qw.eq("nature", "固定资产");
            }else{
                qw.eq("nature", "耗材");
            }
        }
        if(!ZwzNullUtils.isNull(MedicalAssets.getNature())) {
            qw.eq("nature", MedicalAssets.getNature());
        }
        if(!ZwzNullUtils.isNull(MedicalAssets.getAssetName())) {
            qw.like("asset_name", MedicalAssets.getAssetName());
        }
        return new ResultUtil<IPage<MedicalAssets>>().setData(iMedicalAssetsService.page(PageUtil.initMpPage(page),qw));
    }

    @ApiOperation(value = "增改资产种类")
    @RequestMapping(value = "/insertOrUpdate", method = RequestMethod.POST)
    public Result<MedicalAssets> saveOrUpdate(MedicalAssets medicalAssets){
        if(medicalAssets.getNumber() == null){
            medicalAssets.setNumber(BigDecimal.ZERO);
            medicalAssets.setTotalPrice(BigDecimal.ZERO);
        }
        if(medicalAssets.getExistingNumber() == null){
            medicalAssets.setExistingNumber(BigDecimal.ZERO);
        }
        if(iMedicalAssetsService.saveOrUpdate(medicalAssets)){
            return new ResultUtil<MedicalAssets>().setData(medicalAssets);
        }
        return ResultUtil.error();
    }

    @ApiOperation(value = "删除资产种类")
    @RequestMapping(value = "/delByIds", method = RequestMethod.POST)
    public Result<Object> delByIds(@RequestParam String[] ids){
        for(String id : ids){
            MedicalAssets asset = iMedicalAssetsService.getById(id);
            if(asset != null) {
                if(asset.getExistingNumber().compareTo(BigDecimal.ZERO) > 0) {
                    return ResultUtil.error("该资产还有库存，不能删除");
                }
                iMedicalAssetsService.removeById(id);
            }
        }
        return ResultUtil.success();
    }
}
