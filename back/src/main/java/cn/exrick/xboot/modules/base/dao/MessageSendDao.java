package cn.exrick.xboot.modules.base.dao;

import cn.exrick.xboot.base.XbootBaseDao;
import cn.exrick.xboot.modules.base.entity.MessageSend;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

/**
 * 消息发送数据处理层
 * @author Exrick
 */
public interface MessageSendDao extends XbootBaseDao<MessageSend,String> {

    /**
     * 通过消息id删除
     * @param messageId
     */
    @Modifying
    @Query("delete from MessageSend m where m.messageId = ?1")
    void deleteByMessageId(String messageId);
}