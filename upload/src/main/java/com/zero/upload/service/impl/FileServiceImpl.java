package com.zero.upload.service.impl;

import com.zero.upload.model.FileException;
import com.zero.upload.service.FileService;


import com.zero.upload.utils.DateUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Calendar;

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
        String fileName = StringUtils.cleanPath(file.getOriginalFilename());

        try {
            // Check if the file's name contains invalid characters
            if(fileName.contains("..")) {
                throw new FileException("Sorry! Filename contains invalid path sequence " + fileName);
            }

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
