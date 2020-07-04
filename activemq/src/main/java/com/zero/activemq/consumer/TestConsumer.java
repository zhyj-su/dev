package com.zero.activemq.consumer;

import lombok.extern.slf4j.Slf4j;
import org.apache.activemq.ActiveMQConnectionFactory;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

import javax.jms.*;

/**
 * @Author: zhyj
 * @Date: 2020/07/01 9:15
 */
@Component
@Slf4j
public class TestConsumer implements ApplicationRunner {
    @Override
    public void run(ApplicationArguments args) throws Exception {
        log.info("===================");
        init();
    }

    public void init() throws JMSException {
        Connection connection=null;
        Session session=null;
        MessageConsumer consumer=null;

        //1、创建工厂连接对象，需要制定ip和端口号
        ConnectionFactory connectionFactory = new ActiveMQConnectionFactory("tcp://localhost:61616");
        //2、使用连接工厂创建一个连接对象
        connection = connectionFactory.createConnection();
        //3、开启连接
        connection.start();
        //4、使用连接对象创建会话（session）对象
        session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
        //5、使用会话对象创建目标对象，包含queue和topic（一对一和一对多）
        Queue queue = session.createQueue("queue-test");
        log.info("queue:"+queue);
        //6、使用会话对象创建生产者对象
        consumer = session.createConsumer(queue);
        //7、向consumer对象中设置一个messageListener对象，用来接收消息
        consumer.setMessageListener(new MessageListener() {

            @Override
            public void onMessage(Message message) {
                // TODO Auto-generated method stub
                if (message instanceof TextMessage) {
                    TextMessage textMessage = (TextMessage) message;
                    try {
                        System.out.println(textMessage.getText());
                    } catch (JMSException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }
                }
            }
        });


        /*consumer.close();
        session.close();
        connection.close();
*/



    }
}
