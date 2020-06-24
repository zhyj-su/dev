package cn.zero.codeGenerater.entity;

import lombok.Data;
import lombok.ToString;

import java.util.List;

/**
 * 表实体
 * @author Administrator
 *
 */
@Data
@ToString
public class Table {
	/**
	 * 表名称
	 */
	private String name;
	/**
	 * 处理后的表名称  实体类名
	 */
	private String name2;
	private String comment;
	/**
	 * 主键列
	 */
	private String key;
	/**
	 * 列集合
	 */
	private List<Column> columns;

}
