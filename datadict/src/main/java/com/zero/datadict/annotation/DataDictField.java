package com.zero.datadict.annotation;

import java.lang.annotation.*;

/**
 * @Author: zhyj
 * @Date: 2020/6/23 13:11
 */
@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Inherited
public @interface DataDictField {
    enum Type{COMMON,TABLE} ;
    Type dictType() default Type.COMMON;
    String tableName() default "";
    String fieldName();
}
