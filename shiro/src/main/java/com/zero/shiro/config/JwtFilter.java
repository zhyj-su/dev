package com.zero.shiro.config;

import com.alibaba.fastjson.JSONObject;
import com.zero.shiro.constant.DataConstant;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author: zhyj
 * @Date: 2020/6/19 11:27
 */
@Slf4j
public class JwtFilter extends AccessControlFilter {
    /**
     *  1. 返回true，shiro就直接允许访问url
     *  2. 返回false，shiro才会根据onAccessDenied的方法的返回值决定是否允许访问url
     * @param request request请求
     * @param response response响应
     * @param mappedValue mappedValue
     * @return boolean mappedValue
     */
    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue){
        log.warn("isAccessAllowed 方法被调用");
        //这里先让它始终返回false来使用onAccessDenied()方法

        if (((HttpServletRequest) request).getHeader(DataConstant.AUTHORIZATION) != null) {
            //如果存在，则进入 executeLogin 方法执行登入，检查 token 是否正确
            try {
                boolean flag = executeLogin(request, response);
                return true;
            } catch (Exception e) {
                //token 错误
                return false;
            }
        }
        //如果请求头不存在 Token，则可能是执行登陆操作或者是游客状态访问，无需检查 token，直接返回 true
        return false;
    }


    /**
     * executeLogin
     * @param servletRequest request
     * @param servletResponse response
     * @return boolean
     */
    private boolean executeLogin(ServletRequest servletRequest, ServletResponse servletResponse) {
        log.warn("executeLogin 方法被调用");
        //这个地方和前端约定，要求前端将jwtToken放在请求的Header部分

        //所以以后发起请求的时候就需要在Header中放一个Authorization，值就是对应的Token
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        String jwt = request.getHeader("Authorization");
        log.info("请求的 Header 中藏有 jwtToken {}", jwt);
        JwtToken jwtToken = new JwtToken(jwt);
        /*
         * 下面就是固定写法
         * */
        try {
            // 委托 realm 进行登录认证
            //所以这个地方最终还是调用JwtRealm进行的认证
            getSubject(servletRequest, servletResponse).login(jwtToken);
            //也就是subject.login(token)
        } catch (Exception e) {
            e.printStackTrace();
            try {
                onLoginFail(servletResponse);
            } catch (IOException ex) {
                ex.printStackTrace();
            }
            //调用下面的方法向客户端返回错误信息
            return false;
        }

        return true;
        //执行方法中没有抛出异常就表示登录成功
    }

    /**
     * 返回结果为true表明登录通过
     */
    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
        System.out.println("--------onAccessDenied------------");
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        //这里是个坑，如果不设置的接受的访问源，那么前端都会报跨域错误，因为这里还没到corsConfig里面
        httpServletResponse.setHeader("Access-Control-Allow-Origin", ((HttpServletRequest) request).getHeader("Origin"));
        httpServletResponse.setHeader("Access-Control-Allow-Credentials", "true");
        httpServletResponse.setCharacterEncoding("UTF-8");
        httpServletResponse.setContentType("application/json");

        Map<String,String> map=new HashMap<>(5);
        map.put("msg","登录失效，请重新登陆");

        httpServletResponse.getWriter().write(JSONObject.toJSON(map).toString());
        return false;
    }

    /**
     * 登录失败时默认返回 401 状态码
     * @param response 响应对象
     * @throws IOException IO异常
     */
    private void onLoginFail(ServletResponse response) throws IOException {
        log.info("onLoginFail");
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        httpResponse.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        httpResponse.getWriter().write("登录失败");
    }

    @Override
    protected boolean preHandle(ServletRequest request, ServletResponse response) throws Exception {
        //-----------对跨域提供支持-------------------
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        httpServletResponse.setHeader("Access-control-Allow-Origin", httpServletRequest.getHeader("Origin"));
        httpServletResponse.setHeader("Access-Control-Allow-Methods", "GET,POST,OPTIONS,PUT,DELETE");
        httpServletResponse.setHeader("Access-Control-Allow-Headers", httpServletRequest.getHeader("Access-Control-Request-Headers"));
        // 跨域时会首先发送一个option请求，这里我们给option请求直接返回正常状态
        if (httpServletRequest.getMethod().equals(RequestMethod.OPTIONS.name())) {
            httpServletResponse.setStatus(HttpStatus.OK.value());
            return false;
        }
        return super.preHandle(request, response);
    }
}
