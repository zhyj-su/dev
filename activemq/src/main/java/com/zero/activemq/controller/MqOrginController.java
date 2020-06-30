package com.zero.activemq.controller;

import org.apache.activemq.ActiveMQConnectionFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.jms.*;
import java.io.IOException;

/**
 * @Author: zhyj
 * @Date: 2020/06/30 17:48
 */
@RestController
@RequestMapping("/mq/orgin")
public class MqOrginController {

    @GetMapping("/queue")
    public Object queue01() throws JMSException {
            //1、创建工厂连接对象，需要制定ip和端口号
            ConnectionFactory connectionFactory = new ActiveMQConnectionFactory("tcp://localhost:61616");
            //2、使用连接工厂创建一个连接对象
            Connection connection = connectionFactory.createConnection();
            //3、开启连接
            connection.start();
            //4、使用连接对象创建会话（session）对象
            Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
            //5、使用会话对象创建目标对象，包含queue和topic（一对一和一对多）
            Queue queue = session.createQueue("queue-orgin");
            //6、使用会话对象创建生产者对象
            MessageProducer producer = session.createProducer(queue);
            //7、使用会话对象创建一个消息对象
            TextMessage textMessage = session.createTextMessage("hello!test-queue");
            //8、发送消息
            producer.send(textMessage);
            //9、关闭资源
            producer.close();
            session.close();
            connection.close();


            return "success";
    }

    @GetMapping("/consumer")
    public Object consumer() throws JMSException, IOException {
        //1、创建工厂连接对象，需要制定ip和端口号
        ConnectionFactory connectionFactory = new ActiveMQConnectionFactory("tcp://localhost:61616");
        //2、使用连接工厂创建一个连接对象
        Connection connection = connectionFactory.createConnection();
        //3、开启连接
        connection.start();
        //4、使用连接对象创建会话（session）对象
        Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
        //5、使用会话对象创建目标对象，包含queue和topic（一对一和一对多）
        Queue queue = session.createQueue("queue-orgin");
        //6、使用会话对象创建生产者对象
        MessageConsumer consumer = session.createConsumer(queue);
        //7、向consumer对象中设置一个messageListener对象，用来接收消息
        consumer.setMessageListener(new MessageListener() {

            @Override
            public void onMessage(Message message) {
                // TODO Auto-generated method stub
                if(message instanceof TextMessage){
                    TextMessage textMessage = (TextMessage)message;
                    try {
                        System.out.println(textMessage.getText());
                    } catch (JMSException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }
                }
            }
        });
        //8、程序等待接收用户消息
        System.in.read();
        //9、关闭资源
        consumer.close();
        session.close();
        connection.close();



        return "success";
    }
}
