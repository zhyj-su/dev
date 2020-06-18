package com.zero.upload.model;

import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * @Author: zhyj
 * @Date: 2020/6/18 14:47
 */
@ConfigurationProperties(prefix = "file")
public class FileProperties {
    private String uploadDir;

    public String getUploadDir() {
        return uploadDir;
    }
    public void setUploadDir(String uploadDir) {
        this.uploadDir = uploadDir;
    }
}
