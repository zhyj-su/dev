package com.zero.shiro.controller;

import com.zero.shiro.config.JwtUtil;
import com.zero.shiro.entity.User;
import com.zero.shiro.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author: zhyj
 * @Date: 2020/6/19 11:34
 */
@RestController
@Slf4j
public class UserLoginController {

    @Resource
    private UserService userService;

    @RequestMapping("/login")
    public Map<String, String> login(String username, String password) {
        log.info("username:{},password:{}",username,password);
        Map<String, String> map = new HashMap<>(5);

        User user = userService.findByUserNameAndPassword(username, password);
        if(user==null){
            map.put("msg", "用户名密码错误");
            return map;
        }


        JwtUtil jwtUtil = new JwtUtil();
        Map<String, Object> chaim = new HashMap<>(5);
        chaim.put("username", username);
        String jwtToken = jwtUtil.encode(username, 10 * 60 * 1000, chaim);
        map.put("msg", "登录成功");
        map.put("token", jwtToken);
        return map;
    }

    @RequestMapping("/testdemo")
    public ResponseEntity<String> testdemo() {
        return ResponseEntity.ok("我爱蛋炒饭");
    }


    @RequiresRoles("test")
    @RequestMapping("/test1")
    public ResponseEntity<String> test1() {
        return ResponseEntity.ok("test1");
    }
}
