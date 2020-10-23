package com.zero.mybatisplusdemo.config.mybatis;

import com.alibaba.druid.support.json.JSONUtils;
import com.alibaba.fastjson.JSON;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.*;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;
import java.util.Properties;

/**
 * @author zhyj
 * @version 1.0
 * @date 2020/10/23 13:42
 */
@Slf4j
@Component
@Intercepts(@Signature(type = Executor.class, method = "query",args = {MappedStatement.class, Object.class, RowBounds.class, ResultHandler.class}))
public class MybatisQueryInterceptor implements Interceptor {
    @Override
    public Object intercept(Invocation invocation) throws Throwable {
        Object[] args = invocation.getArgs();
        Method method = invocation.getMethod();
        //log.info("args:{}", JSON.toJSONString(args));
        //log.info("method:{}",JSON.toJSONString(method));
        MappedStatement mappedStatement = (MappedStatement) invocation.getArgs()[0];
        //id 方法名com.zero.mybatisplusdemo.mapper.SysUserMapper.selectList
        String id = mappedStatement.getId();
        log.info("id:{}",JSON.toJSONString(id));
        String databaseId = mappedStatement.getDatabaseId();
        log.info("databaseId:{}",databaseId);
        return invocation.proceed();
    }

    @Override
    public Object plugin(Object target) {
        return Plugin.wrap(target, this);
    }

    @Override
    public void setProperties(Properties properties) {

    }
}
