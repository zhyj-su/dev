package com.zero.datadict.controller;

import com.zero.datadict.bean.DictTest;
import com.zero.datadict.entity.Dict;
import com.zero.datadict.service.DictService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @Author: zhyj
 * @Date: 2020/6/23 11:05
 */
@RestController
@RequestMapping("/dict")
@Slf4j
public class DictController {

    @Resource
    private DictService dictService;

    @RequestMapping("/test")
    public Object testDict(){

        return dictService.getDictList();
    }
}
