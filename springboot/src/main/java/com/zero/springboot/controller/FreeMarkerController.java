package com.zero.springboot.controller;

import com.zero.springboot.utils.freemarker.FreeMarkerUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * @author zhyj
 * @version 1.0
 * @date 2020/11/10 16:45
 */
@RestController
@RequestMapping("/freemarker")
@Slf4j
public class FreeMarkerController {

    @Resource
    FreeMarkerUtil freeMarkerUtil;

    @RequestMapping("generate")
    public String createEntity(String tableName,String saveUrl,String basePackageUrl) throws Exception {

        //生成路径，根据实际情况修改即可
        saveUrl = saveUrl == null ? "D:\\gen": saveUrl;
        //生成文件包名，根据实际情况修改即可
        basePackageUrl = basePackageUrl == null? "com.example.demo": basePackageUrl;
        //bean类名
        String entityName = freeMarkerUtil.getEntityName(tableName);

        //封装参数
        Map<String, Object> root = new HashMap<>();
        root.put("basePackageUrl", basePackageUrl);
        //表参数
        root.put("tableName", tableName);
        root.put("entityName", entityName);
        root.put("entityNameLower", freeMarkerUtil.getEntityNameLower(tableName));
        root.put("columns", freeMarkerUtil.getDataInfo(tableName));

        // 生成bean
        freeMarkerUtil.generate(root,"entity.ftl",saveUrl+"\\entity",entityName+".java");
        // 生成dao
        freeMarkerUtil.generate(root,"mapper.ftl",saveUrl+"\\mapper",entityName+"Mapper.java");
        // 生成mapper
        freeMarkerUtil.generate(root,"mapperXml.ftl",saveUrl+"\\mapper\\xml",entityName+"Mapper.xml");
        // 生成controller
        freeMarkerUtil.generate(root,"controller.ftl",saveUrl+"\\controller",entityName+"Controller.java");
        //生成service
        freeMarkerUtil.generate(root,"service.ftl",saveUrl+"\\service",entityName+"Service.java");
        //生成serviceImpl
        freeMarkerUtil.generate(root,"serviceImpl.ftl",saveUrl+"\\service\\impl",entityName+"ServiceImpl.java");

        return "生成成功";
    }
}
