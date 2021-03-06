package com.zero.springboot.listener;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.alibaba.excel.exception.ExcelDataConvertException;
import com.alibaba.fastjson.JSON;
import com.zero.springboot.parameter.LtProductQualifyImportParameter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;

/**
 * @author zhyj
 * @version 1.0
 * @date 2020/11/2 11:31
 */
//不要交给spring进行管理
public class UploadDataListener extends AnalysisEventListener<LtProductQualifyImportParameter> {

    private static final Logger log = LoggerFactory.getLogger(UploadDataListener.class);

    /**
     * 每隔5条存储数据库，实际使用中可以3000条，然后清理list ，方便内存回收
     */
    private static final int BATCH_COUNT = 2000;
    List<LtProductQualifyImportParameter> list = new ArrayList<LtProductQualifyImportParameter>();

    @Override
    public void invoke(LtProductQualifyImportParameter data, AnalysisContext analysisContext) {
        log.info("解析到一条数据:{}", JSON.toJSONString(data));
        list.add(data);
        if (list.size() >= BATCH_COUNT) {
            saveData();
            list.clear();
        }
        log.info("invoke...");
    }

    @Override
    public void doAfterAllAnalysed(AnalysisContext analysisContext) {
        log.info("doAfterAllAnalysed...");
    }



    /**
     * 加上存储数据库
     */
    private void saveData() {
        log.info("{}条数据，开始存储数据库！", list.size());
        log.info("存储数据库成功！");
    }
}
