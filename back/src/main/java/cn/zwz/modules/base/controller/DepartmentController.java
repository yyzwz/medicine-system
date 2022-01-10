package cn.zwz.modules.base.controller;

import cn.zwz.common.constant.CommonConstant;
import cn.zwz.common.exception.ZwzException;
import cn.zwz.common.redis.RedisTemplateHelper;
import cn.zwz.common.utils.CommonUtil;
import cn.zwz.common.utils.HibernateProxyTypeAdapter;
import cn.zwz.common.utils.ResultUtil;
import cn.zwz.common.utils.SecurityUtil;
import cn.zwz.common.vo.Result;
import cn.zwz.modules.base.entity.Department;
import cn.zwz.modules.base.entity.DepartmentHeader;
import cn.zwz.modules.base.entity.User;
import cn.zwz.modules.base.service.DepartmentHeaderService;
import cn.zwz.modules.base.service.DepartmentService;
import cn.zwz.modules.base.service.RoleDepartmentService;
import cn.zwz.modules.base.service.UserService;
import cn.hutool.core.util.StrUtil;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;

/**
 * @author 郑为中
 */
@RestController
@Api(description = "部门管理接口")
@RequestMapping("/zwz/department")
@CacheConfig(cacheNames = "department")
@Transactional
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    @Autowired
    private UserService userService;

    @Autowired
    private RoleDepartmentService roleDepartmentService;

    @Autowired
    private DepartmentHeaderService departmentHeaderService;

    @Autowired
    private StringRedisTemplate redisTemplate;

    @Autowired
    private RedisTemplateHelper redisTemplateHelper;

    @Autowired
    private SecurityUtil securityUtil;

    @RequestMapping(value = "/getByParentId/{parentId}", method = RequestMethod.GET)
    @ApiOperation(value = "查询部门")
    public Result<List<Department>> getByParentId(@PathVariable String parentId){
        List<Department> list = new ArrayList<>();
        User u = securityUtil.getCurrUser();
        String key = "department::"+parentId+":"+u.getId()+"_false";
        String v = redisTemplate.opsForValue().get(key);
        if(StrUtil.isNotBlank(v)){
            list = new Gson().fromJson(v, new TypeToken<List<Department>>(){}.getType());
            return new ResultUtil<List<Department>>().setData(list);
        }
        list = departmentService.findByParentIdOrderBySortOrder(parentId);
        list = setInfo(list);
        redisTemplate.opsForValue().set(key,new GsonBuilder().registerTypeAdapterFactory(HibernateProxyTypeAdapter.FACTORY).create().toJson(list), 15L, TimeUnit.DAYS);
        return new ResultUtil<List<Department>>().setData(list);
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ApiOperation(value = "添加部门")
    public Result<Object> add(Department department){
        departmentService.save(department);
        if(!CommonConstant.PARENT_ID.equals(department.getParentId())){
            Department parent = departmentService.get(department.getParentId());
            if(parent.getIsParent()==null||!parent.getIsParent()){
                parent.setIsParent(true);
                departmentService.update(parent);
            }
        }
        Set<String> keys = redisTemplateHelper.keys("department::*");
        redisTemplate.delete(keys);
        return ResultUtil.success();
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ApiOperation(value = "编辑部门")
    public Result<Object> edit(Department department,@RequestParam(required = false) String[] mainHeader,@RequestParam(required = false) String[] viceHeader){
        Department old = departmentService.get(department.getId());
        Department d = departmentService.update(department);
        // 先删除原数据
        departmentHeaderService.deleteByDepartmentId(department.getId());
        List<DepartmentHeader> headers = new ArrayList<>();
        if(mainHeader!=null){
            for(String id : mainHeader){
                DepartmentHeader dh = new DepartmentHeader().setUserId(id).setDepartmentId(d.getId())
                        .setType(CommonConstant.HEADER_TYPE_MAIN);
                headers.add(dh);
            }
        }
        if(viceHeader!=null){
            for(String id:viceHeader){
                DepartmentHeader dh = new DepartmentHeader().setUserId(id).setDepartmentId(d.getId())
                        .setType(CommonConstant.HEADER_TYPE_VICE);
                headers.add(dh);
            }
        }
        departmentHeaderService.saveOrUpdateAll(headers);
        if(!old.getTitle().equals(department.getTitle())){
            userService.updateDepartmentTitle(department.getId(), department.getTitle());
            Set<String> keysUser = redisTemplateHelper.keys("user:" + "*");
            redisTemplate.delete(keysUser);
        }
        Set<String> keys = redisTemplateHelper.keys("department:" + "*");
        redisTemplate.delete(keys);
        return ResultUtil.success();
    }

    @RequestMapping(value = "/delByIds", method = RequestMethod.POST)
    @ApiOperation(value = "删除部门")
    public Result<Object> delByIds(@RequestParam String[] ids){
        for(String id : ids){
            deleteRecursion(id, ids);
        }
        Set<String> keys = redisTemplateHelper.keys("department:" + "*");
        redisTemplate.delete(keys);
        Set<String> keysUserRoleData = redisTemplateHelper.keys("userRole::depIds:" + "*");
        redisTemplate.delete(keysUserRoleData);
        return ResultUtil.success();
    }

    @ApiOperation(value = "深搜删除部门")
    public void deleteRecursion(String id, String[] ids){
        List<User> list = userService.findByDepartmentId(id);
        if(list!=null&&list.size()>0){
            throw new ZwzException("不能删除！包含正被用户使用关联的部门");
        }
        Department dep = departmentService.get(id);
        Department parent = null;
        if(dep!=null&&StrUtil.isNotBlank(dep.getParentId())){
            parent = departmentService.get(dep.getParentId());
        }
        departmentService.delete(id);
        roleDepartmentService.deleteByDepartmentId(id);
        departmentHeaderService.deleteByDepartmentId(id);
        if(parent!=null){
            List<Department> childrenDeps = departmentService.findByParentIdOrderBySortOrder(parent.getId());
            if(childrenDeps==null||childrenDeps.size()==0){
                parent.setIsParent(false);
                departmentService.update(parent);
            }
        }
        // 递归删除
        List<Department> departments = departmentService.findByParentIdOrderBySortOrder(id);
        for(Department d : departments){
            if(!CommonUtil.judgeIds(d.getId(), ids)){
                deleteRecursion(d.getId(), ids);
            }
        }
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    @ApiOperation(value = "部门名模糊搜索")
    public Result<List<Department>> searchByTitle(@RequestParam String title){
        List<Department> list = departmentService.findByTitleLikeOrderBySortOrder("%"+title+"%");
        list = setInfo(list);
        return new ResultUtil<List<Department>>().setData(list);
    }

    @ApiOperation(value = "添加部门标识")
    public List<Department> setInfo(List<Department> list){
        list.forEach(item -> {
            if(!CommonConstant.PARENT_ID.equals(item.getParentId())){
                Department parent = departmentService.get(item.getParentId());
                item.setParentTitle(parent.getTitle());
            }else{
                item.setParentTitle("一级部门");
            }
            // 设置负责人
            item.setMainHeader(departmentHeaderService.findHeaderByDepartmentId(item.getId(), CommonConstant.HEADER_TYPE_MAIN));
            item.setViceHeader(departmentHeaderService.findHeaderByDepartmentId(item.getId(), CommonConstant.HEADER_TYPE_VICE));
        });
        return list;
    }
}
