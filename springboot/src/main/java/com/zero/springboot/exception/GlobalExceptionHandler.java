package com.zero.springboot.exception;

import com.zero.springboot.vo.common.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.servlet.NoHandlerFoundException;

import java.util.Arrays;
import java.util.stream.Collectors;

/**
 * @author zhyj
 * @version 1.0
 * @date 2020/10/28 13:31
 */
@ControllerAdvice
@ResponseBody
@Slf4j
public class GlobalExceptionHandler {

    /**
     * 处理自定义异常
     */
    @ExceptionHandler(ZeroException.class)
    public Result<?> handleRRException(ZeroException e){
        log.error(e.getMessage(), e);
        return Result.error(e.getMessage());
    }

    @ExceptionHandler(NoHandlerFoundException.class)
    public Result<?> handlerNoFoundException(Exception e) {
        log.error(e.getMessage(), e);
        return Result.error(404, "路径不存在，请检查路径是否正确");
    }

    @ExceptionHandler(DuplicateKeyException.class)
    public Result<?> handleDuplicateKeyException(DuplicateKeyException e){
        log.error(e.getMessage(), e);
        return Result.error("数据库中已存在该记录");
    }

    @ExceptionHandler(Exception.class)
    public Result<?> handleException(Exception e){
        log.error(e.getMessage(), e);
        return Result.error("操作失败，"+e.getMessage());
    }

    /**
     * 处理请求不支持异常
     * @param e
     * @return
     */
    @ExceptionHandler(HttpRequestMethodNotSupportedException.class)
    public Result<?> HttpRequestMethodNotSupportedException(HttpRequestMethodNotSupportedException e){
        StringBuffer sb = new StringBuffer();
        sb.append("不支持").append(e.getMethod()).append("请求方法，").append("支持以下");
        sb.append(Arrays.stream(e.getSupportedMethods()).collect(Collectors.joining("、")));
        log.error(sb.toString(), e);
        return Result.error(405,sb.toString());
    }

    /**
     * spring默认上传大小100MB 超出大小捕获异常MaxUploadSizeExceededException
     */
    @ExceptionHandler(MaxUploadSizeExceededException.class)
    public Result<?> handleMaxUploadSizeExceededException(MaxUploadSizeExceededException e) {
        log.error(e.getMessage(), e);
        return Result.error("文件大小超出限制, 请压缩或降低文件质量! ");
    }

    /**
     * 算数异常 例如除零异常
     * @param e
     * @return
     */
    @ExceptionHandler(ArithmeticException.class)
    public Result<?> handlerArithmeticException(ArithmeticException e){
        log.error(e.getMessage(),e);
        return Result.error("计算失败,请检查计算过程!");
    }
}
