package cn.zwz.insurance.serviceimpl;

import cn.zwz.insurance.mapper.MedicineMapper;
import cn.zwz.insurance.entity.Medicine;
import cn.zwz.insurance.service.IMedicineService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 药物档案接口实现
 * @author 郑为中
 */
@Slf4j
@Service
@Transactional
public class IMedicineServiceImpl extends ServiceImpl<MedicineMapper, Medicine> implements IMedicineService {

    @Autowired
    private MedicineMapper medicineMapper;
}