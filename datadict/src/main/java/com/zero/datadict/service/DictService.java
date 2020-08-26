package com.zero.datadict.service;

import com.zero.datadict.entity.Dict;

import java.util.List;

/**
 * @Author: zhyj
 * @Date: 2020/6/23 11:00
 */
public interface DictService {
    public Dict getDictList();

    public Dict getByTypeAndTableNameAndFieldName(String type,String tableName,String fieldName);
}
