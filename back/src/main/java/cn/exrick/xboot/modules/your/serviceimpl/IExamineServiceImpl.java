package cn.exrick.xboot.modules.your.serviceimpl;

import cn.exrick.xboot.modules.your.mapper.ExamineMapper;
import cn.exrick.xboot.modules.your.entity.Examine;
import cn.exrick.xboot.modules.your.service.IExamineService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * 保险审核接口实现
 * @author 唐倩
 */
@Slf4j
@Service
@Transactional
public class IExamineServiceImpl extends ServiceImpl<ExamineMapper, Examine> implements IExamineService {

    @Autowired
    private ExamineMapper examineMapper;
}