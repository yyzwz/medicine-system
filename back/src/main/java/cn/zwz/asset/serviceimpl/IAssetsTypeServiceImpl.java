package cn.zwz.asset.serviceimpl;

import cn.zwz.asset.entity.AssetsType;
import cn.zwz.asset.mapper.AssetsTypeMapper;
import cn.zwz.asset.service.IAssetsTypeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 资产种类接口实现
 * @author 郑为中
 */
@Slf4j
@Service
@Transactional
public class IAssetsTypeServiceImpl extends ServiceImpl<AssetsTypeMapper, AssetsType> implements IAssetsTypeService {

    @Autowired
    private AssetsTypeMapper assetsTypeMapper;
}