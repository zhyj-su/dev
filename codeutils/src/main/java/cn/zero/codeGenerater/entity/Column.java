package cn.zero.codeGenerater.entity;

import lombok.Data;
import lombok.ToString;

/**
 * 列对象
 */
@Data
@ToString
public class Column {
	//列名称
	private String columnName;
	//抽象的属性名称
	private String columnName2;
	//java类型
	private String columnType;
	//列数据库类型
	private String columnDbType;
	//列备注
	private String columnComment;
	//是否是主键
	private String columnKey;


}
