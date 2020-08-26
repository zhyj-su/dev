package com.zero.datadict.service.impl;

import com.zero.datadict.dao.DictReposity;
import com.zero.datadict.entity.Dict;
import com.zero.datadict.service.DictService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author: zhyj
 * @Date: 2020/6/23 11:02
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class DictServiceImpl implements DictService {

    @Resource
    private DictReposity dictReposity;


    @Override
    public Dict getDictList() {
        Dict dict = new Dict();
        dict.setId(1);
        dict.setTableName("1");
        dict.setType("1");
        return dict;
    }

    @Override
    public Dict getByTypeAndTableNameAndFieldName(String type, String tableName, String fieldName) {
        Dict dict=null;
        if("common".equals(type)){
            dict = dictReposity.findByFieldName(fieldName);
        }else if("table".equals(fieldName)){
            dict = dictReposity.findByTableNameAndFieldName(tableName,fieldName);
        }
        return dict;
    }
}
