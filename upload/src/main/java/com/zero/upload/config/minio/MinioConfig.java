package com.zero.upload.config.minio;

import com.zero.upload.utils.minio.MinioUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Slf4j
@Configuration
public class MinioConfig {
    @Value(value = "${jeecg.minio.minio_url}")
    private String minioUrl;
    @Value(value = "${jeecg.minio.minio_name}")
    private String minioName;
    @Value(value = "${jeecg.minio.minio_pass}")
    private String minioPass;
    @Value(value = "${jeecg.minio.bucketName}")
    private String bucketName;

    @Bean
    public void initMinio(){
        if(!minioUrl.startsWith("http")){
            minioUrl = "http://" + minioUrl;
        }
        if(!minioUrl.endsWith("/")){
            minioUrl = minioUrl.concat("/");
        }
        MinioUtil.setMinioUrl(minioUrl);
        MinioUtil.setMinioName(minioName);
        MinioUtil.setMinioPass(minioPass);
        MinioUtil.setBucketName(bucketName);
    }

}
