package com.zero.springboot.utils;

import cn.hutool.core.util.ReflectUtil;
import com.alibaba.fastjson.JSON;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;

/**
 * @author zhyj
 * @version 1.0
 * @date 2020/11/11 15:51
 */
@Slf4j
public class KvEnumUtil {
    //私有化构造
    private KvEnumUtil(){
    }

    private static final String TEXT="text";
    private static final String VALUE="value";

    /**
     * 获取枚举名称
     * @param clazz
     * @return
     */
    public static String getEnumName(Class<?> clazz) {
        //clazz.getName()获取的是全路径名称
        return clazz.getSimpleName();
    }


    /**
     * 根据name获取枚举的value
     * @param clazz
     * @param name
     * @return
     */
    @SneakyThrows
    public static <T> T getEnumValueByName(Class<? extends Enum<?>> clazz, String name, Class<T> returnClazz){
        Enum<?>[] enums = clazz.getEnumConstants();
        for (Enum<?> anEnum : enums) {
            String ename = anEnum.name();
            if(name.equals(ename)){
                return (T)ReflectUtil.getFieldValue(anEnum,KvEnumUtil.VALUE);
            }
        }
        return null;
    }

    /**
     * 根据值获取第一个枚举中第一个name
     * @param clazz
     * @param value
     * @return
     */
    public static String getEnumNameByValue(Class<? extends Enum<?>> clazz,Object value){
        Enum<?>[] enums = clazz.getEnumConstants();
        for (Enum<?> anEnum : enums) {
            Object fieldValue = ReflectUtil.getFieldValue(anEnum, KvEnumUtil.VALUE);
            if(fieldValue.equals(value)){
                return anEnum.name();
            }
        }
        return null;
    }


    /**
     * 根据text获取枚举的value
     * @param clazz
     * @param text
     * @return
     */
    public static <T> T getEnumValueByText(Class<? extends Enum<?>> clazz,String text,Class<T> returnClazz){
        Enum<?>[] enums = clazz.getEnumConstants();
        for (Enum<?> anEnum : enums) {
            String eText = (String) ReflectUtil.getFieldValue(anEnum,KvEnumUtil.TEXT);
            if(eText.equals(text)){
                return (T)ReflectUtil.getFieldValue(anEnum,KvEnumUtil.VALUE);
            }
        }
        return null;
    }

    /**
     * 根据value获取第一个枚举中第一个text
     * @param clazz
     * @param value
     * @return
     */
    public static String getEnumTextByValue(Class<? extends Enum<?>> clazz,Object value){
        Enum<?>[] enums = clazz.getEnumConstants();
        for (Enum<?> anEnum : enums) {
            Object fieldValue = ReflectUtil.getFieldValue(anEnum, KvEnumUtil.VALUE);
            if(fieldValue.equals(value)){
                return (String) ReflectUtil.getFieldValue(anEnum, KvEnumUtil.TEXT);
            }
        }
        return null;
    }


}
