package cn.zwz.modules.insurance.controller;

import cn.zwz.common.utils.PageUtil;
import cn.zwz.common.utils.ResultUtil;
import cn.zwz.common.vo.PageVo;
import cn.zwz.common.vo.Result;
import cn.zwz.modules.insurance.entity.Insurance;
import cn.zwz.modules.insurance.service.IInsuranceService;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author 郑为中
 */
@Slf4j
@RestController
@Api(description = "医疗保险管理接口")
@RequestMapping("/zwz/insurance")
@Transactional
public class InsuranceController {

    @Autowired
    private IInsuranceService iInsuranceService;

    @RequestMapping(value = "/get/{id}", method = RequestMethod.GET)
    @ApiOperation(value = "通过id获取")
    public Result<Insurance> get(@PathVariable String id){

        Insurance insurance = iInsuranceService.getById(id);
        return new ResultUtil<Insurance>().setData(insurance);
    }

    @RequestMapping(value = "/getOne", method = RequestMethod.GET)
    @ApiOperation(value = "通过id获取")
    public Result<Insurance> getOne(@RequestParam String id){
        Insurance insurance = iInsuranceService.getById(id);
        return new ResultUtil<Insurance>().setData(insurance);
    }

    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    @ApiOperation(value = "获取全部数据")
    public Result<List<Insurance>> getAll(){

        List<Insurance> list = iInsuranceService.list();
        return new ResultUtil<List<Insurance>>().setData(list);
    }

    @RequestMapping(value = "/getByPage", method = RequestMethod.GET)
    @ApiOperation(value = "分页获取")
    public Result<IPage<Insurance>> getByPage(@ModelAttribute Insurance insurance,@ModelAttribute PageVo page){
        QueryWrapper<Insurance> qw =new QueryWrapper<Insurance>();
        if(StrUtil.isNotBlank(insurance.getName())) {
            qw.like("name", insurance.getName());
        }
        IPage<Insurance> data = iInsuranceService.page(PageUtil.initMpPage(page),qw);
        return new ResultUtil<IPage<Insurance>>().setData(data);
    }

    @RequestMapping(value = "/insertOrUpdate", method = RequestMethod.POST)
    @ApiOperation(value = "编辑或更新数据")
    public Result<Insurance> saveOrUpdate(Insurance insurance){

        if(iInsuranceService.saveOrUpdate(insurance)){
            return new ResultUtil<Insurance>().setData(insurance);
        }
        return new ResultUtil<Insurance>().setErrorMsg("操作失败");
    }

    @RequestMapping(value = "/delByIds", method = RequestMethod.POST)
    @ApiOperation(value = "批量通过id删除")
    public Result<Object> delAllByIds(@RequestParam String[] ids){

        for(String id : ids){
            iInsuranceService.removeById(id);
        }
        return ResultUtil.success("批量通过id删除数据成功");
    }
}
