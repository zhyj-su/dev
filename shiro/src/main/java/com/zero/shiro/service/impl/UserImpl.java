package com.zero.shiro.service.impl;

import com.zero.shiro.dao.*;
import com.zero.shiro.entity.*;
import com.zero.shiro.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @Author: zhyj
 * @Date: 2020/6/19 13:41
 */
@Transactional(rollbackFor = Exception.class)
@Service
@Slf4j
public class UserImpl implements UserService {
    @Resource
    private UserRepository userRepository;

    @Resource
    private PermissionReposity permissionReposity;

    @Resource
    private RoleRepository roleRepository;

    @Resource
    private UserRoleReposity userRoleReposity;

    @Resource
    private RolePermissionReposity rolePermissionReposity;

    @Override
    public User findByUserNameAndPassword(String username, String password) {

        return userRepository.findByUserNameAndPassWord(username,password);
    }

    @Override
    public User userAdd(User user) {
        return userRepository.save(user);
    }

    @Override
    public List<UserRole> getUserRoleByUserId(Integer id) {
        return userRoleReposity.findByUserId(id);
    }

    @Override
    public List<Role> getRolesByUserId(Integer id) {
        List<Role> roleList=new ArrayList<>();
        List<UserRole> userRoles = getUserRoleByUserId(id);
        for (UserRole userRole : userRoles) {
            Integer roleId = userRole.getRoleId();
            Role role = roleRepository.getOne(roleId);
            roleList.add(role);
        }
        return roleList;
    }

    @Override
    public List<Permission> getPermissionsByUserId(Integer id) {
        List<Permission> permissions=new ArrayList<>();
        List<UserRole> userRoles = getUserRoleByUserId(id);
        Set<Integer> permissionIds=new HashSet<>();
        for (UserRole userRole : userRoles) {
            Integer roleId = userRole.getRoleId();
            List<RolePermission> rolePermissions=rolePermissionReposity.findByRoleId(roleId);
            for (RolePermission rolePermission : rolePermissions) {
                Integer permissionId = rolePermission.getPermissionId();
                permissionIds.add(permissionId);
            }
        }
        //查询permission
        for (Integer permissionId : permissionIds) {
            Permission permission = permissionReposity.getOne(permissionId);
            if(permission!=null){
                permissions.add(permission);
            }
        }

        return permissions;
    }
}
