package cn.exrick.xboot.modules.your.controller;

import cn.exrick.xboot.common.utils.PageUtil;
import cn.exrick.xboot.common.utils.ResultUtil;
import cn.exrick.xboot.common.vo.PageVo;
import cn.exrick.xboot.common.vo.Result;
import cn.exrick.xboot.modules.your.entity.Insurance;
import cn.exrick.xboot.modules.your.entity.Roster;
import cn.exrick.xboot.modules.your.service.IInsuranceService;
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
 * @author 唐倩
 */
@Slf4j
@RestController
@Api(description = "医疗保险管理接口")
@RequestMapping("/xboot/insurance")
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
