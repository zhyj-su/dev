package com.zero.datadict.aop;

import com.zero.datadict.annotation.DataDictClass;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;

/**
 * @Author: zhyj
 * @Date: 2020/6/23 11:31
 */
@Component
@Aspect
@Slf4j
public class DataDictAspect {

    @Pointcut(value = "@annotation(com.zero.datadict.annotation.DataDictClass)")
    public void dict() {
    }

    @Around("dict()")
    public Object translation(ProceedingJoinPoint point){
        log.info("进入aop");
        /*DataDict.Type dictType = dataDict.dictType();
        String tableName = dataDict.tableName();
        String fieldName = dataDict.fieldName();
        log.info("dictType:"+dictType);
        log.info("tableName:"+tableName);
        log.info("fieldName:"+fieldName);*/
        return null;
    }


}
