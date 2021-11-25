package cn.zwz.modules.insurance.serviceimpl;

import cn.zwz.modules.insurance.mapper.SeeDoctorMapper;
import cn.zwz.modules.insurance.entity.SeeDoctor;
import cn.zwz.modules.insurance.service.ISeeDoctorService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 看病登记接口实现
 * @author 郑为中
 */
@Slf4j
@Service
@Transactional
public class ISeeDoctorServiceImpl extends ServiceImpl<SeeDoctorMapper, SeeDoctor> implements ISeeDoctorService {

    @Autowired
    private SeeDoctorMapper seeDoctorMapper;
}