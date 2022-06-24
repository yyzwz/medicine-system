package cn.zwz.insurance.controller;

import cn.hutool.core.date.DateUtil;
import cn.zwz.basics.utils.PageUtil;
import cn.zwz.basics.utils.ResultUtil;
import cn.zwz.basics.baseVo.PageVo;
import cn.zwz.basics.baseVo.Result;
import cn.zwz.data.utils.ZwzNullUtils;
import cn.zwz.insurance.entity.Examine;
import cn.zwz.insurance.entity.Roster;
import cn.zwz.insurance.entity.SeeDoctor;
import cn.zwz.insurance.service.IExamineService;
import cn.zwz.insurance.service.IRosterService;
import cn.zwz.insurance.service.ISeeDoctorService;
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
@Api(tags = "看病单管理接口")
@RequestMapping("/zwz/seeDoctor")
@Transactional
public class SeeDoctorController {

    @Autowired
    private ISeeDoctorService iSeeDoctorService;

    @Autowired
    private IRosterService iRosterService;

    @Autowired
    private IExamineService iExamineService;

    @RequestMapping(value = "/getOne", method = RequestMethod.GET)
    @ApiOperation(value = "查询单条看病单")
    public Result<SeeDoctor> get(@RequestParam String id){
        return new ResultUtil<SeeDoctor>().setData(iSeeDoctorService.getById(id));
    }

    @RequestMapping(value = "/count", method = RequestMethod.GET)
    @ApiOperation(value = "查询全部看病单个数")
    public Result<Long> getCount(){
        return new ResultUtil<Long>().setData(iSeeDoctorService.count());
    }

    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    @ApiOperation(value = "查询全部看病单")
    public Result<List<SeeDoctor>> getAll(){
        return new ResultUtil<List<SeeDoctor>>().setData(iSeeDoctorService.list());
    }

    @RequestMapping(value = "/getByPage", method = RequestMethod.GET)
    @ApiOperation(value = "查询看病单")
    public Result<IPage<SeeDoctor>> getByPage(@ModelAttribute SeeDoctor seeDoctor ,@ModelAttribute PageVo page){
        QueryWrapper<SeeDoctor> qw = new QueryWrapper<>();
        if(!ZwzNullUtils.isNull(seeDoctor.getCreateBy())) {
        }
        IPage<SeeDoctor> data = iSeeDoctorService.page(PageUtil.initMpPage(page),qw);
        return new ResultUtil<IPage<SeeDoctor>>().setData(data);
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    @ApiOperation(value = "新增看病")
    public Result<SeeDoctor> insert(SeeDoctor seeDoctor){
        Roster roster = iRosterService.getById(seeDoctor.getUserId());
        roster.setMoney(seeDoctor.getBalanceNew());
        iRosterService.saveOrUpdate(roster);
        seeDoctor.setDate(DateUtil.now());
        /**
         * 保险审核的业务逻辑
         */
        Examine examine = new Examine();
        examine.setUserId(roster.getId());
        examine.setUserName(roster.getName());
        examine.setInsuranceId(roster.getInsuranceType());
        examine.setInsuranceName(roster.getInsuranceName());
        examine.setMoney(seeDoctor.getPriceSum());
        examine.setStatus(0);
        examine.setMessage("未审核");
        iExamineService.saveOrUpdate(examine);

        iSeeDoctorService.saveOrUpdate(seeDoctor);
        return new ResultUtil<SeeDoctor>().setData(seeDoctor);
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ApiOperation(value = "编辑看病单")
    public Result<SeeDoctor> update(SeeDoctor seeDoctor){
        iSeeDoctorService.saveOrUpdate(seeDoctor);
        return new ResultUtil<SeeDoctor>().setData(seeDoctor);
    }

    @RequestMapping(value = "/delByIds", method = RequestMethod.POST)
    @ApiOperation(value = "删除看病单")
    public Result<Object> delByIds(@RequestParam String[] ids){
        for(String id : ids){
            iSeeDoctorService.removeById(id);
        }
        return ResultUtil.success();
    }
}
