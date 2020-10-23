package com.zero.ureport2.definition.fileReport;

import com.alibaba.fastjson.JSON;
import com.bstek.ureport.exception.ReportException;
import com.bstek.ureport.provider.report.ReportFile;
import com.bstek.ureport.provider.report.ReportProvider;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.*;
import java.util.*;

/**
 * @author zhyj
 * @version 1.0
 * @date 2020/10/19 9:46
 */
@Component
@Slf4j
public class FileReportProvider implements ReportProvider{
    @Value("${xinhua.erp.ureport.prefix}")
    private String prefix;

    @Value("${xinhua.erp.ureport.fileStoreDir}")
    private String fileStoreDir;

    @Value("${xinhua.erp.ureport.disabled}")
    private boolean disabled;

    @Override
    public InputStream loadReport(String file) {
        log.info("================================loadReport==========================");
        log.info("file");
        if(file.startsWith(prefix)){
            file=file.substring(prefix.length(),file.length());
        }
        String fullPath=fileStoreDir+File.separator+file;
        try {
            return new FileInputStream(fullPath);
        } catch (FileNotFoundException e) {
            throw new ReportException(e);
        }
    }

    @Override
    public void deleteReport(String file) {
        log.info("================================deleteReport==========================");
        log.info("file:{}",file);
        if(file.startsWith(prefix)){
            file=file.substring(prefix.length(),file.length());
        }
        String fullPath=fileStoreDir+"/"+file;
        File f=new File(fullPath);
        if(f.exists()){
            f.delete();
        }
    }

    @Override
    public List<ReportFile> getReportFiles() {
        log.info("================================getReportFiles==========================");
        File file=new File(fileStoreDir);
        List<ReportFile> list=new ArrayList<ReportFile>();
        for(File f:file.listFiles()){
            Calendar calendar=Calendar.getInstance();
            calendar.setTimeInMillis(f.lastModified());
            String name = f.getName();
            if(name.endsWith(".ureport.xml")){
                list.add(new ReportFile(f.getName(),calendar.getTime()));
            }
        }
        Collections.sort(list, new Comparator<ReportFile>(){
            @Override
            public int compare(ReportFile f1, ReportFile f2) {
                return f2.getUpdateDate().compareTo(f1.getUpdateDate());
            }
        });
        log.info("list:{}", JSON.toJSONString(list));
        return list;
    }

    @Override
    public void saveReport(String file, String content) {
        log.info("================================saveReport==========================");
        log.info("file:{},content:{}",file,content);
        if(file.startsWith(prefix)){
            file=file.substring(prefix.length(),file.length());
        }
        String fullPath=fileStoreDir+"/"+file;
        FileOutputStream outStream=null;
        try{
            outStream=new FileOutputStream(new File(fullPath));
            IOUtils.write(content, outStream,"utf-8");
        }catch(Exception ex){
            throw new ReportException(ex);
        }finally{
            if(outStream!=null){
                try {
                    outStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    @Override
    public String getName() {
        return "自定义文件系统";
    }

    @Override
    public boolean disabled() {
        return disabled;
    }

    public void setDisabled(boolean disabled) {
        this.disabled = disabled;
    }

    public void setFileStoreDir(String fileStoreDir) {
        this.fileStoreDir = fileStoreDir;
    }

    @Override
    public String getPrefix() {
        return prefix;
    }

}
