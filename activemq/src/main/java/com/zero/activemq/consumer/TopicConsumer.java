package com.zero.activemq.consumer;

import lombok.extern.slf4j.Slf4j;
import org.springframework.jms.annotation.JmsListener;
import org.springframework.stereotype.Component;

/**
 * @Author: zhyj
 * @Date: 2020/06/30 17:19
 */
@Component
@Slf4j
public class TopicConsumer {
    @JmsListener(destination = "topic1",containerFactory = "topicListenerContainerFactory")
    public void receiveTopicMsg(String msg){
        log.info(msg);
    }

}
