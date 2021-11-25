package cn.zwz.modules.insurance.controller;

import cn.zwz.common.utils.PageUtil;
import cn.zwz.common.utils.ResultUtil;
import cn.zwz.common.vo.PageVo;
import cn.zwz.common.vo.Result;
import cn.zwz.modules.insurance.entity.Examine;
import cn.zwz.modules.insurance.entity.Insurance;
import cn.zwz.modules.insurance.entity.Roster;
import cn.zwz.modules.insurance.entity.SeeDoctor;
import cn.zwz.modules.insurance.service.IExamineService;
import cn.zwz.modules.insurance.service.IInsuranceService;
import cn.zwz.modules.insurance.service.IRosterService;
import cn.zwz.modules.insurance.service.ISeeDoctorService;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * @author 郑为中
 */
@Slf4j
@RestController
@Api(description = "看病登记管理接口")
@RequestMapping("/zwz/seeDoctor")
@Transactional
public class SeeDoctorController {

    @Autowired
    private ISeeDoctorService iSeeDoctorService;

    @Autowired
    private IRosterService iRosterService;

    @Autowired
    private IExamineService iExamineService;

    @Autowired
    private IInsuranceService iInsuranceService;

    @RequestMapping(value = "/get/{id}", method = RequestMethod.GET)
    @ApiOperation(value = "通过id获取")
    public Result<SeeDoctor> get(@PathVariable String id){

        SeeDoctor seeDoctor = iSeeDoctorService.getById(id);
        return new ResultUtil<SeeDoctor>().setData(seeDoctor);
    }

    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    @ApiOperation(value = "获取全部数据")
    public Result<List<SeeDoctor>> getAll(){

        List<SeeDoctor> list = iSeeDoctorService.list();
        return new ResultUtil<List<SeeDoctor>>().setData(list);
    }

    @RequestMapping(value = "/getByPage", method = RequestMethod.GET)
    @ApiOperation(value = "分页获取")
    public Result<IPage<SeeDoctor>> getByPage(@ModelAttribute SeeDoctor seeDoctor,@ModelAttribute PageVo page){
        QueryWrapper<SeeDoctor> qw =new QueryWrapper<SeeDoctor>();
        if(StrUtil.isNotBlank(seeDoctor.getType())) {
            qw.eq("type", seeDoctor.getType());
        }
        if(StrUtil.isNotBlank(seeDoctor.getUserName())) {
            qw.like("user_name", seeDoctor.getUserName());
        }
        IPage<SeeDoctor> data = iSeeDoctorService.page(PageUtil.initMpPage(page),qw);
        return new ResultUtil<IPage<SeeDoctor>>().setData(data);
    }

    @RequestMapping(value = "/insertOrUpdate", method = RequestMethod.POST)
    @ApiOperation(value = "编辑或更新数据")
    public Result<SeeDoctor> saveOrUpdate(SeeDoctor seeDoctor){
        Date date = new Date();
        int year = date.getYear() + 1900;
        int mouth = date.getMonth() + 1;
        int day = date.getDate();
        seeDoctor.setDate(year + "-" + mouth + "-" + day);
        try{
            Roster roster = iRosterService.getById(seeDoctor.getUserId());
            roster.setBalance(seeDoctor.getBalanceNew());
            iRosterService.saveOrUpdate(roster);
            Examine examine = new Examine();
            examine.setUserId(seeDoctor.getUserId());
            examine.setUserName(seeDoctor.getUserName());
            Insurance insurance = iInsuranceService.getById(roster.getInsuranceType());
            examine.setInsuranceId(insurance.getId());
            examine.setInsuranceName(insurance.getName());
            double v = Double.parseDouble(seeDoctor.getPriceYou());
            double v1 = Double.parseDouble(seeDoctor.getPriceDiscount());
            examine.setMoney(v+v1+"");
            examine.setStatus("待审核");
            iExamineService.saveOrUpdate(examine);
        }catch (Exception e){
            return new ResultUtil<SeeDoctor>().setErrorMsg("参保人员不存在");
        }
        if(iSeeDoctorService.saveOrUpdate(seeDoctor)){
            return new ResultUtil<SeeDoctor>().setData(seeDoctor);
        }
        return new ResultUtil<SeeDoctor>().setErrorMsg("操作失败");
    }

    @RequestMapping(value = "/delByIds", method = RequestMethod.POST)
    @ApiOperation(value = "批量通过id删除")
    public Result<Object> delAllByIds(@RequestParam String[] ids){

        for(String id : ids){
            iSeeDoctorService.removeById(id);
        }
        return ResultUtil.success("批量通过id删除数据成功");
    }
}
