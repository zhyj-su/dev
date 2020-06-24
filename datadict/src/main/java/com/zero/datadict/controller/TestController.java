package com.zero.datadict.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: zhyj
 * @Date: 2020/6/23 10:34
 */
@RestController
@RequestMapping("/test")
public class TestController {

    @RequestMapping("/test1")
    public String testa(){
        return "hello";
    }
}
