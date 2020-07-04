package com.zero.feignclient.controller;

import com.zero.feignclient.bean.Licence;
import com.zero.feignclient.feign.TokenClient;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @Author: zhyj
 * @Date: 2020/07/03 16:51
 */
@RestController
@RequestMapping("/test")
@Slf4j
public class TestController {
    @Resource
    private TokenClient tokenClient;

    @RequestMapping("/token/{licence}")
    public String getToken(@PathVariable(name="licence") String licence){
        log.info("licence:{}",licence);
        Licence l=new Licence();
        l.setLicence(licence);

        return tokenClient.getAccessToken(l);

    }

}
