package com.zero.datadict.aop;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sun.org.apache.bcel.internal.generic.INSTANCEOF;
import com.zero.datadict.annotation.Dict;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;


/**
 * @Author: zhyj
 * @Date: 2020/08/25 11:31
 */
@Slf4j
@Component
@Aspect
public class DictAspect {
    @Pointcut("execution(* com.zero.datadict.controller.*Controller.*(..))")
    public void excudeService() {
    }

    @Around("excudeService()")
    public Object doAround(ProceedingJoinPoint pjp) throws Throwable {
        long time1=System.currentTimeMillis();
        Object result = pjp.proceed();
        long time2=System.currentTimeMillis();
        log.info("获取JSON数据 耗时："+(time2-time1)+"ms");
        long start=System.currentTimeMillis();
        result=parseDictText(result);
        long end=System.currentTimeMillis();
        log.info("解析注入JSON数据  耗时"+(end-start)+"ms");
        log.info("....result:{}",JSON.toJSONString(result));
        return result;
    }


    private Object parseDictText(Object result) throws IllegalAccessException, InstantiationException {
        log.info("result:{}", JSON.toJSONString(result));
        log.info("result type:{}", result.getClass().getTypeName());
        ObjectMapper mapper = new ObjectMapper();
        String json = "{}";
        try {
            //解决@JsonFormat注解解析不了的问题详见SysAnnouncement类的@JsonFormat
            json = mapper.writeValueAsString(result);
        } catch (JsonProcessingException e) {
            log.error("json解析失败" + e.getMessage(), e);
        }
        JSONObject item = JSONObject.parseObject(json);
        log.info("item:{}",JSON.toJSONString(item));

        Field[] allFields = getAllFields(result);
        log.info("allFields:{}",JSON.toJSONString(allFields));
        for (Field field : allFields) {
            Dict annotation = field.getAnnotation(Dict.class);
            if(annotation!=null){
                log.info("annotation:{}",JSON.toJSONString(annotation));
                String name = field.getName();
                log.info("name:{}",JSON.toJSONString(name));
                field.setAccessible(true);
                 String i = (String) field.get(result);
                 log.info(String.valueOf(i));
                 if("1".equals(i)){
                     log.info("增加字段");
                    item.put(field.getName()+ "_dictText",annotation.dicText());
                 }
            }
        }
        log.info("item:{}",JSON.toJSONString(item));
        return item;
    }

    /**
     * 获取类的所有属性，包括父类
     *
     * @param object
     * @return
     */
    public static Field[] getAllFields(Object object) {
        Class<?> clazz = object.getClass();
        List<Field> fieldList = new ArrayList<>();
        while (clazz != null) {
            fieldList.addAll(new ArrayList<>(Arrays.asList(clazz.getDeclaredFields())));
            clazz = clazz.getSuperclass();
        }
        Field[] fields = new Field[fieldList.size()];
        fieldList.toArray(fields);
        return fields;
    }

}
