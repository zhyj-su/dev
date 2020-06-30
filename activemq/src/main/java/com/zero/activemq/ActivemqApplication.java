package com.zero.activemq;

import org.apache.activemq.ActiveMQConnectionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.core.env.Environment;
import org.springframework.jms.annotation.EnableJms;
import org.springframework.jms.core.JmsMessagingTemplate;
import org.springframework.jms.core.JmsTemplate;

import javax.jms.ConnectionFactory;

@EnableJms
@SpringBootApplication
public class ActivemqApplication {

    public static void main(String[] args) {
        SpringApplication.run(ActivemqApplication.class, args);
    }

    @Autowired
    private Environment env;

    @Bean
    public ConnectionFactory connectionFactory() {
        ActiveMQConnectionFactory connectionFactory = new ActiveMQConnectionFactory();
        connectionFactory.setBrokerURL(env.getProperty("spring.activemq.broker-url"));
        connectionFactory.setUserName(env.getProperty("spring.activemq.user"));
        connectionFactory.setPassword(env.getProperty("spring.activemq.password"));
        return connectionFactory;
    }

    @Bean
    public JmsTemplate genJmsTemplate() {
        return new JmsTemplate(connectionFactory());

    }

    @Bean
    public JmsMessagingTemplate jmsMessageTemplate() {
        return new JmsMessagingTemplate(connectionFactory());
    }

}
