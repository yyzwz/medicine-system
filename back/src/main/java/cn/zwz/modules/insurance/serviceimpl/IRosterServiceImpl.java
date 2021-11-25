package cn.zwz.modules.insurance.serviceimpl;

import cn.zwz.modules.insurance.mapper.RosterMapper;
import cn.zwz.modules.insurance.entity.Roster;
import cn.zwz.modules.insurance.service.IRosterService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 参保人员接口实现
 * @author 郑为中
 */
@Slf4j
@Service
@Transactional
public class IRosterServiceImpl extends ServiceImpl<RosterMapper, Roster> implements IRosterService {

    @Autowired
    private RosterMapper rosterMapper;
}