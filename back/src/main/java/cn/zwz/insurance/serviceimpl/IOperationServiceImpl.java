package cn.zwz.insurance.serviceimpl;

import cn.zwz.insurance.mapper.OperationMapper;
import cn.zwz.insurance.entity.Operation;
import cn.zwz.insurance.service.IOperationService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 手术 服务层接口实现
 * @author 郑为中
 */
@Slf4j
@Service
@Transactional
public class IOperationServiceImpl extends ServiceImpl<OperationMapper, Operation> implements IOperationService {

    @Autowired
    private OperationMapper operationMapper;
}