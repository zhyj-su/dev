<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${basePackageUrl}.dao.${entityName}Dao">


    <!--${tableName}批量插入-->
    <insert id="insertForList" parameterType="list">
        insert into ${tableName}
        (
        <#if columns??>
        <#--循环生成变量-->
            <#list columns as col>
                ${col["columnName"]}<#if col_has_next>,</#if>
            </#list>

        </#if>
        )
        values
        <foreach collection="list" item="item" separator=",">
            (
            <#if columns??>
            <#--循环生成变量-->
                <#list columns as col>
                    ${r"#{item."}${col["columnName"]}}<#if col_has_next>,</#if>
                </#list>

            </#if>
            )
        </foreach>
    </insert>


</mapper>