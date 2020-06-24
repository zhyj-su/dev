package com.zero.datadict.aop;

import com.alibaba.fastjson.JSON;
import org.apache.commons.lang3.ArrayUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;


@Aspect
@Component
public class LogAspect {
    private Logger LOGGER = LoggerFactory.getLogger(LogAspect.class);

    @Pointcut("execution(* com.zero.datadict.controller.*Controller.*(..))")
    public void controllerAop() {
    }

    @Around("controllerAop()")
    public Object doControllerAround(ProceedingJoinPoint pjp) throws Throwable {
        return log(pjp);
    }


    private Object log(ProceedingJoinPoint pjp) throws Throwable {
        LOGGER.info("================================================================================================");
        long startTime = System.currentTimeMillis();
        LOGGER.info("调用开始");
        LOGGER.info("类名:"+pjp.getTarget().getClass().getName());
        LOGGER.info("目标方法名:"+pjp.getSignature().getName());
        //1.获取到所有的参数值的数组
        Object[] args = pjp.getArgs();
        Signature signature = pjp.getSignature();

        MethodSignature methodSignature = (MethodSignature) signature;
        //2.获取到方法的所有参数名称的字符串数组
        String[] parameterNames = methodSignature.getParameterNames();
        int index=1;
        for (String parameterName : parameterNames) {
        	if(!"response".equals(parameterName)) {
        		LOGGER.info("[参数"+(index++)+"] "+parameterName+":"+ JSON.toJSONString(args[ArrayUtils.indexOf(parameterNames,parameterName)]));
        	}
            
        }
        //3.result的值就是被拦截方法的返回值
        Object result = pjp.proceed();
        LOGGER.info("调用结束");
        LOGGER.info("调用结果:"+ JSON.toJSONString(result));
        long endTime = System.currentTimeMillis();
        LOGGER.info("-----" + pjp.getSignature().getName() + " 方法执行耗时：" + (endTime-startTime) + " ms");
        LOGGER.info("================================================================================================");
        return result;
    }


}
