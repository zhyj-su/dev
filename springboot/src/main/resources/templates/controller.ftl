package ${basePackageUrl}.controller;

import ${basePackageUrl}.bean.${entityName};
import ${basePackageUrl}.service.${entityName}Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


/**
* @Description: ${entityName}Controller
* @Author: zhyj
* @Date:   ${.now?string["yyyy-MM-dd"]}
* @Version: V1.0
*/
@Slf4j
@RestController
public class ${entityName}Controller {

    @Resource
    private ${entityName}Service ${entityNameLower}Service;

    @GetMapping("/selectByPrimaryKey")
    public ${entityName} selectByPrimaryKey(Integer id){
        return ${entityNameLower}Service.selectByPrimaryKey(id);
    }
}