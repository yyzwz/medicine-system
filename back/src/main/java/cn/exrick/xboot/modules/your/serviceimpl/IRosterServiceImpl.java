package cn.exrick.xboot.modules.your.serviceimpl;

import cn.exrick.xboot.modules.your.mapper.RosterMapper;
import cn.exrick.xboot.modules.your.entity.Roster;
import cn.exrick.xboot.modules.your.service.IRosterService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * 参保人员接口实现
 * @author 唐倩
 */
@Slf4j
@Service
@Transactional
public class IRosterServiceImpl extends ServiceImpl<RosterMapper, Roster> implements IRosterService {

    @Autowired
    private RosterMapper rosterMapper;
}