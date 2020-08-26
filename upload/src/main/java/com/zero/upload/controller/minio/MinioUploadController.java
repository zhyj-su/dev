package com.zero.upload.controller.minio;

import com.zero.upload.utils.CommonUtils;
import com.zero.upload.utils.minio.MinioUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * @author zhyj
 * @version 1.0
 * @date 2020/8/26 10:28
 */
@RestController
@RequestMapping("minio")
@Slf4j
public class MinioUploadController {

    /**
     * 上传
     * @param request
     */
    @PostMapping(value = "/uploadMinio")
    public Map uploadMinio(HttpServletRequest request) {
        log.info("..........");
        Map<String, String> result=new HashMap<>();
        String bizPath = request.getParameter("biz");
        if(StringUtils.isEmpty(bizPath)){
            bizPath = "";
        }
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        MultipartFile file = multipartRequest.getFile("file");// 获取上传文件对象
        String orgName = file.getOriginalFilename();// 获取文件名
        orgName = CommonUtils.getFileName(orgName);
        String file_url =  MinioUtil.upload(file,bizPath);
        result.put("success",String.valueOf(true));
        return result;
    }

    @PostMapping(value = "/delFile")
    public Map delFile(@RequestBody Map<String, String> map){
        Map<String, Object> result = new HashMap();
        String bucketName = map.get("bucketName");
        String objectName = map.get("objectName");
        Boolean flag = MinioUtil.removeObject(bucketName, objectName);
        result.put("succcess",flag);
        return result;
    }



}
