package com.zero.shiro;

import com.alibaba.fastjson.JSON;
import com.zero.shiro.dao.UserRepository;
import com.zero.shiro.dao.UserRoleReposity;
import com.zero.shiro.entity.User;
import com.zero.shiro.entity.UserRole;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
class ShiroApplicationTests {

    @Resource
    private UserRepository userRepository;

    @Resource
    private UserRoleReposity userRoleReposity;

    @Test
    void contextLoads() {
    }

    @Test
    public void saveTest(){
        Date data = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String formattedDate = dateFormat.format(data);

       User user=new User();
       user.setNickName("张三");
       user.setEmail("1243@qq.com");
       user.setPassWord("123456");
       user.setUserName("zhangsan");
       userRepository.save(user);


    }

    @Test
    public void findUserTest(){
        User zhangsan = userRepository.findByUserNameAndPassWord("zhangsan","123456");
        System.out.println(JSON.toJSON(zhangsan));

    }

    @Test
    public void findRolesByUserId(){
        List<UserRole> userRoles = userRoleReposity.findByUserId(1);
        System.out.println(JSON.toJSON(userRoles));
    }
}
