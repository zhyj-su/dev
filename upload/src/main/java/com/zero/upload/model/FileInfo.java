package com.zero.upload.model;

/**
 * @Author: zhyj
 * @Date: 2020/6/18 17:46
 */
public class FileInfo {

    private String fileName;

    private String yearDir;

    private String monthDir;

    private String dayDir;

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getYearDir() {
        return yearDir;
    }

    public void setYearDir(String yearDir) {
        this.yearDir = yearDir;
    }


    public String getMonthDir() {
        return monthDir;
    }

    public void setMonthDir(String monthDir) {
        this.monthDir = monthDir;
    }

    public String getDayDir() {
        return dayDir;
    }

    public void setDayDir(String dayDir) {
        this.dayDir = dayDir;
    }
}
