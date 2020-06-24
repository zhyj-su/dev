package com.zero.flyway;

import org.jasypt.encryption.StringEncryptor;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class FlywayApplicationTests {
    @Autowired
    StringEncryptor stringEncryptor;

    @Test
    void contextLoads() {
    }


    @Test
    public void encryptPwd() {
        String result = stringEncryptor.encrypt("123456");
        System.out.println(result);
    }

}
