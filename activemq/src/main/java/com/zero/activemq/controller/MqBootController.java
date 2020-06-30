package com.zero.activemq.controller;

import com.zero.activemq.service.ProducerService;
import org.apache.activemq.ActiveMQConnectionFactory;
import org.apache.activemq.command.ActiveMQQueue;
import org.apache.activemq.command.ActiveMQTopic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.jms.Destination;

/**
 * @Author: zhyj
 * @Date: 2020/06/30 16:20
 */
@RestController
@RequestMapping("/mq/boot")
public class MqBootController {
    @Autowired
    private ProducerService producerService;

    @GetMapping("/queue")
    private Object queue(String msg) {
        Destination destination = new ActiveMQQueue("queue1");
        producerService.sendMsg(destination,msg);
        return "queue";
    }

    @GetMapping("/topic")
    private Object topic(String msg) {
        Destination destination = new ActiveMQTopic("topic1");
        producerService.sendMsg(destination,msg);
        return "topic";
    }



}
