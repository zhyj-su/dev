package com.zero.mybatisplusdemo;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zero.mybatisplusdemo.entity.SysUser;
import com.zero.mybatisplusdemo.service.ISysUserService;
import com.zero.mybatisplusdemo.service.impl.SysUserServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author zhyj
 * @version 1.0
 * @date 2020/8/26 13:29
 */
@SpringBootTest
public class SysUserTests {

    @Resource(name = "sysUserService")
    private ISysUserService sysUserService;

    @Test
    public void testAdd(){
        SysUser sysUser = new SysUser();
        sysUser.setUsername("lisi");
        sysUser.setRealname("李四");
        sysUser.setPassword("1234567");
        sysUser.setSalt("123456");
        sysUser.setAvatar("http://baidu.com");
        sysUser.setBirthday(new Date());
        sysUser.setSex(1);
        sysUser.setEmail("14141240867@qq.com");
        sysUser.setPhone("13776565678");
        sysUser.setOrgCode("orgcode");
        sysUser.setOrgCodeTxt("orgCodeText");
        sysUser.setStatus(1);
        sysUser.setDelFlag(0);
        sysUser.setWorkNo("123456");
        sysUser.setPost("post");
        sysUser.setTelephone("0512272245");
        sysUser.setCreateBy("admin");
        sysUser.setCreateTime(new Date());
        sysUser.setUpdateTime(new Date());
        sysUser.setActivitiSync(1);
        sysUser.setUserIdentity(0);
        sysUser.setDepartIds("depart");
        sysUser.setThirdId("1");
        sysUser.setThirdType("wechat");
        sysUser.setRelTenantIds("tenantIds");

        sysUserService.save(sysUser);

    }


    @Test
    public void testDel(){

        //删除
        QueryWrapper<SysUser> sysUserQueryWrapper = new QueryWrapper<>();
        sysUserQueryWrapper.eq("id","1298497797757636609");
        sysUserService.remove(sysUserQueryWrapper);

        Map<String,Object> map = new HashMap<>();
        map.put("usename","lisi");
        map.put("realName","李四");
        sysUserService.removeByMap(map);
    }

    @Test
    public void testRemoveByMap(){

        Map<String,Object> map = new HashMap<>();
        map.put("username","lisi");
        map.put("realname","李四");
        sysUserService.removeByMap(map);
    }
}
