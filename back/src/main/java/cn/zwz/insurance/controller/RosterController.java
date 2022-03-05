package cn.zwz.insurance.controller;

import cn.zwz.basics.baseVo.PageVo;
import cn.zwz.basics.baseVo.Result;
import cn.zwz.basics.utils.PageUtil;
import cn.zwz.basics.utils.ResultUtil;
import cn.zwz.data.utils.ZwzNullUtils;
import cn.zwz.insurance.entity.Insurance;
import cn.zwz.insurance.entity.Roster;
import cn.zwz.insurance.service.IInsuranceService;
import cn.zwz.insurance.service.IRosterService;
import cn.zwz.insurance.utils.CityIdCardUtil;
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
@Api(tags = "参保人员")
@RequestMapping("/zwz/roster")
@Transactional
public class RosterController {

    @Autowired
    private IRosterService iRosterService;

    @Autowired
    private IInsuranceService iInsuranceService;

    @RequestMapping(value = "/sendMessage", method = RequestMethod.GET)
    @ApiOperation(value = "医保充值")
    public  Result<Object> sendWeChatTalkGroupMessages(@RequestParam String cid,@RequestParam String message){
        if(ZwzNullUtils.isNull(cid)){
            return ResultUtil.error("人员不存在");
        }
        if(ZwzNullUtils.isNull(message)){
            return ResultUtil.error("充值金额不合法");
        }
        try{
            double money = Double.parseDouble(message);
            Roster roster = iRosterService.getById(cid);
            if(roster == null){
                return ResultUtil.error("人员不存在");
            }
            String balance = roster.getBalance();
            double balanceNumber = Double.parseDouble(balance);
            balanceNumber += money;
            roster.setBalance(balanceNumber + "");
            iRosterService.saveOrUpdate(roster);
            return ResultUtil.success("充值成功");
        }catch (Exception e){
            return ResultUtil.error("充值失败");
        }
    }

    @RequestMapping(value = "/get/{id}", method = RequestMethod.GET)
    @ApiOperation(value = "查询单个参保人员A")
    public Result<Roster> get(@PathVariable String id){
        return new ResultUtil<Roster>().setData(iRosterService.getById(id));
    }

    @RequestMapping(value = "/getOne", method = RequestMethod.GET)
    @ApiOperation(value = "查询单个参保人员B")
    public Result<Roster> getOne(@RequestParam String id){
        return new ResultUtil<Roster>().setData(iRosterService.getById(id));
    }

    @RequestMapping(value = "/fu", method = RequestMethod.GET)
    @ApiOperation(value = "启用参保人员")
    public Result<Roster> fu(@RequestParam String id){
        Roster roster = iRosterService.getById(id);
        roster.setStatus("0");
        iRosterService.saveOrUpdate(roster);
        return new ResultUtil<Roster>().setData(roster);
    }

    @RequestMapping(value = "/tui", method = RequestMethod.GET)
    @ApiOperation(value = "禁用参保人员")
    public Result<Roster> tui(@RequestParam String id){
        Roster roster = iRosterService.getById(id);
        roster.setStatus("-1");
        iRosterService.saveOrUpdate(roster);
        return new ResultUtil<Roster>().setData(roster);
    }

    @RequestMapping(value = "/deleteOne", method = RequestMethod.GET)
    @ApiOperation(value = "删除单个参保人员")
    public Result<Object> deleteOne(@RequestParam String id){
        Roster roster = iRosterService.getById(id);
        if(roster != null){
            iRosterService.removeById(roster.getId());
        }
        return ResultUtil.success("删除成功");
    }

    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    @ApiOperation(value = "查询全部参保人员")
    public Result<List<Roster>> getAll(){
        return new ResultUtil<List<Roster>>().setData(iRosterService.list());
    }

    @RequestMapping(value = "/getByPage", method = RequestMethod.GET)
    @ApiOperation(value = "查询参保人员")
    public Result<IPage<Roster>> getByPage(@ModelAttribute Roster roster,@ModelAttribute PageVo page){
        QueryWrapper<Roster> qw =new QueryWrapper<Roster>();
        if(!ZwzNullUtils.isNull(roster.getName())) {
            qw.like("name", roster.getName());
        }
        if(!ZwzNullUtils.isNull(roster.getIdentity())) {
            qw.like("identity", roster.getIdentity());
        }
        return new ResultUtil<IPage<Roster>>().setData(iRosterService.page(PageUtil.initMpPage(page),qw));
    }

    @RequestMapping(value = "/insertOrUpdate", method = RequestMethod.POST)
    @ApiOperation(value = "增改参保人员")
    public Result<Roster> saveOrUpdate(Roster roster){
        if(ZwzNullUtils.isNull(roster.getBalance())) {
            roster.setBalance("0");
        }
        if(ZwzNullUtils.isNull(roster.getStatus())) {
            roster.setStatus("0");
        }
        String identity = roster.getIdentity();
        if(identity.length() != 18){
            return new ResultUtil<Roster>().setErrorMsg("身份证长度错误");
        } else {
            try{
                int sexFlag = Integer.parseInt(identity.substring(16, 17));
                if(sexFlag % 2 == 0){
                    roster.setSex("女");
                }else{
                    roster.setSex("男");
                }
                int ageFlag = 1901 + new Date().getYear() - Integer.parseInt(identity.substring(6,10));
                roster.setAge(ageFlag + "");
                String nativePlace = CityIdCardUtil.getNativePlace(identity.substring(0, 6));
                roster.setNativePlace(nativePlace);
            }catch (Exception e){
                return new ResultUtil<Roster>().setErrorMsg("身份证号码错误");
            }
        }
        Insurance insurance = iInsuranceService.getById(roster.getInsuranceType());
        if(insurance != null){
            roster.setInsuranceName(insurance.getName());
        }
        iRosterService.saveOrUpdate(roster);
        return ResultUtil.success();
    }

    @RequestMapping(value = "/delByIds", method = RequestMethod.POST)
    @ApiOperation(value = "删除参保人员")
    public Result<Object> delAllByIds(@RequestParam String[] ids){
        for(String id : ids){
            iRosterService.removeById(id);
        }
        return ResultUtil.success();
    }
}
