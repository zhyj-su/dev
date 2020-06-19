package com.zero.shiro.service;

import com.zero.shiro.entity.*;

import java.util.List;

/**
 * @Author: zhyj
 * @Date: 2020/6/19 13:29
 */
public interface UserService {
    /**
     * 根据用户名和密码查询用户
     * @param username 用户名
     * @param password 密码
     * @return User
     */
    User findByUserNameAndPassword(String username, String password);

    /**
     * 增加用户
     * @param user 用户
     * @return User
     */
    User userAdd(User user);

    /**
     * 查询用户拥有的角色
     * @param id 用户id
     * @return List<UserRole>
     */
    List<UserRole> getUserRoleByUserId(Integer id);

    /**
     * 查询用户拥有的角色
     * @param id 用户id
     * @return List<Role>
     */
    List<Role> getRolesByUserId(Integer id);


    /**
     * 查询用户拥有的权限
     * @param id 用户id
     * @return List<Permission>
     */
    List<Permission> getPermissionsByUserId(Integer id);
}
