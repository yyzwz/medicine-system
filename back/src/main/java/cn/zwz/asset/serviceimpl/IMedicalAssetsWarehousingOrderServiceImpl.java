package cn.zwz.asset.serviceimpl;

import cn.zwz.asset.entity.MedicalAssetsWarehousingOrder;
import cn.zwz.asset.mapper.MedicalAssetsWarehousingOrderMapper;
import cn.zwz.asset.service.IMedicalAssetsWarehousingOrderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 入库管理接口实现
 * @author 郑为中
 */
@Slf4j
@Service
@Transactional
public class IMedicalAssetsWarehousingOrderServiceImpl extends ServiceImpl<MedicalAssetsWarehousingOrderMapper, MedicalAssetsWarehousingOrder> implements IMedicalAssetsWarehousingOrderService {

}