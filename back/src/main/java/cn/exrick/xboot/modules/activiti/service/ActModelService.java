package cn.exrick.xboot.modules.activiti.service;

import cn.exrick.xboot.base.XbootBaseService;
import cn.exrick.xboot.modules.activiti.entity.ActModel;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * 模型管理接口
 * @author Exrick
 */
public interface ActModelService extends XbootBaseService<ActModel,String> {

    /**
     * 多条件分页获取
     * @param actModel
     * @param pageable
     * @return
     */
    Page<ActModel> findByCondition(ActModel actModel, Pageable pageable);
}