package com.zero.datadict.dao;

import com.zero.datadict.entity.Dict;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * @Author: zhyj
 * @Date: 2020/6/23 10:59
 */
public interface DictReposity extends JpaRepository<Dict,Integer> {
    /**
     * type为table时的查询
     * @param table 表名
     * @param fieldName 字段名
     * @return Dict
     */
    Dict findByTableNameAndFieldName(String table,String fieldName);

    /**
     * type为common时的查询
     * @param fieldName 字段名称
     * @return Dict
     */
    Dict findByFieldName(String fieldName);
}
