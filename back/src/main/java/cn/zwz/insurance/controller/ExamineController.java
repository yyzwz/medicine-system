package cn.zwz.insurance.controller;

import cn.zwz.basics.utils.PageUtil;
import cn.zwz.basics.utils.ResultUtil;
import cn.zwz.basics.baseVo.PageVo;
import cn.zwz.basics.baseVo.Result;
import cn.zwz.data.utils.ZwzNullUtils;
import cn.zwz.insurance.entity.Examine;
import cn.zwz.insurance.entity.Roster;
import cn.zwz.insurance.service.IExamineService;
import cn.hutool.core.util.StrUtil;
import cn.zwz.insurance.service.IRosterService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;

/**
 * @author 郑为中
 */
@Slf4j
@RestController
@Api(tags = "保险审核单管理接口")
@RequestMapping("/zwz/examine")
@Transactional
public class ExamineController {

    @Autowired
    private IExamineService iExamineService;

    @Autowired
    private IRosterService iRosterService;

    @RequestMapping(value = "/getOne", method = RequestMethod.GET)
    @ApiOperation(value = "查询单条保险审核单")
    public Result<Examine> get(@RequestParam String id){
        return new ResultUtil<Examine>().setData(iExamineService.getById(id));
    }

    @RequestMapping(value = "/count", method = RequestMethod.GET)
    @ApiOperation(value = "查询全部保险审核单个数")
    public Result<Long> getCount(){
        return new ResultUtil<Long>().setData(iExamineService.count());
    }

    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    @ApiOperation(value = "查询全部保险审核单")
    public Result<List<Examine>> getAll(){
        return new ResultUtil<List<Examine>>().setData(iExamineService.list());
    }

    @RequestMapping(value = "/getByPage", method = RequestMethod.GET)
    @ApiOperation(value = "查询保险审核单")
    public Result<IPage<Examine>> getByPage(@ModelAttribute Examine examine ,@ModelAttribute PageVo page){
        QueryWrapper<Examine> qw = new QueryWrapper<>();
        if(!ZwzNullUtils.isNull(examine.getCreateBy())) {
        }
        IPage<Examine> data = iExamineService.page(PageUtil.initMpPage(page),qw);
        return new ResultUtil<IPage<Examine>>().setData(data);
    }

    @RequestMapping(value = "/insertOrUpdate", method = RequestMethod.POST)
    @ApiOperation(value = "增改保险审核单")
    public Result<Examine> saveOrUpdate(Examine examine){
        if(iExamineService.saveOrUpdate(examine)){
            return new ResultUtil<Examine>().setData(examine);
        }
        return ResultUtil.error();
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    @ApiOperation(value = "新增保险审核单")
    public Result<Examine> insert(Examine examine){
        iExamineService.saveOrUpdate(examine);
        return new ResultUtil<Examine>().setData(examine);
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ApiOperation(value = "编辑保险审核单")
    public Result<Examine> update(Examine examine){
        iExamineService.saveOrUpdate(examine);
        return new ResultUtil<Examine>().setData(examine);
    }

    @RequestMapping(value = "/delByIds", method = RequestMethod.POST)
    @ApiOperation(value = "删除保险审核单")
    public Result<Object> delByIds(@RequestParam String[] ids){
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
            examine.setStatus(1);
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
            examine.setStatus(2);
            examine.setMessage(msg);
            iExamineService.saveOrUpdate(examine);
            Roster roster = iRosterService.getById(examine.getUserId());
            if(roster != null){
                double nowMoney = roster.getMoney().doubleValue() - examine.getMoney().doubleValue();
                nowMoney = Math.floor(nowMoney * 100.0) / 100.0;
                roster.setMoney(BigDecimal.valueOf(nowMoney).setScale(2, RoundingMode.UP));
                iRosterService.saveOrUpdate(roster);
            }
            return ResultUtil.success("审核已拒绝");
        }else{
            return ResultUtil.error("审核单不存在");
        }
    }
}
