package cn.zwz.insurance.serviceimpl;

import cn.zwz.insurance.mapper.InsuranceMapper;
import cn.zwz.insurance.entity.Insurance;
import cn.zwz.insurance.service.IInsuranceService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 医疗保险接口实现
 * @author 郑为中
 */
@Slf4j
@Service
@Transactional
public class IInsuranceServiceImpl extends ServiceImpl<InsuranceMapper, Insurance> implements IInsuranceService {

    @Autowired
    private InsuranceMapper insuranceMapper;
}