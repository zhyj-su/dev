package com.zero.springboot.controller;

import cn.hutool.core.util.EnumUtil;
import com.zero.springboot.constant.enums.CommonEnum;
import com.zero.springboot.service.ISysUserService;
import com.zero.springboot.utils.KvEnumUtil;
import com.zero.springboot.utils.db.RedisUtil;
import com.zero.springboot.vo.common.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.validation.constraints.NotBlank;
import java.util.List;

/**
 * @author zhyj
 * @version 1.0
 * @date 2020/10/28 10:56
 */
@Api(tags="测试")
@RestController
@RequestMapping("/test")
@Slf4j
public class TestController {
    @Resource
    private RedisUtil redisUtil;

    @Resource
    private ISysUserService userService;

    @ApiOperation(value="测试", notes="测试")
    @GetMapping("test")
    public Result<?> test(){
      return Result.ok(userService.getUserByName("zhangsan"));
    }

    @ApiOperation(value="测试", notes="测试")
    @GetMapping("test1")
    public Result<?> test1(){
        redisUtil.set("test:redis","1");
        return Result.ok((String) redisUtil.get("test:redis"));
    }

    @ApiOperation(value="参数测试", notes="测试")
    @GetMapping("test2")
    public Result<?> test2(@NotBlank @RequestParam("id") String id){
        return Result.ok("参数测试");
    }


    @ApiOperation(value="枚举测试", notes="测试")
    @GetMapping("test3")
    public Result<?> test3(){
        //获取枚举名称
        String enumName = KvEnumUtil.getEnumName(CommonEnum.Sex.class);
        log.info("enumName:{}",enumName);
        String enumValueBykey = KvEnumUtil.getEnumValueByText(CommonEnum.Sex.class, "男", String.class);
        log.info("enumValueBykey:{}",enumValueBykey);
        String enumKeyByValue = KvEnumUtil.getEnumTextByValue(CommonEnum.Sex.class, "1");
        log.info("enumKeyByValue:{}",enumKeyByValue);

        String name = KvEnumUtil.getEnumValueByName(CommonEnum.NumStr.class, CommonEnum.NumStr.MINUX_ONE.name(), String.class);
        log.info("name:{}",name);

        Integer enumValueByName1 = KvEnumUtil.getEnumValueByName(CommonEnum.Num.class, CommonEnum.Num.FOUR.name(), Integer.class);
        log.info("enumValueByName1:{}",enumValueByName1);

        return Result.ok(enumName);

    }
}
