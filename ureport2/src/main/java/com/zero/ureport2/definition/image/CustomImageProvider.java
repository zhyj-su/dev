package com.zero.ureport2.definition.image;

import com.bstek.ureport.provider.image.ImageProvider;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

/**
 * @author zhyj
 * @version 1.0
 * @date 2020/10/22 11:01
 */
@Component
public class CustomImageProvider implements ImageProvider{

    private String prefix="img:";

    @Value("${xinhua.erp.ureport.fileStoreDir}")
    private String fileStoreDir;

    @Override
    public InputStream getImage(String path) {
        path=path.replaceAll(prefix,"");
        String fullPath=fileStoreDir+"/"+path;
        try {
            return new FileInputStream(fullPath);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean support(String path) {
        if(path.startsWith(prefix)){
            return true;
        }
        return false;
    }

}
