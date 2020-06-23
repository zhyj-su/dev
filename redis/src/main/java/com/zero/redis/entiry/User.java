package com.zero.redis.entiry;

import lombok.Data;

import java.util.Date;

/**
 * @Author: zhyj
 * @Date: 2020/6/23 18:06
 */
@Data
public class User {
    private Long id;
    private String guid;
    private String name;
    private String age;
    private Date createTime;
}
