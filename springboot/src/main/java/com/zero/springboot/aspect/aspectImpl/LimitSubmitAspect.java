package com.zero.springboot.aspect.aspectImpl;

import com.zero.springboot.aspect.annotation.LimitSubmit;
import com.zero.springboot.exception.ZeroException;
import com.zero.springboot.utils.db.RedisUtil;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;

@Component
@Aspect
@Slf4j
public class LimitSubmitAspect {
	//封装了redis操作各种方法
    @Autowired
    private RedisUtil redisUtil;
    @Pointcut("@annotation(com.zero.springboot.aspect.annotation.LimitSubmit)")
    private void pointcut() {}

    @Around("pointcut()")
    public Object handleSubmit(ProceedingJoinPoint joinPoint) throws Throwable {
        //TODO 获得用户信息

        Method method = ((MethodSignature) joinPoint.getSignature()).getMethod();
        //获取注解信息
        LimitSubmit limitSubmit = method.getAnnotation(LimitSubmit.class);
        int submitTimeLimiter = limitSubmit.limit();
        String redisKey = limitSubmit.key();
        boolean needAllWait = limitSubmit.needAllWait();

        //TODO 获取用户信息,自行实现key的定义方式
        String key =  "";
        Object result = redisUtil.get(key);
        if (result != null) {
            throw new ZeroException("请勿重复访问！");
        }

        //TODO 再次放入缓存
        //redisUtil.set();
        try {
            Object proceed = joinPoint.proceed();
            return proceed;
        } catch (Exception e) {
            log.error(e.getMessage());
            throw e;
        }finally {
            if(!needAllWait) {
                redisUtil.del(redisKey);
            }
        }
    }

}
