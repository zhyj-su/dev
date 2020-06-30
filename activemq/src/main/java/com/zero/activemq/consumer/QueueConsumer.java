package com.zero.activemq.consumer;

import lombok.extern.slf4j.Slf4j;
import org.springframework.jms.annotation.JmsListener;
import org.springframework.stereotype.Component;

/**
 * @Author: zhyj
 * @Date: 2020/06/30 16:41
 */
@Component
@Slf4j
public class QueueConsumer {

    @JmsListener(destination = "queue1",containerFactory = "queueListenerContainerFactory")
    public void receiveQueueMsg(String msg){
        log.info(msg);
    }
}
