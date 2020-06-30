package com.zero.activemq.service;


import javax.jms.Destination;

/**
 * @Author: zhyj
 * @Date: 2020/06/30 16:18
 *
 */
public interface ProducerService {
    /**
     * 使用指定消息队列发送
     *
     * @param destination
     * @param message
     */
    void sendMsg(Destination destination, final String message);
}
