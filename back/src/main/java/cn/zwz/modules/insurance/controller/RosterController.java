package cn.zwz.modules.insurance.controller;

import cn.zwz.common.utils.PageUtil;
import cn.zwz.common.utils.ResultUtil;
import cn.zwz.common.vo.PageVo;
import cn.zwz.common.vo.Result;
import cn.zwz.modules.insurance.entity.Insurance;
import cn.zwz.modules.insurance.entity.Roster;
import cn.zwz.modules.insurance.service.IInsuranceService;
import cn.zwz.modules.insurance.service.IRosterService;
import cn.zwz.modules.insurance.utils.CityIdCardUtil;
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
@Api(tags = "参保人员接口")
@RequestMapping("/zwz/roster")
@Transactional
public class RosterController {

    @Autowired
    private IRosterService iRosterService;

    @Autowired
    private IInsuranceService iInsuranceService;

    @RequestMapping(value = "/sendMessage", method = RequestMethod.GET)
    @ApiOperation(value = "发送群聊消息")
    public  Result<Object> sendWeChatTalkGroupMessages(@RequestParam String cid,@RequestParam String message){
        if(!StrUtil.isNotBlank(cid)){
            return ResultUtil.error("人员不存在");
        }
        if(!StrUtil.isNotBlank(message)){
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
    @ApiOperation(value = "通过id获取")
    public Result<Roster> get(@PathVariable String id){

        Roster roster = iRosterService.getById(id);
        return new ResultUtil<Roster>().setData(roster);
    }

    @RequestMapping(value = "/getOne", method = RequestMethod.GET)
    @ApiOperation(value = "通过id获取")
    public Result<Roster> getOne(@RequestParam String id){
        Roster roster = iRosterService.getById(id);
        return new ResultUtil<Roster>().setData(roster);
    }

    @RequestMapping(value = "/fu", method = RequestMethod.GET)
    @ApiOperation(value = "通过id获取")
    public Result<Roster> fu(@RequestParam String id){
        Roster roster = iRosterService.getById(id);
        roster.setStatus("0");
        iRosterService.saveOrUpdate(roster);
        return new ResultUtil<Roster>().setData(roster);
    }

    @RequestMapping(value = "/tui", method = RequestMethod.GET)
    @ApiOperation(value = "通过id获取")
    public Result<Roster> tui(@RequestParam String id){
        Roster roster = iRosterService.getById(id);
        roster.setStatus("-1");
        iRosterService.saveOrUpdate(roster);
        return new ResultUtil<Roster>().setData(roster);
    }

    @RequestMapping(value = "/deleteOne", method = RequestMethod.GET)
    @ApiOperation(value = "通过id获取")
    public Result<Object> deleteOne(@RequestParam String id){
        Roster roster = iRosterService.getById(id);
        if(roster != null){
            iRosterService.removeById(roster.getId());
        }
        return ResultUtil.success("删除成功");
    }

    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    @ApiOperation(value = "获取全部数据")
    public Result<List<Roster>> getAll(){

        List<Roster> list = iRosterService.list();
        return new ResultUtil<List<Roster>>().setData(list);
    }

    @RequestMapping(value = "/getByPage", method = RequestMethod.GET)
    @ApiOperation(value = "分页获取")
    public Result<IPage<Roster>> getByPage(@ModelAttribute Roster roster,@ModelAttribute PageVo page){
        QueryWrapper<Roster> qw =new QueryWrapper<Roster>();
        if(StrUtil.isNotBlank(roster.getName())) {
            qw.like("name", roster.getName());
        }
        if(StrUtil.isNotBlank(roster.getIdentity())) {
            qw.like("identity", roster.getIdentity());
        }
        IPage<Roster> data = iRosterService.page(PageUtil.initMpPage(page),qw);
        return new ResultUtil<IPage<Roster>>().setData(data);
    }

    @RequestMapping(value = "/insertOrUpdate", method = RequestMethod.POST)
    @ApiOperation(value = "编辑或更新数据")
    public Result<Roster> saveOrUpdate(Roster roster){
        if(roster.getBalance() == null || roster.getBalance().equals("") ||roster.getBalance().equals("null") ||roster.getBalance().equals("undefined"))
            roster.setBalance("0");
        if(roster.getStatus() == null || roster.getStatus().equals("") ||roster.getStatus().equals("null") ||roster.getStatus().equals("undefined"))
            roster.setStatus("0");
        String identity = roster.getIdentity();
        if(identity.length() != 18){
            return new ResultUtil<Roster>().setErrorMsg("身份证长度错误");
        }else{
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
        if(iRosterService.saveOrUpdate(roster)){
            return new ResultUtil<Roster>().setData(roster);
        }
        return new ResultUtil<Roster>().setErrorMsg("操作失败");
    }

    @RequestMapping(value = "/delByIds", method = RequestMethod.POST)
    @ApiOperation(value = "批量通过id删除")
    public Result<Object> delAllByIds(@RequestParam String[] ids){

        for(String id : ids){
            iRosterService.removeById(id);
        }
        return ResultUtil.success("批量通过id删除数据成功");
    }
}
