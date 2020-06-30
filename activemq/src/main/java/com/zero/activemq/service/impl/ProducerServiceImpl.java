package com.zero.activemq.service.impl;

import com.zero.activemq.service.ProducerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsMessagingTemplate;
import org.springframework.stereotype.Service;

import javax.jms.Destination;

/**
 * @Author: zhyj
 * @Date: 2020/06/30 16:19
 */
@Service
public class ProducerServiceImpl implements ProducerService {
    @Autowired
    private JmsMessagingTemplate jmsTemplate;

    @Override
    public void sendMsg(Destination destination, String message) {
        jmsTemplate.convertAndSend(destination, message);
    }
}
