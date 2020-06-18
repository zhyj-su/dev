package com.zero.upload.service;

import org.springframework.core.io.Resource;
import org.springframework.web.multipart.MultipartFile;

/**
 * @Author: zhyj
 * @Date: 2020/6/18 14:55
 */
public interface FileService {
    public String storeFile(MultipartFile file);

    public Resource loadFileAsResource(String fileName);
}
