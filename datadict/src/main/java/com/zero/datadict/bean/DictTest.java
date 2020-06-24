package com.zero.datadict.bean;

import com.zero.datadict.annotation.DataDictClass;
import com.zero.datadict.annotation.DataDictField;
import lombok.Data;
import org.springframework.stereotype.Component;

/**
 * @Author: zhyj
 * @Date: 2020/6/23 11:21
 */
@Data
@Component
@DataDictClass
public class DictTest {

    private String name;

    @DataDictField(dictType = DataDictField.Type.COMMON,fieldName = "status")
    private Integer status;
}
