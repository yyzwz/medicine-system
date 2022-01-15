package cn.zwz.modules.insurance.controller;

import cn.zwz.common.utils.PageUtil;
import cn.zwz.common.utils.ResultUtil;
import cn.zwz.common.vo.PageVo;
import cn.zwz.common.vo.Result;
import cn.zwz.modules.insurance.entity.Medicine;
import cn.zwz.modules.insurance.service.IMedicineService;
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
@Api(tags = "药物档案接口")
@RequestMapping("/zwz/medicine")
@Transactional
public class MedicineController {

    @Autowired
    private IMedicineService iMedicineService;

    @RequestMapping(value = "/get/{id}", method = RequestMethod.GET)
    @ApiOperation(value = "通过id获取")
    public Result<Medicine> get(@PathVariable String id){

        Medicine medicine = iMedicineService.getById(id);
        return new ResultUtil<Medicine>().setData(medicine);
    }

    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    @ApiOperation(value = "获取全部数据")
    public Result<List<Medicine>> getAll(){

        List<Medicine> list = iMedicineService.list();
        return new ResultUtil<List<Medicine>>().setData(list);
    }

    @RequestMapping(value = "/getByPage", method = RequestMethod.GET)
    @ApiOperation(value = "分页获取")
    public Result<IPage<Medicine>> getByPage(@ModelAttribute Medicine medicine,@ModelAttribute PageVo page){
        QueryWrapper<Medicine> qw =new QueryWrapper<Medicine>();
        if(StrUtil.isNotBlank(medicine.getName())) {
            qw.like("name", medicine.getName());
        }
        if(StrUtil.isNotBlank(medicine.getEfficacy())) {
            qw.like("efficacy", medicine.getEfficacy());
        }
        IPage<Medicine> data = iMedicineService.page(PageUtil.initMpPage(page),qw);
        return new ResultUtil<IPage<Medicine>>().setData(data);
    }

    @RequestMapping(value = "/insertOrUpdate", method = RequestMethod.POST)
    @ApiOperation(value = "编辑或更新数据")
    public Result<Medicine> saveOrUpdate(Medicine medicine){

        if(iMedicineService.saveOrUpdate(medicine)){
            return new ResultUtil<Medicine>().setData(medicine);
        }
        return new ResultUtil<Medicine>().setErrorMsg("操作失败");
    }

    @RequestMapping(value = "/delByIds", method = RequestMethod.POST)
    @ApiOperation(value = "批量通过id删除")
    public Result<Object> delAllByIds(@RequestParam String[] ids){

        for(String id : ids){
            iMedicineService.removeById(id);
        }
        return ResultUtil.success("批量通过id删除数据成功");
    }
}
