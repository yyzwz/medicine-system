package cn.zwz.asset.serviceimpl;

import cn.zwz.asset.entity.MedicalAssets;
import cn.zwz.asset.mapper.MedicalAssetsMapper;
import cn.zwz.asset.service.IMedicalAssetsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 医疗资产接口实现
 * @author 郑为中
 */
@Service
@Transactional
public class IMedicalAssetsServiceImpl extends ServiceImpl<MedicalAssetsMapper, MedicalAssets> implements IMedicalAssetsService {

}