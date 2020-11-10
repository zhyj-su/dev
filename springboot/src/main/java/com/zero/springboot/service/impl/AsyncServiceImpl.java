package com.zero.springboot.service.impl;

import com.zero.springboot.service.IAsyncService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * @Author: zhyj
 * @Date: 2020/10/29 13:52
 */
@Service
@Slf4j
@Transactional
public class AsyncServiceImpl implements IAsyncService {

    @Async
    @Override
    public void doNoReturn() {
        try {
            // 这个方法执行需要三秒
            Thread.sleep(3000);
            log.info("方法执行结束" + new Date());
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

    }
}
