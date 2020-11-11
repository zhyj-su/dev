package ${basePackageUrl}.mappper;

import ${basePackageUrl}.entity.${entityName};

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;


/**
* @Description: ${entityName}Mapper
* @Author: zhyj
* @Date:   ${.now?string["yyyy-MM-dd"]}
* @Version: V1.0
*/
public interface ${entityName}Mapper extends BaseMapper<${entityName}>{

    void batchInsert(List<${entityName}> ${entityName}List);

}