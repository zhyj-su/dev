package com.zero.springboot.utils.freemarker;

import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson.JSON;
import freemarker.template.Configuration;
import freemarker.template.Template;
import lombok.extern.slf4j.Slf4j;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author zhyj
 * @version 1.0
 * @date 2020/11/10 16:42
 */

/**
 * 查询所有表名 select table_name from information_schema.tables where table_schema='sys_user';
 * 查询数据库表名的注释:
 *  select table_name 表名,TABLE_COMMENT 表注释 from INFORMATION_SCHEMA.TABLES Where table_schema = '数据库名称' AND table_name ="表名"
 */
@Component
@Slf4j
public class FreeMarkerUtil {
    @Resource
    private Configuration freeMarker;

    @Resource
    private JdbcTemplate jdbcTemplate;

    /**
     * 判断包路径是否存在
     */
    private void pathJudgeExist(String path){
        File file = new File(path);
        if(!file.exists()) {
            file.mkdirs();
        }
    }

    /**
     * 输出到文件
     */
    public  void printFile(Map<String, Object> root, Template template, String filePath, String fileName) throws Exception  {
        pathJudgeExist(filePath);
        File file = new File(filePath, fileName );
        if(!file.exists()) {
            file.createNewFile();
        }
        Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file), StandardCharsets.UTF_8));
        template.process(root,  out);
        out.close();
    }

    /**
     * 首字母大写
     */
    public  String capFirst(String str){
        return str.substring(0,1).toUpperCase()+str.substring(1).toLowerCase();
    }

    /**
     * 下划线命名转为驼峰命名
     */
    public String underlineToHump(String para){
        StringBuilder result=new StringBuilder();
        String a[]=para.split("_");
        for(String s:a){
            if(result.length()==0){
                result.append(s);
            }else{
                result.append(s.substring(0, 1).toUpperCase());
                result.append(s.substring(1).toLowerCase());
            }
        }
        return result.toString();
    }

    /**
     * 获取类名
     */
    public String getEntityName(String tableName){
        return underlineToHump(capFirst(tableName.toLowerCase()));
    }



    /**
     * 获取首字母小写类名
     */
    public String getEntityNameLower(String tableName){
        return underlineToHump(tableName.toLowerCase());
    }

    /**
     * 将[数据库类型]转换成[Java类型],如果遇到没有写的类型,会出现Undefine,在后面补充即可
     */
    public  String convertToJava(String columnType){
        String result;
        switch (columnType){
            case "VARCHAR":{
                result = "String";
                break;
            }
            case "INT":{
                result = "Integer";
                break;
            }
            case "BIGINT":{
                result = "Long";
                break;
            }
            case "FLOAT":{
                result = "Float";
                break;
            }
            case "DOUBLE":{
                result = "Double";
                break;
            }
            case "DATETIME":{
                result = "Date";
                break;
            }
            case "BIT":{
                result = "Boolean";
                break;
            }
            default:{
                result = "Undefine";
                break;
            }
        }
        return result;
    }

    /**
     * 匹配字符串中的英文字符
     */
    public String matchResult(String str) {
        String regEx2 = "[a-z||A-Z]";
        Pattern pattern = Pattern.compile(regEx2);
        StringBuilder sb = new StringBuilder();
        Matcher m = pattern.matcher(str);
        while (m.find()){
            for (int i = 0; i <= m.groupCount(); i++)
            {
                sb.append(m.group());
            }
        }
        return sb.toString();
    }

    /**
     * 获取当前连接的数据库名
     * @return
     */
    public String getDataBaseName(){
        String currentDataBaseSql="select database() databaseName";
        List<Map<String, Object>> dataBases = jdbcTemplate.queryForList(currentDataBaseSql);
        return  (String) dataBases.get(0).get("databaseName");
    }

    /**
     * 获取表描述
     * @param tableName
     * @return
     */
    public String getTableDesc(String tableName){
        /***
         SELECT table_name name,TABLE_COMMENT value FROM INFORMATION_SCHEMA.TABLES WHERE table_type='base table'
         and table_schema = 'a_erp' and table_name="sys_user"

         ***/
        String template="SELECT table_name name,TABLE_COMMENT value FROM INFORMATION_SCHEMA.TABLES WHERE table_type='base table'\n" +
                "and table_schema = \"{}\" and table_name=\"{}\"";
        String sql=StrUtil.format(template,getDataBaseName(),tableName);
        List<Map<String, Object>> lists = jdbcTemplate.queryForList(sql);
        log.info("lists:{}", JSON.toJSONString(lists));

        Object o = lists.get(0);
        log.info("obj:{}",JSON.toJSONString(o));

        return (String) lists.get(0).get("value");
    }

    /**
     * 获取表信息
     */
    public List<Map<String, String>> getDataInfo(String tableName){
        /**
         * SELECT
         * a.table_name tableName,
         * a.table_comment tableRemark,
         * b.COLUMN_NAME columnName,
         * b.column_comment columnRemark,
         * b.column_type columnType,
         * b.column_key columnKey
         * FROM
         * information_schema. TABLES a
         * LEFT JOIN information_schema.COLUMNS b ON a.table_name = b.TABLE_NAME
         * WHERE
         * a.table_schema = 'test'
         * and a.table_name="sys_user"
         * ORDER BY
         * a.table_name
         */

        //查询数据库表信息
        String template="SELECT DISTINCT\n" +
                "a.table_name tableName,\n" +
                "a.table_comment tableRemark,\n" +
                "b.COLUMN_NAME columnName,\n" +
                "b.column_comment columnRemark,\n" +
                "b.column_type columnType,\n" +
                "b.column_key columnKey\n" +
                "FROM\n" +
                "information_schema. TABLES a\n" +
                "LEFT JOIN information_schema.COLUMNS b ON a.table_name = b.TABLE_NAME\n" +
                "WHERE\n" +
                "a.table_schema = '{}'\n" +
                "and a.table_name=\"{}\"\n" +
                "ORDER BY\n" +
                "a.table_name";
        String sql= StrUtil.format(template,getDataBaseName(),tableName);

        // mysql查询表结构的语句,如果是其他数据库,修改此处查询语句
        //String sql = "show columns from "+tableName;
        List<Map<String, Object>> sqlToMap = jdbcTemplate.queryForList(sql);

        List<Map<String, String>> columns = new LinkedList<>();
        for (Map map : sqlToMap) {
            Map<String, String> columnMap = new HashMap<>(16);
            // 字段名称
            String columnName = map.get("columnName").toString();
            columnMap.put("columnName", columnName);
            //字段备注
            String columnRemark = map.get("columnRemark").toString();
            columnMap.put("columnRemark",columnRemark);
            // 字段类型
            String columnType = map.get("columnType").toString().toUpperCase();
            columnType = matchResult(columnType).trim();
            columnType = convertToJava(columnType);
            columnMap.put("columnType", columnType);
            // 成员名称
            columnMap.put("entityColumnNo", underlineToHump(columnName));
            columns.add(columnMap);
        }
        return columns;
    }

    /**
     * 生成代码
     */
    public void generate(Map<String, Object> root,String templateName,String saveUrl,String entityName) throws Exception {
        //获取模板
        Template template = freeMarker.getTemplate(templateName);
        //输出文件
        printFile(root, template, saveUrl, entityName);
    }
}
