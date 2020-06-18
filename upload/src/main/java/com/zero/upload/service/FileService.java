package com.zero.upload.service;

import org.springframework.core.io.Resource;
import org.springframework.web.multipart.MultipartFile;

/**
 * @Author: zhyj
 * @Date: 2020/6/18 14:55
 */
public interface FileService {
    /**
     * 存储文件方法
     * @param file 文件对象
     * @return String
     */
    String storeFile(MultipartFile file);

    Resource loadFileAsResource(String fileName);
}
