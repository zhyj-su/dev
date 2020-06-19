package com.zero.shiro.config;

import org.apache.shiro.authc.AuthenticationToken;

/**
 * @author fjw
 * @date 2019/10/31 14:57
 */
public class JwtToken implements AuthenticationToken {


    /**
     * 密钥
     */
    private String token;

    public JwtToken(String token) {
        this.token = token;
    }

    @Override
    public Object getPrincipal() {
        return token;
    }

    @Override
    public Object getCredentials() {
        return token;
    }
}

