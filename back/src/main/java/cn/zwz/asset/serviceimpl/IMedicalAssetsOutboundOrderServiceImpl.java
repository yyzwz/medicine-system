package cn.zwz.asset.serviceimpl;

import cn.zwz.asset.entity.MedicalAssetsOutboundOrder;
import cn.zwz.asset.mapper.MedicalAssetsOutboundOrderMapper;
import cn.zwz.asset.service.IMedicalAssetsOutboundOrderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 医疗资产出库单接口实现
 * @author 郑为中
 */
@Service
@Transactional
public class IMedicalAssetsOutboundOrderServiceImpl extends ServiceImpl<MedicalAssetsOutboundOrderMapper, MedicalAssetsOutboundOrder> implements IMedicalAssetsOutboundOrderService {

}