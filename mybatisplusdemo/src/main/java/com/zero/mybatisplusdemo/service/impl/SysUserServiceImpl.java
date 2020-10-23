package com.zero.mybatisplusdemo.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zero.mybatisplusdemo.entity.SysUser;
import com.zero.mybatisplusdemo.mapper.SysUserMapper;
import com.zero.mybatisplusdemo.service.ISysUserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * @author zhyj
 * @version 1.0
 * @date 2020/8/26 13:13
 */
@Service("userService")
@Transactional
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements ISysUserService {

    @Resource
    private SysUserMapper sysUserMapper;
}
