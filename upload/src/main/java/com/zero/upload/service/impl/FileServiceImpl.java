package com.zero.upload.service.impl;

import com.zero.upload.model.FileException;
import com.zero.upload.service.FileService;


import com.zero.upload.utils.DateUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import org.springframework.util.DigestUtils;

/**
 * @Author: zhyj
 * @Date: 2020/6/18 14:56
 */
@Service
public class FileServiceImpl implements FileService {

    @Value("${file.upload-dir}")
    private String path;

    /**
     * 存储文件到系统
     *
     * @param file 文件
     * @return 文件名
     */
    @Override
    public String storeFile(MultipartFile file) {
        // Normalize file name
        String originalFilename = file.getOriginalFilename();
        String suffix = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
        String fileName=DateUtils.getTime()+"."+suffix;

        try {
            InputStream inputStream = file.getInputStream();
            String md5 = DigestUtils.md5DigestAsHex(inputStream);
            System.out.println(md5);

            //TODO 判断如果已经存储了该文件 查询出已经存储的文件路径
        } catch (IOException e) {
            e.printStackTrace();
        }

        try {
            // Copy file to the target location (Replacing existing file with the same name)
            Path dayDir = Paths.get(path).
                    resolve(DateUtils.getYear()).
                    resolve(DateUtils.getYear()).
                    resolve(DateUtils.getMonth()).
                    resolve(DateUtils.getDay());

            Files.createDirectories(dayDir);

            Path targetLocation = dayDir.
                    resolve(fileName);
            Files.copy(file.getInputStream(), targetLocation, StandardCopyOption.REPLACE_EXISTING);

            return fileName;
        } catch (IOException ex) {
            throw new FileException("Could not store file " + fileName + ". Please try again!", ex);
        }
    }

    /**
     * 加载文件
     * @param fileName 文件名
     * @return 文件
     */
    @Override
    public Resource loadFileAsResource(String fileName) {
        try {
            Path filePath = Paths.get(path).resolve(fileName).normalize();
            Resource resource = new UrlResource(filePath.toUri());
            if(resource.exists()) {
                return resource;
            } else {
                throw new FileException("File not found " + fileName);
            }
        } catch (MalformedURLException ex) {
            throw new FileException("File not found " + fileName, ex);
        }
    }
}
