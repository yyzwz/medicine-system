package cn.exrick.xboot.modules.your.controller;

import cn.exrick.xboot.common.utils.PageUtil;
import cn.exrick.xboot.common.utils.ResultUtil;
import cn.exrick.xboot.common.vo.PageVo;
import cn.exrick.xboot.common.vo.Result;
import cn.exrick.xboot.modules.your.entity.Examine;
import cn.exrick.xboot.modules.your.entity.Insurance;
import cn.exrick.xboot.modules.your.entity.Roster;
import cn.exrick.xboot.modules.your.service.IExamineService;
import cn.exrick.xboot.modules.your.service.IRosterService;
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
@Api(description = "保险审核管理接口")
@RequestMapping("/xboot/examine")
@Transactional
public class ExamineController {

    @Autowired
    private IExamineService iExamineService;

    @Autowired
    private IRosterService iRosterService;

    @RequestMapping(value = "/get/{id}", method = RequestMethod.GET)
    @ApiOperation(value = "通过id获取")
    public Result<Examine> get(@PathVariable String id){

        Examine examine = iExamineService.getById(id);
        return new ResultUtil<Examine>().setData(examine);
    }

    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    @ApiOperation(value = "获取全部数据")
    public Result<List<Examine>> getAll(){

        List<Examine> list = iExamineService.list();
        return new ResultUtil<List<Examine>>().setData(list);
    }

    @RequestMapping(value = "/getByPage", method = RequestMethod.GET)
    @ApiOperation(value = "分页获取")
    public Result<IPage<Examine>> getByPage(@ModelAttribute Examine examine,@ModelAttribute PageVo page){
        QueryWrapper<Examine> qw =new QueryWrapper<Examine>();
        if(StrUtil.isNotBlank(examine.getUserName())) {
            qw.like("user_name", examine.getUserName());
        }
        if(StrUtil.isNotBlank(examine.getStatus())) {
            qw.eq("status", examine.getStatus());
        }
        IPage<Examine> data = iExamineService.page(PageUtil.initMpPage(page),qw);
        return new ResultUtil<IPage<Examine>>().setData(data);
    }

    @RequestMapping(value = "/insertOrUpdate", method = RequestMethod.POST)
    @ApiOperation(value = "编辑或更新数据")
    public Result<Examine> saveOrUpdate(Examine examine){

        if(iExamineService.saveOrUpdate(examine)){
            return new ResultUtil<Examine>().setData(examine);
        }
        return new ResultUtil<Examine>().setErrorMsg("操作失败");
    }

    @RequestMapping(value = "/delByIds", method = RequestMethod.POST)
    @ApiOperation(value = "批量通过id删除")
    public Result<Object> delAllByIds(@RequestParam String[] ids){

        for(String id : ids){
            iExamineService.removeById(id);
        }
        return ResultUtil.success("批量通过id删除数据成功");
    }
    @RequestMapping(value = "/pass", method = RequestMethod.POST)
    @ApiOperation(value = "批量通过id删除")
    public Result<Object> pass(@RequestParam String id){
        if(StrUtil.isNotBlank(id)) {
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
    @ApiOperation(value = "批量通过id删除")
    public Result<Object> notPass(@RequestParam String id,@RequestParam String msg){
        if(StrUtil.isNotBlank(id)) {
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
