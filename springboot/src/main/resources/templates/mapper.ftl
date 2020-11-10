package ${basePackageUrl}.mappper;

import ${basePackageUrl}.bean.${entityName};
import org.apache.ibatis.annotations.Mapper;


/**
* @Description: ${entityName}Mapper
* @Author: zhyj
* @Date:   ${.now?string["yyyy-MM-dd"]}
* @Version: V1.0
*/
public interface ${entityName}Mapper {

    ${entityName} selectByPrimaryKey(Integer id);

}