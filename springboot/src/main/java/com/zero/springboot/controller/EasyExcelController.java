package com.zero.springboot.controller;

import com.alibaba.excel.EasyExcel;
import com.zero.springboot.listener.UploadDataListener;
import com.zero.springboot.parameter.LtProductQualifyImportParameter;
import com.zero.springboot.vo.common.Result;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

/**
 * @author zhyj
 * @version 1.0
 * @date 2020/11/2 11:26
 */
@RestController
@RequestMapping("/easyExcel")
public class EasyExcelController {

    @PostMapping("/read")
    public Result<?> readExcel(MultipartFile file) throws IOException {
        EasyExcel.read(file.getInputStream(), LtProductQualifyImportParameter.class, new UploadDataListener()).sheet().headRowNumber(6).doRead();
        return Result.ok("read");
    }

}
