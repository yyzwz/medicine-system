package cn.zwz.insurance.controller;

import cn.zwz.basics.baseVo.PageVo;
import cn.zwz.basics.baseVo.Result;
import cn.zwz.basics.utils.PageUtil;
import cn.zwz.basics.utils.ResultUtil;
import cn.zwz.data.utils.ZwzNullUtils;
import cn.zwz.insurance.entity.Examine;
import cn.zwz.insurance.entity.Insurance;
import cn.zwz.insurance.entity.Roster;
import cn.zwz.insurance.entity.SeeDoctor;
import cn.zwz.insurance.service.IExamineService;
import cn.zwz.insurance.service.IInsuranceService;
import cn.zwz.insurance.service.IRosterService;
import cn.zwz.insurance.service.ISeeDoctorService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * @author 郑为中
 */
@RestController
@Api(tags = "看病登记")
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
    @ApiOperation(value = "查询单个看病登记")
    public Result<SeeDoctor> get(@PathVariable String id){
        return new ResultUtil<SeeDoctor>().setData(iSeeDoctorService.getById(id));
    }

    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    @ApiOperation(value = "查询全部看病登记")
    public Result<List<SeeDoctor>> getAll(){
        return new ResultUtil<List<SeeDoctor>>().setData(iSeeDoctorService.list());
    }

    @RequestMapping(value = "/getByPage", method = RequestMethod.GET)
    @ApiOperation(value = "查询看病登记")
    public Result<IPage<SeeDoctor>> getByPage(@ModelAttribute SeeDoctor seeDoctor,@ModelAttribute PageVo page){
        QueryWrapper<SeeDoctor> qw =new QueryWrapper<SeeDoctor>();
        if(!ZwzNullUtils.isNull(seeDoctor.getType())) {
            qw.eq("type", seeDoctor.getType());
        }
        if(!ZwzNullUtils.isNull(seeDoctor.getUserName())) {
            qw.like("user_name", seeDoctor.getUserName());
        }
        return new ResultUtil<IPage<SeeDoctor>>().setData(iSeeDoctorService.page(PageUtil.initMpPage(page),qw));
    }

    @RequestMapping(value = "/insertOrUpdate", method = RequestMethod.POST)
    @ApiOperation(value = "增改看病登记")
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
        iSeeDoctorService.saveOrUpdate(seeDoctor);
        return ResultUtil.success();
    }

    @RequestMapping(value = "/delByIds", method = RequestMethod.POST)
    @ApiOperation(value = "删除看病登记")
    public Result<Object> delAllByIds(@RequestParam String[] ids){
        for(String id : ids){
            iSeeDoctorService.removeById(id);
        }
        return ResultUtil.success();
    }
}
