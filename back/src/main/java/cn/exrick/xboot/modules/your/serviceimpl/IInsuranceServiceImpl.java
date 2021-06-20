package cn.exrick.xboot.modules.your.serviceimpl;

import cn.exrick.xboot.modules.your.mapper.InsuranceMapper;
import cn.exrick.xboot.modules.your.entity.Insurance;
import cn.exrick.xboot.modules.your.service.IInsuranceService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * 医疗保险接口实现
 * @author 唐倩
 */
@Slf4j
@Service
@Transactional
public class IInsuranceServiceImpl extends ServiceImpl<InsuranceMapper, Insurance> implements IInsuranceService {

    @Autowired
    private InsuranceMapper insuranceMapper;
}