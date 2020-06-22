package com.zero.upload.utils;

import com.alibaba.fastjson.JSON;
import com.obs.services.ObsClient;
import com.obs.services.exception.ObsException;
import com.obs.services.model.DeleteObjectResult;
import com.obs.services.model.DeleteObjectsRequest;
import com.obs.services.model.PutObjectResult;

import com.zero.upload.config.huawei.HuaWeiConfig;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

public class OBSUtil {

//    static ObsClient obsClient = SingleOBS.getInstance();

    // 允许上传的格式
    private static final String[] IMAGE_TYPE = new String[]{".bmp", ".jpg", ".jpeg", ".gif", ".png"};


    //图片文件上传
    public static String uploadFile(MultipartFile multipartFile, String objectName, String filePath, String fileUrl) {

        boolean isLegal = false;
        for (String type : IMAGE_TYPE) {
            if (StringUtils.endsWithIgnoreCase(multipartFile.getOriginalFilename(), type)) {
                isLegal = true;
                break;  // 只要与允许上传格式其中一个匹配就可以
            }
        }
        if (!isLegal) {
            throw new RuntimeException("图片格式错误");
        }
        if (multipartFile.getSize() > 5 * 1024 * 1024) {
            throw new RuntimeException("图片格式错误");
        }
        String url_return = "";
        try {
            //文件的名字
            String originalFilename = multipartFile.getOriginalFilename();
            //文件后缀
            String substring = originalFilename.substring(originalFilename.lastIndexOf(".")).toLowerCase();

            if (null == objectName || "".equals(objectName)) {
                objectName = "user";
            }
            if (null == filePath || "".equals(filePath)) {
                //组合新的文件名加后缀
                filePath = Calendar.getInstance().getTimeInMillis() + UUID.randomUUID().toString() + substring;
            }

            ObsClient obsClient = new ObsClient(HuaWeiConfig.ak, HuaWeiConfig.sk, HuaWeiConfig.endPoint);
            // 上传文件流。
            InputStream inputStream = multipartFile.getInputStream();
            PutObjectResult response = obsClient.putObject(fileUrl, objectName + "/" + filePath, inputStream);
            if (response.getStatusCode() == 200) {
//                url_return = response.getObjectUrl();
//                url_return = url_return.replace("%2F", "/");
                url_return = "https://" + fileUrl + ".obs.cn-north-4.myhuaweicloud.com" + "/" + objectName + "/" + filePath;
//                url_return = "https://css-backup-1576836465369.obs.cn-north-4.myhuaweicloud.com";
            } else {
                throw new RuntimeException("上传失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            // 上传失败
            throw new RuntimeException("上传失败");
        }
        return url_return;
    }


    //上传byte数组图片
    public static String uploadFileByte(String file, String objectName, String fileUrl) {
        String url_return = "";
        ObsClient obsClient = new ObsClient(HuaWeiConfig.ak, HuaWeiConfig.sk, HuaWeiConfig.endPoint);
        try {
            byte[] buffer = Base64.decodeBase64(file);
            //组合新的文件名加后缀
            String filePath = Calendar.getInstance().getTimeInMillis() + UUID.randomUUID().toString() + ".jpg";
            PutObjectResult response = obsClient.putObject(fileUrl, "robot/" + objectName + "/" + filePath, new ByteArrayInputStream(buffer));
            if (response.getStatusCode() == 200) {
//                url_return = response.getObjectUrl();
//                url_return = url_return.replace("%2F", "/");
                url_return = "https://" + fileUrl + ".obs.cn-north-4.myhuaweicloud.com" + "/" + objectName + "/" + filePath;
//                url_return = "https://css-backup-1576836465369.obs.cn-north-4.myhuaweicloud.com";
            } else {
                throw new RuntimeException("上传失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            // 上传失败
            throw new RuntimeException("上传失败");
        } finally {
            if (obsClient != null) {
                try {
                    obsClient.close();
                } catch (IOException e) {
                }
            }
        }
        return url_return;
    }


    /**
     * 上传附件集合
     *
     * @param multipartFiles
     * @param objectName
     * @param filePath
     * @return
     */
    public static List<String> uploadFileList(List<MultipartFile> multipartFiles, String objectName, String filePath, String fileUrl) {
        List<String> urlList = new ArrayList<>();
        ObsClient obsClient = new ObsClient(HuaWeiConfig.ak, HuaWeiConfig.sk, HuaWeiConfig.endPoint);
        int i = 0;
        for (MultipartFile multipartFile : multipartFiles) {
            i++;
            boolean isLegal = false;
            for (String type : IMAGE_TYPE) {
                if (StringUtils.endsWithIgnoreCase(multipartFile.getOriginalFilename(), type)) {
                    isLegal = true;
                    break;  // 只要与允许上传格式其中一个匹配就可以
                }
            }
            if (!isLegal) {
                throw new RuntimeException("图片格式错误");
            }
            if (multipartFile.getSize() > 5 * 1024 * 1024) {
                throw new RuntimeException("图片格式错误");
            }
            String url_return = "";
            try {
                //文件的名字
                String originalFilename = multipartFile.getOriginalFilename();
                //文件后缀
                String substring = originalFilename.substring(originalFilename.lastIndexOf(".")).toLowerCase();

                if (null == objectName || "".equals(objectName)) {
                    objectName = "user";
                }
                //组合新的文件名加后缀
                filePath = Calendar.getInstance().getTimeInMillis() + UUID.randomUUID().toString() + i + substring;


                // 上传文件流。
                InputStream inputStream = multipartFile.getInputStream();
                PutObjectResult response = obsClient.putObject(fileUrl, objectName + "/" + filePath, inputStream);
//                url_return = response.getObjectUrl();
//                url_return = url_return.replace("%2F", "/");
                if (response.getStatusCode() == 200) {
//                url_return = response.getObjectUrl();
//                url_return = url_return.replace("%2F", "/");
                    url_return = "https://" + fileUrl + ".obs.cn-north-4.myhuaweicloud.com" + "/" + objectName + "/" + filePath;
//                url_return = "https://css-backup-1576836465369.obs.cn-north-4.myhuaweicloud.com";
                    urlList.add(url_return);
                } else {
                    throw new RuntimeException("上传失败");
                }

            } catch (Exception e) {
                e.printStackTrace();
                // 上传失败
                throw new RuntimeException("上传失败");
            }
        }
        if (obsClient != null) {
            try {
                obsClient.close();
            } catch (IOException e) {
            }
        }

        return urlList;
    }

    //图片文件上传
    public static String uploadVoice(MultipartFile multipartFile, String fileUrl) {
        ObsClient obsClient = new ObsClient(HuaWeiConfig.ak, HuaWeiConfig.sk, HuaWeiConfig.endPoint);
        String url_return = "";
        try {
            String objectName = "voice";

            String originalFilename = multipartFile.getOriginalFilename(); //文件的名字
            String substring = originalFilename.substring(originalFilename.lastIndexOf(".")).toLowerCase();//文件后缀
            String filePath = Calendar.getInstance().getTimeInMillis() + UUID.randomUUID().toString() + substring;//组合新的文件名加后缀

            // 上传文件流。
            InputStream inputStream = multipartFile.getInputStream();
            PutObjectResult response = obsClient.putObject(fileUrl, objectName + "/" + filePath, inputStream);
            if (response.getStatusCode() == 200) {
                url_return = "https://" + fileUrl + ".obs.cn-north-4.myhuaweicloud.com" + "/" + objectName + "/" + filePath;
            } else {
                throw new RuntimeException("上传失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            // 上传失败
            throw new RuntimeException("上传失败");
        } finally {
            if (obsClient != null) {
                try {
                    obsClient.close();
                } catch (IOException e) {
                }
            }
        }
        return url_return;
    }

    //删除图片
    public static boolean delImgF(String url, String fileUrl) {
        if(StringUtils.isEmpty(url)){
            throw new RuntimeException("删除失败！");
        }
        if (!url.contains("obs.cn-north-4.myhuaweicloud.com")) {
            throw new RuntimeException("删除失败！");
        }
        String str = "https://" + fileUrl + ".obs.cn-north-4.myhuaweicloud.com" + "/";
        url = url.replace(str, "");
        ObsClient obsClient = new ObsClient(HuaWeiConfig.ak, HuaWeiConfig.sk, HuaWeiConfig.endPoint);
        try {
            DeleteObjectsRequest request = new DeleteObjectsRequest();
//            DeleteObjectResult result =  obsClient.deleteObject(HuaWeiConfig.bucketname, url);
            DeleteObjectResult result = obsClient.deleteObject(fileUrl, url);
            System.out.println(result.getVersionId());
            System.out.println(result.getObjectKey());

            System.out.println(JSON.toJSONString(result));
        } catch (ObsException e) {
            System.out.println("Response Code: " + e.getResponseCode());
            System.out.println("Error Message: " + e.getErrorMessage());
            System.out.println("Error Code:       " + e.getErrorCode());
            System.out.println("Request ID:      " + e.getErrorRequestId());
            System.out.println("Host ID:           " + e.getErrorHostId());
        } finally {
            if (obsClient != null) {
                try {
                    obsClient.close();
                } catch (IOException e) {
                }
            }
        }
        return true;
    }
}
