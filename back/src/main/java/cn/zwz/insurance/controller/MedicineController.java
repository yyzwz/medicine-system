package cn.zwz.insurance.controller;

import cn.zwz.basics.baseVo.PageVo;
import cn.zwz.basics.baseVo.Result;
import cn.zwz.basics.utils.PageUtil;
import cn.zwz.basics.utils.ResultUtil;
import cn.zwz.data.utils.ZwzNullUtils;
import cn.zwz.insurance.entity.Medicine;
import cn.zwz.insurance.service.IMedicineService;
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
@Api(tags = "药物档案")
@RequestMapping("/zwz/medicine")
@Transactional
public class MedicineController {

    @Autowired
    private IMedicineService iMedicineService;

    @RequestMapping(value = "/get/{id}", method = RequestMethod.GET)
    @ApiOperation(value = "查询单个药物档案")
    public Result<Medicine> get(@PathVariable String id){
        return new ResultUtil<Medicine>().setData(iMedicineService.getById(id));
    }

    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    @ApiOperation(value = "查询全部药物档案")
    public Result<List<Medicine>> getAll(){
        return new ResultUtil<List<Medicine>>().setData(iMedicineService.list());
    }

    @RequestMapping(value = "/getByPage", method = RequestMethod.GET)
    @ApiOperation(value = "查询药物档案")
    public Result<IPage<Medicine>> getByPage(@ModelAttribute Medicine medicine,@ModelAttribute PageVo page){
        QueryWrapper<Medicine> qw =new QueryWrapper<Medicine>();
        if(!ZwzNullUtils.isNull(medicine.getName())) {
            qw.like("name", medicine.getName());
        }
        if(!ZwzNullUtils.isNull(medicine.getEfficacy())) {
            qw.like("efficacy", medicine.getEfficacy());
        }
        return new ResultUtil<IPage<Medicine>>().setData(iMedicineService.page(PageUtil.initMpPage(page),qw));
    }

    @RequestMapping(value = "/insertOrUpdate", method = RequestMethod.POST)
    @ApiOperation(value = "增改药物档案")
    public Result<Medicine> saveOrUpdate(Medicine medicine){
        iMedicineService.saveOrUpdate(medicine);
        return ResultUtil.success();
    }

    @RequestMapping(value = "/delByIds", method = RequestMethod.POST)
    @ApiOperation(value = "删除药物档案")
    public Result<Object> delAllByIds(@RequestParam String[] ids){
        for(String id : ids){
            iMedicineService.removeById(id);
        }
        return ResultUtil.success();
    }
}
