package com.zero.springboot.controller;

import com.zero.springboot.service.IAsyncService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @Author: zhyj
 * @Date: 2020/10/29 13:50
 */
@RestController
@RequestMapping("/async")
public class AsyncController {

    @Resource
    private IAsyncService asyncService;


    @RequestMapping(value = "/hello",method = RequestMethod.GET)
    public String testAsyncNoRetrun(){
        long start = System.currentTimeMillis();
        asyncService.doNoReturn();
        return String.format("任务执行成功,耗时{%s}", System.currentTimeMillis() - start);
    }
}
