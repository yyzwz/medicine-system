package cn.exrick.xboot.modules.your.serviceimpl;

import cn.exrick.xboot.modules.your.mapper.MedicineMapper;
import cn.exrick.xboot.modules.your.entity.Medicine;
import cn.exrick.xboot.modules.your.service.IMedicineService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * 药物档案接口实现
 * @author 唐倩
 */
@Slf4j
@Service
@Transactional
public class IMedicineServiceImpl extends ServiceImpl<MedicineMapper, Medicine> implements IMedicineService {

    @Autowired
    private MedicineMapper medicineMapper;
}