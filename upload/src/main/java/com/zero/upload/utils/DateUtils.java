package com.zero.upload.utils;

import java.util.Calendar;

/**
 * @Author: zhyj
 * @Date: 2020/6/18 15:49
 */
public class DateUtils {
    private static Calendar calendar=Calendar.getInstance();

    private DateUtils(){}


    //获得当前年份
    public static String getYear(){
        return String.valueOf(calendar.get(Calendar.YEAR));
    }

    //获得当前月份
    public static String getMonth(){
        return String.valueOf(calendar.get(Calendar.MONTH)+1);
    }

    //获得当前日期
    public static String getDay(){
        return String.valueOf(calendar.get(Calendar.DAY_OF_MONTH));
    }

}
