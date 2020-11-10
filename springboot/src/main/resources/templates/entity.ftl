package ${basePackageUrl}.bean;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
* @Description: ${entityName}
* @Author: zhyj
* @Date:   ${.now?string["yyyy-MM-dd"]}
* @Version: V1.0
*/
@ApiModel(value="lt_product_quality_basic对象", description="成品质量管理")
@Data
public class ${entityName} implements Serializable {

    private static final long serialVersionUID = 1L;

    <#if columns??>
    <#--循环生成变量-->
        <#list columns as col>

            /**
            * ${col["columnName"]}
            */
            @ApiModelProperty(value = "${col["columnRemark"]}")
            private ${col["columnType"]} ${col["entityColumnNo"]};

        </#list>

    </#if>
}