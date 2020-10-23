package com.zero.ureport2.definition.dataSource;

import com.bstek.ureport.definition.datasource.BuildinDatasource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * @author zhyj
 * @version 1.0
 * @date 2020/10/19 9:31
 */
@Component
@Slf4j
public class UreportDataSource implements BuildinDatasource {
    @Resource
    private DataSource dataSource;

    private static final String NAME = "BuildInDataSource";

    @Override
    public String name() {
        return NAME;
    }

    @Override
    public Connection getConnection() {
        try {
            return dataSource.getConnection();
        } catch (SQLException e) {
            log.error("获取ureport数据源失败");
            e.printStackTrace();
        }
        return null;
    }
}
