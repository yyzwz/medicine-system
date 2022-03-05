package cn.zwz.asset.serviceimpl;

import cn.zwz.asset.entity.Warehousing;
import cn.zwz.asset.mapper.WarehousingMapper;
import cn.zwz.asset.service.IWarehousingService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 入库管理接口实现
 * @author 郑为中
 */
@Slf4j
@Service
@Transactional
public class IWarehousingServiceImpl extends ServiceImpl<WarehousingMapper, Warehousing> implements IWarehousingService {

    @Autowired
    private WarehousingMapper warehousingMapper;
}