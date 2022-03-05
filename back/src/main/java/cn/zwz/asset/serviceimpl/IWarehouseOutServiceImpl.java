package cn.zwz.asset.serviceimpl;

import cn.zwz.asset.entity.WarehouseOut;
import cn.zwz.asset.mapper.WarehouseOutMapper;
import cn.zwz.asset.service.IWarehouseOutService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 出库管理接口实现
 * @author 郑为中
 */
@Slf4j
@Service
@Transactional
public class IWarehouseOutServiceImpl extends ServiceImpl<WarehouseOutMapper, WarehouseOut> implements IWarehouseOutService {

    @Autowired
    private WarehouseOutMapper warehouseOutMapper;
}