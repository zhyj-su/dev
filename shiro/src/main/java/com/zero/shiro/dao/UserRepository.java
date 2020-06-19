package com.zero.shiro.dao;

import com.zero.shiro.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @Author: zhyj
 * @Date: 2020/6/19 13:27
 */
public interface UserRepository extends JpaRepository<User,Integer> {
    /**
     * 根据用户名和密码查询用户
     * @param username 用户名
     * @param password 密码
     * @return User 用户
     */
    User findByUserNameAndPassWord(String username,String password);
}
