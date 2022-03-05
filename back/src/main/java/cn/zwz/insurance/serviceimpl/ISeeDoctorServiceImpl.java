package cn.zwz.insurance.serviceimpl;

import cn.zwz.insurance.mapper.SeeDoctorMapper;
import cn.zwz.insurance.entity.SeeDoctor;
import cn.zwz.insurance.service.ISeeDoctorService;
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