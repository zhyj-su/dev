package com.zero.datadict.controller;

import com.zero.datadict.bean.DictTest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: zhyj
 * @Date: 2020/6/23 11:05
 */
@RestController
@RequestMapping("/dict")
@Slf4j
public class DictController {

    @RequestMapping("/test")
    public Object testDict(){
        DictTest dictTest=new DictTest();
        dictTest.setName("test");
        dictTest.setStatus(1);
        return dictTest;
    }
}
