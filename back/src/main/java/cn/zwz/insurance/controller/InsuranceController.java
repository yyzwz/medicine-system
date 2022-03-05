package cn.zwz.insurance.controller;

import cn.zwz.basics.baseVo.PageVo;
import cn.zwz.basics.baseVo.Result;
import cn.zwz.basics.utils.PageUtil;
import cn.zwz.basics.utils.ResultUtil;
import cn.zwz.data.utils.ZwzNullUtils;
import cn.zwz.insurance.entity.Insurance;
import cn.zwz.insurance.service.IInsuranceService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author 郑为中
 */
@RestController
@Api(tags = "医疗保险")
@RequestMapping("/zwz/insurance")
@Transactional
public class InsuranceController {

    @Autowired
    private IInsuranceService iInsuranceService;

    @RequestMapping(value = "/get/{id}", method = RequestMethod.GET)
    @ApiOperation(value = "查询单个保险A")
    public Result<Insurance> get(@PathVariable String id){
        return new ResultUtil<Insurance>().setData(iInsuranceService.getById(id));
    }

    @RequestMapping(value = "/getOne", method = RequestMethod.GET)
    @ApiOperation(value = "查询单个保险B")
    public Result<Insurance> getOne(@RequestParam String id){
        return new ResultUtil<Insurance>().setData(iInsuranceService.getById(id));
    }

    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    @ApiOperation(value = "查询全部保险")
    public Result<List<Insurance>> getAll(){
        return new ResultUtil<List<Insurance>>().setData(iInsuranceService.list());
    }

    @RequestMapping(value = "/getByPage", method = RequestMethod.GET)
    @ApiOperation(value = "查询保险")
    public Result<IPage<Insurance>> getByPage(@ModelAttribute Insurance insurance,@ModelAttribute PageVo page){
        QueryWrapper<Insurance> qw =new QueryWrapper<Insurance>();
        if(!ZwzNullUtils.isNull(insurance.getName())) {
            qw.like("name", insurance.getName());
        }
        return new ResultUtil<IPage<Insurance>>().setData(iInsuranceService.page(PageUtil.initMpPage(page),qw));
    }

    @RequestMapping(value = "/insertOrUpdate", method = RequestMethod.POST)
    @ApiOperation(value = "增改保险")
    public Result<Insurance> saveOrUpdate(Insurance insurance){
        iInsuranceService.saveOrUpdate(insurance);
        return ResultUtil.success();
    }

    @RequestMapping(value = "/delByIds", method = RequestMethod.POST)
    @ApiOperation(value = "删除保险")
    public Result<Object> delAllByIds(@RequestParam String[] ids){
        for(String id : ids){
            iInsuranceService.removeById(id);
        }
        return ResultUtil.success();
    }
}
