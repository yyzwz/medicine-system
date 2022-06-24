package cn.zwz.insurance.controller;

import cn.zwz.basics.redis.RedisTemplateHelper;
import cn.zwz.basics.utils.PageUtil;
import cn.zwz.basics.utils.ResultUtil;
import cn.zwz.basics.baseVo.PageVo;
import cn.zwz.basics.baseVo.Result;
import cn.zwz.data.utils.ZwzNullUtils;
import cn.zwz.insurance.entity.Insurance;
import cn.zwz.insurance.entity.Roster;
import cn.zwz.insurance.service.IInsuranceService;
import cn.zwz.insurance.service.IRosterService;
import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Objects;

/**
 * @author 郑为中
 */
@Slf4j
@RestController
@Api(tags = "参保人员管理接口")
@RequestMapping("/zwz/roster")
@Transactional
public class RosterController {

    @Autowired
    private IRosterService iRosterService;

    @Autowired
    private IInsuranceService iInsuranceService;

    @Autowired
    private RedisTemplateHelper redisTemplateHelper;

    private static final String ROSTER_DELETE_PRE = "ROSTER_DELETE_PRE:";

    @RequestMapping(value = "/getOneNumber", method = RequestMethod.GET)
    @ApiOperation(value = "查询单条参保人员的余额")
    public Result<BigDecimal> getOneNumber(@RequestParam String id){
        Roster roster = iRosterService.getById(id);
        if(roster == null) {
            return ResultUtil.error("参保人员不存在");
        }
        return new ResultUtil<BigDecimal>().setData(roster.getMoney());
    }

    @RequestMapping(value = "/disableCard", method = RequestMethod.GET)
    @ApiOperation(value = "封存社保卡")
    public Result<BigDecimal> disableCard(@RequestParam String id){
        Roster roster = iRosterService.getById(id);
        if(roster == null) {
            return ResultUtil.error("参保人员不存在");
        }
        if(Objects.equals(1,roster.getCardStatus())) {
            return ResultUtil.error("社保卡已处于封存状态");
        }
        roster.setCardStatus(1);
        iRosterService.saveOrUpdate(roster);
        return new ResultUtil<BigDecimal>().setData(roster.getMoney());
    }

    @RequestMapping(value = "/enableCard", method = RequestMethod.GET)
    @ApiOperation(value = "解封社保卡")
    public Result<BigDecimal> enableCard(@RequestParam String id){
        Roster roster = iRosterService.getById(id);
        if(roster == null) {
            return ResultUtil.error("参保人员不存在");
        }
        if(Objects.equals(0,roster.getCardStatus())) {
            return ResultUtil.error("社保卡未被封存");
        }
        roster.setCardStatus(0);
        iRosterService.saveOrUpdate(roster);
        return new ResultUtil<BigDecimal>().setData(roster.getMoney());
    }

    @RequestMapping(value = "/addMoney", method = RequestMethod.GET)
    @ApiOperation(value = "医保卡充值")
    public Result<BigDecimal> addMoney(@RequestParam String id,@RequestParam float number){
        Roster roster = iRosterService.getById(id);
        if(roster == null) {
            return ResultUtil.error("参保人员不存在");
        }
        if(roster.getMoney() == null) {
            roster.setMoney(BigDecimal.ZERO);
        }
        roster.setMoney(roster.getMoney().add(BigDecimal.valueOf(number)));
        iRosterService.saveOrUpdate(roster);
        return new ResultUtil<BigDecimal>().setData(roster.getMoney());
    }

    @RequestMapping(value = "/getOne", method = RequestMethod.GET)
    @ApiOperation(value = "查询单条参保人员")
    public Result<Roster> get(@RequestParam String id){
        return new ResultUtil<Roster>().setData(iRosterService.getById(id));
    }

    @RequestMapping(value = "/getOneByIdCard", method = RequestMethod.GET)
    @ApiOperation(value = "按身份证查询单个参保人员")
    public Result<Roster> getOneByIdCard(@RequestParam String idCard){
        QueryWrapper<Roster> qw = new QueryWrapper<>();
        qw.eq("id_card",idCard);
        return new ResultUtil<Roster>().setData(iRosterService.getOne(qw));
    }

    @RequestMapping(value = "/count", method = RequestMethod.GET)
    @ApiOperation(value = "查询全部参保人员个数")
    public Result<Long> getCount(){
        return new ResultUtil<Long>().setData(iRosterService.count());
    }

    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    @ApiOperation(value = "查询全部参保人员")
    public Result<List<Roster>> getAll(){
        return new ResultUtil<List<Roster>>().setData(iRosterService.list());
    }

    @RequestMapping(value = "/getByPage", method = RequestMethod.GET)
    @ApiOperation(value = "查询参保人员")
    public Result<IPage<Roster>> getByPage(@ModelAttribute Roster roster ,@ModelAttribute PageVo page){
        QueryWrapper<Roster> qw = new QueryWrapper<>();
        if(!ZwzNullUtils.isNull(roster.getName())) {
            qw.like("name",roster.getName());
        }
        if(!ZwzNullUtils.isNull(roster.getSex())) {
            qw.eq("sex",roster.getSex());
        }
        if(roster.getAge() != null) {
            qw.ge("sex",roster.getSex());
        }
        if(roster.getMoney() != null) {
            qw.le("money",roster.getMoney());
        }
        IPage<Roster> data = iRosterService.page(PageUtil.initMpPage(page),qw);
        return new ResultUtil<IPage<Roster>>().setData(data);
    }

    @RequestMapping(value = "/insertOrUpdate", method = RequestMethod.POST)
    @ApiOperation(value = "增改参保人员")
    public Result<Roster> saveOrUpdate(Roster roster){
        if(iRosterService.saveOrUpdate(roster)){
            return new ResultUtil<Roster>().setData(roster);
        }
        return ResultUtil.error();
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    @ApiOperation(value = "新增参保人员")
    public Result<Roster> insert(Roster roster){
        roster = checkInsurance(roster);
        iRosterService.save(roster);
        return new ResultUtil<Roster>().setData(roster);
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ApiOperation(value = "编辑参保人员")
    public Result<Roster> update(Roster roster){
        roster = checkInsurance(roster);
        iRosterService.saveOrUpdate(roster);
        return new ResultUtil<Roster>().setData(roster);
    }

    @RequestMapping(value = "/delByIds", method = RequestMethod.POST)
    @ApiOperation(value = "删除参保人员")
    public Result<Object> delByIds(@RequestParam String[] ids){
        for(String id : ids){
            Roster roster = iRosterService.getById(id);
            if(roster != null) {
                redisTemplateHelper.set(ROSTER_DELETE_PRE + roster.getIdCard(), JSON.toJSONString(roster));
                iRosterService.removeById(id);
            }
        }
        return ResultUtil.success();
    }

    @RequestMapping(value = "/disDelByIds", method = RequestMethod.GET)
    @ApiOperation(value = "恢复参保人员")
    public Result<Object> disDelByIds(@RequestParam String idCard){
        String str = redisTemplateHelper.get(ROSTER_DELETE_PRE + idCard);
        if(ZwzNullUtils.isNull(str)) {
            return ResultUtil.error("缓存数据失效，恢复失败");
        }
        Roster oldRoster = JSONObject.parseObject(str, Roster.class);
        iRosterService.saveOrUpdate(oldRoster);
        return ResultUtil.success();
    }

    @RequestMapping(value = "/disableOne", method = RequestMethod.GET)
    @ApiOperation(value = "禁用参保人员")
    public Result<Object> disableOne(@RequestParam String id){
        Roster roster = iRosterService.getById(id);
        if(roster == null) {
            return ResultUtil.error("参保人员不存在");
        }
        if(Objects.equals(1,roster.getStatus())) {
            return ResultUtil.error("参保人员已被禁用");
        }
        roster.setStatus(1);
        iRosterService.saveOrUpdate(roster);
        return ResultUtil.success();
    }

    @RequestMapping(value = "/enableOne", method = RequestMethod.GET)
    @ApiOperation(value = "启用参保人员")
    public Result<Object> enableOne(@RequestParam String id){
        Roster roster = iRosterService.getById(id);
        if(roster == null) {
            return ResultUtil.error("参保人员不存在");
        }
        if(Objects.equals(0,roster.getStatus())) {
            return ResultUtil.error("参保人员已启用");
        }
        roster.setStatus(0);
        iRosterService.saveOrUpdate(roster);
        return ResultUtil.success();
    }

    @ApiOperation(value = "参保人员导入")
    @RequestMapping(value = "/importRoster", method = RequestMethod.POST)
    public Result<Object> importRoster(@RequestBody List<Roster> rosterList){
        iRosterService.saveOrUpdateBatch(rosterList);
        return ResultUtil.success();
    }

    @ApiOperation(value = "参保人员导出")
    @RequestMapping(value = "/budget_exportData", method = RequestMethod.GET)
    public void export(HttpServletResponse response) throws IOException {
        List<Roster> rosterList = iRosterService.list();
        SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //创建一个新的Excel
        HSSFWorkbook workBook = new HSSFWorkbook();
        //创建sheet页
        HSSFSheet sheet = workBook.createSheet("参保人员导出");
        //设置第一行为Header
        HSSFRow row = sheet.createRow(0);
        HSSFCell cell0 = row.createCell(0);
        HSSFCell cell1 = row.createCell(1);
        HSSFCell cell2 = row.createCell(2);
        HSSFCell cell3 = row.createCell(3);
        cell0.setCellValue("编号");
        cell1.setCellValue("姓名");
        cell2.setCellValue("性别");
        cell3.setCellValue("身份证");
        for (int i = 0 ; i < rosterList.size() ; i ++) {
            Roster roster = rosterList.get(i);
            row = sheet.createRow(i + 1);
            // 创建
            cell0 = row.createCell(0);
            cell1 = row.createCell(1);
            cell2 = row.createCell(2);
            cell3 = row.createCell(3);
            // 写值
            cell0.setCellValue(roster.getId());
            cell1.setCellValue(roster.getName());
            cell2.setCellValue(roster.getSex());
            cell3.setCellValue(roster.getIdCard());
            // 设置列宽
            sheet.setColumnWidth(0, 6000);
            sheet.setColumnWidth(1, 6000);
            sheet.setColumnWidth(2, 6000);
            sheet.setColumnWidth(3, 6000);
        }
        response.reset();
        response.setContentType("application/msexcel;charset=UTF-8");
        response.addHeader("Content-Disposition", "attachment;filename=rosterList.xls");
        OutputStream out = response.getOutputStream();
        workBook.write(out);
        out.flush();
        out.close();
    }

    @ApiOperation(value = "社保卡余额导出")
    @RequestMapping(value = "/exportMoney", method = RequestMethod.GET)
    public void exportMoney(HttpServletResponse response) throws IOException {
        List<Roster> rosterList = iRosterService.list();
        SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //创建一个新的Excel
        HSSFWorkbook workBook = new HSSFWorkbook();
        //创建sheet页
        HSSFSheet sheet = workBook.createSheet("社保卡余额导出");
        //设置第一行为Header
        HSSFRow row = sheet.createRow(0);
        HSSFCell cell0 = row.createCell(0);
        HSSFCell cell1 = row.createCell(1);
        HSSFCell cell2 = row.createCell(2);
        HSSFCell cell3 = row.createCell(3);
        cell0.setCellValue("编号");
        cell1.setCellValue("姓名");
        cell2.setCellValue("社保卡状态");
        cell3.setCellValue("余额");
        for (int i = 0 ; i < rosterList.size() ; i ++) {
            Roster roster = rosterList.get(i);
            row = sheet.createRow(i + 1);
            // 创建
            cell0 = row.createCell(0);
            cell1 = row.createCell(1);
            cell2 = row.createCell(2);
            cell3 = row.createCell(3);
            // 写值
            cell0.setCellValue(roster.getId());
            cell1.setCellValue(roster.getName());
            cell2.setCellValue(Objects.equals(0,roster.getCardStatus()) ? "正常" : "封存");
            cell3.setCellValue(roster.getMoney().toString());
            // 设置列宽
            sheet.setColumnWidth(0, 6000);
            sheet.setColumnWidth(1, 6000);
            sheet.setColumnWidth(2, 6000);
            sheet.setColumnWidth(3, 6000);
        }
        response.reset();
        response.setContentType("application/msexcel;charset=UTF-8");
        response.addHeader("Content-Disposition", "attachment;filename=cardList.xls");
        OutputStream out = response.getOutputStream();
        workBook.write(out);
        out.flush();
        out.close();
    }

    @ApiOperation(value = "判断参保人员的保险")
    private Roster checkInsurance(Roster roster) {
        if(!ZwzNullUtils.isNull(roster.getInsuranceType())) {
            Insurance insurance = iInsuranceService.getById(roster.getInsuranceType());
            if(insurance != null) {
                roster.setInsuranceName(insurance.getTitle());
            } else {
                roster.setInsuranceName("无");
            }
        } else {
            roster.setInsuranceName("无");
        }
        return roster;
    }
}
