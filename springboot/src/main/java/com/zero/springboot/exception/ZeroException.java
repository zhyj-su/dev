package com.zero.springboot.exception;

import cn.hutool.json.JSONObject;

/**
 * @author zhyj
 * @version 1.0
 * @date 2020/10/28 13:14
 */
public class ZeroException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    private int error_code = 200;
    private String message = null;

    public ZeroException() {
        super();
    }

    public ZeroException(int error_code) {
        this.error_code = error_code;
    }

    public ZeroException(String message) {
        this.message = message;
    }

    public ZeroException(int error_code, String message) {
        this.error_code = error_code;
        this.message = message;
    }

    public int getError_code() {
        return error_code;
    }

    public void setError_code(int error_code) {
        this.error_code = error_code;
    }

    public String message() {
        return message;
    }

    @Override
    public String getMessage(){
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String toJson() {
        JSONObject json = new JSONObject();
        json.put("error_code", error_code);
        json.put("message", message);
        return json.toString();
    }

}
