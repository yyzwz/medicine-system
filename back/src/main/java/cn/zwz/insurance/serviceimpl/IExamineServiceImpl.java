package cn.zwz.insurance.serviceimpl;

import cn.zwz.insurance.mapper.ExamineMapper;
import cn.zwz.insurance.entity.Examine;
import cn.zwz.insurance.service.IExamineService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 保险审核接口实现
 * @author 郑为中
 */
@Slf4j
@Service
@Transactional
public class IExamineServiceImpl extends ServiceImpl<ExamineMapper, Examine> implements IExamineService {

    @Autowired
    private ExamineMapper examineMapper;
}