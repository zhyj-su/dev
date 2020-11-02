package com.zero.springboot.parameter;

import com.alibaba.excel.annotation.ExcelProperty;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author zhyj
 * @version 1.0
 * @date 2020/10/30 10:10
 */
@Data
public class LtProductQualifyImportParameter {

    /**卷号*/
    @ExcelProperty(index = 0)
    @ApiModelProperty(value = "卷号")
    private String reelVolumeNumber;

    /**直径*/
    @ExcelProperty(index = 1)
    @ApiModelProperty(value = "直径")
    private String diameter;

    /**表面*/
    @ExcelProperty(index = 2)
    @ApiModelProperty(value = "表面")
    private String surface;

    /**米重*/
    @ExcelProperty(index = 3)
    @ApiModelProperty(value = "米重")
    private Double meterWeight;

    /**最大力*/
    @ApiModelProperty(value = "最大力")
    @ExcelProperty(index = 4)
    private Double maxForce;

    /**非比例延伸力*/
    @ApiModelProperty(value = "非比例延伸力")
    @ExcelProperty(index = 5)
    private Double nonProportionalExtensionForce;

    /**弹性模量*/
    @ApiModelProperty(value = "弹性模量")
    @ExcelProperty(index = 6)
    private Double modulsElasticity;

    /**抗压强度*/
    @ApiModelProperty(value = "抗拉强度")
    @ExcelProperty(index = 7)
    private Double compressiveStrength;

    /**最大力下总伸长率*/
    @ApiModelProperty(value = "最大力下总伸长率")
    @ExcelProperty(index = 8)
    private Double totalElongation;

    /**断口*/
    @ApiModelProperty(value = "断口")
    @ExcelProperty(index = 9)
    private String fracture;

    /**屈强比*/
    @ApiModelProperty(value = "屈强比")
    @ExcelProperty(index = 10)
    private Double yieldRatio;

    /**失高*/
    @ApiModelProperty(value = "失高")
    @ExcelProperty(index = 11)
    private Double lossHeight;


    /**捻距*/
    @ApiModelProperty(value = "捻距")
    @ExcelProperty(index = 12)
    private Double layLength;

    /**中心丝尺寸*/
    @ApiModelProperty(value = "中心丝尺寸")
    @ExcelProperty(index = 13)
    private Double centerWireSize;
    /**边丝尺寸*/
    @ApiModelProperty(value = "边丝尺寸")
    @ExcelProperty(index = 14)
    private String sideWireSize;

    /**捻向*/
    @ApiModelProperty(value = "捻向")
    @ExcelProperty(index = 15)
    private String layDirection;

    /**质检状态*/
    @ApiModelProperty(value = "备注")
    @ExcelProperty(index = 16)
    private String remark;

    /**质检状态*/
    @ApiModelProperty(value = "质检状态 -1未检测 0合格 1不合格 2已入库")
    @ExcelProperty(index = 17)
    private String status;
}
