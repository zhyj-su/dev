package com.zero.mybatisplusdemo.controller;

import com.zero.mybatisplusdemo.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @author zhyj
 * @version 1.0
 * @date 2020/10/23 13:47
 */
@RestController
@RequestMapping("/user")
public class UserController {
    @Resource(name = "userService")
    private ISysUserService sysUserService;

    @GetMapping("/list")
    public Object getUser(){
        return sysUserService.list();
    }
}
