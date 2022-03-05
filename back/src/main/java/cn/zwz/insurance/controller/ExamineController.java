package cn.zwz.insurance.controller;

import cn.zwz.basics.baseVo.PageVo;
import cn.zwz.basics.baseVo.Result;
import cn.zwz.basics.utils.PageUtil;
import cn.zwz.basics.utils.ResultUtil;
import cn.zwz.data.utils.ZwzNullUtils;
import cn.zwz.insurance.entity.Examine;
import cn.zwz.insurance.entity.Roster;
import cn.zwz.insurance.service.IExamineService;
import cn.zwz.insurance.service.IRosterService;
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
@Api(tags = "保险审核")
@RequestMapping("/zwz/examine")
@Transactional
public class ExamineController {

    @Autowired
    private IExamineService iExamineService;

    @Autowired
    private IRosterService iRosterService;

    @RequestMapping(value = "/get/{id}", method = RequestMethod.GET)
    @ApiOperation(value = "查询单个保险单")
    public Result<Examine> get(@PathVariable String id){
        return new ResultUtil<Examine>().setData(iExamineService.getById(id));
    }

    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    @ApiOperation(value = "查询全部保险单")
    public Result<List<Examine>> getAll(){
        return new ResultUtil<List<Examine>>().setData(iExamineService.list());
    }

    @RequestMapping(value = "/getByPage", method = RequestMethod.GET)
    @ApiOperation(value = "查询保险单")
    public Result<IPage<Examine>> getByPage(@ModelAttribute Examine examine,@ModelAttribute PageVo page){
        QueryWrapper<Examine> qw =new QueryWrapper<Examine>();
        if(!ZwzNullUtils.isNull(examine.getUserName())) {
            qw.like("user_name", examine.getUserName());
        }
        if(!ZwzNullUtils.isNull(examine.getStatus())) {
            qw.eq("status", examine.getStatus());
        }
        return new ResultUtil<IPage<Examine>>().setData(iExamineService.page(PageUtil.initMpPage(page),qw));
    }

    @RequestMapping(value = "/insertOrUpdate", method = RequestMethod.POST)
    @ApiOperation(value = "增改保险单")
    public Result<Examine> saveOrUpdate(Examine examine){
        iExamineService.saveOrUpdate(examine);
        return ResultUtil.success();
    }

    @RequestMapping(value = "/delByIds", method = RequestMethod.POST)
    @ApiOperation(value = "删除保险单")
    public Result<Object> delAllByIds(@RequestParam String[] ids){
        for(String id : ids){
            iExamineService.removeById(id);
        }
        return ResultUtil.success();
    }
    @RequestMapping(value = "/pass", method = RequestMethod.POST)
    @ApiOperation(value = "通过保险单")
    public Result<Object> pass(@RequestParam String id){
        if(!ZwzNullUtils.isNull(id)) {
            Examine examine = iExamineService.getById(id);
            if(examine == null){
                return ResultUtil.error("审核单不存在");
            }
            examine.setMessage("审核通过,已报销!");
            examine.setStatus("审核通过");
            iExamineService.saveOrUpdate(examine);
            return ResultUtil.success("通过成功");
        }else{
            return ResultUtil.error("审核单不存在");
        }
    }

    @RequestMapping(value = "/notPass", method = RequestMethod.POST)
    @ApiOperation(value = "驳回保险单")
    public Result<Object> notPass(@RequestParam String id,@RequestParam String msg){
        if(!ZwzNullUtils.isNull(id)) {
            Examine examine = iExamineService.getById(id);
            if(examine == null){
                return ResultUtil.error("审核单不存在");
            }
            examine.setStatus("审核不通过");
            examine.setMessage(msg);
            iExamineService.saveOrUpdate(examine);
            Roster roster = iRosterService.getById(examine.getUserId());
            if(roster != null){
                double nowMoney = Double.parseDouble(roster.getBalance()) - Double.parseDouble(examine.getMoney());
                nowMoney = Math.floor(nowMoney * 100.0) / 100.0;
                roster.setBalance(nowMoney + "");
                iRosterService.saveOrUpdate(roster);
            }
            return ResultUtil.success("审核已拒绝");
        }else{
            return ResultUtil.error("审核单不存在");
        }
    }
}
