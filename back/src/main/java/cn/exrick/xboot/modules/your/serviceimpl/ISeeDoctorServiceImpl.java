package cn.exrick.xboot.modules.your.serviceimpl;

import cn.exrick.xboot.modules.your.mapper.SeeDoctorMapper;
import cn.exrick.xboot.modules.your.entity.SeeDoctor;
import cn.exrick.xboot.modules.your.service.ISeeDoctorService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * 看病登记接口实现
 * @author 唐倩
 */
@Slf4j
@Service
@Transactional
public class ISeeDoctorServiceImpl extends ServiceImpl<SeeDoctorMapper, SeeDoctor> implements ISeeDoctorService {

    @Autowired
    private SeeDoctorMapper seeDoctorMapper;
}