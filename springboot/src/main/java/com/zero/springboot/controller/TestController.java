package com.zero.springboot.controller;

import com.zero.springboot.exception.ZeroException;
import com.zero.springboot.service.ISysUserService;
import com.zero.springboot.vo.common.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @author zhyj
 * @version 1.0
 * @date 2020/10/28 10:56
 */
@Api(tags="测试")
@RestController
@RequestMapping("/test1")
@Slf4j
public class TestController {
    @Resource
    private ISysUserService userService;

    @ApiOperation(value="测试", notes="测试")
    @GetMapping("test")
    public Result<?> test(){
      return Result.ok(userService.getUserByName("zhangsan"));
    }
}
