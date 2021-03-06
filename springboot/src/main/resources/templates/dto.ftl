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
@ApiModel(value="${entityName}Dto", description="${entityName}Dto")
@Data
public class ${entityName}Dto extends ${entityName} {

}