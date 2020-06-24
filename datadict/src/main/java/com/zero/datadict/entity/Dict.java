package com.zero.datadict.entity;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 *
 * @author zhyj
 * @since 2020-06-23
 */
@Data
@Entity(name="dict")
public class Dict implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue
    private Integer id;

    @Column(nullable = false)
    private String type;

    @Column(nullable = false)
    private String tableName;

    @Column(nullable = false)
    private String fieldName;

    @Column(nullable = false)
    private String fieldValue;

    @Column(nullable = false)
    private String fieldDetail;

    @Column(nullable = false)
    private String depict;

    @Column(nullable = false)
    private LocalDateTime createTime;

    @Column(nullable = false)
    private LocalDateTime updateTime;


}
