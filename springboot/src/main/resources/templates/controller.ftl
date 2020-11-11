package ${basePackageUrl}.controller;

import ${basePackageUrl}.bean.${entityName};
import ${basePackageUrl}.service.${entityName}Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.RestController;
import org.springframework.web.bind.annotation.*;

import java.util.List;


/**
* @Description: ${entityName}Controller
* @Author: zhyj
* @Date:   ${.now?string["yyyy-MM-dd"]}
* @Version: V1.0
*/
@Slf4j
@RestController("${entityName}")
@Api(tags="${tableDesc}")
public class ${entityName}Controller {

    @Resource
    private I${entityName}Service ${entityNameLower}Service;


    /**
    * 添加
    *
    * @param ${entityNameLower}
    * @return
    */
    @ApiOperation(value="${entityName}-添加", notes="${entityName}-添加")
    @PostMapping
    public Result<?> add(@RequestBody ${entityName} ${entityNameLower}) {
        ${entityNameLower}Service.add(${entityNameLower});
        return Result.ok("添加成功！");
    }

    /**
    * 删除
    *
    * @param id
    * @return
    */
    @ApiOperation(value="${entityName}-删除", notes="${entityName}-删除")
    @DeleteMapping(value = "/{id}")
    public Result<?> del(@PathVariable String id) {
        ${entityNameLower}Service.del(${entityNameLower});
        return Result.ok("删除成功！");
    }

    /**
    * 批量删除
    *
    * @param ${entityName}
    * @return
    */
    @ApiOperation(value="${entityName}-批量删除", notes="${entityName}-批量删除")
    @DeleteMapping(value = "/batch/{ids}")
    public Result<?> batchDel(@PathVariable String ids) {
        ${entityNameLower}Service.batchDel(${entityNameLower});
        return Result.ok("删除成功！");
    }

    /**
    * 修改
    *
    * @param ${entityName}
    * @return
    */
    @ApiOperation(value="${entityName}-修改", notes="${entityName}-修改")
    @PutMapping(value = "/edit")
    public Result<?> update(@RequestBody ${entityName} ${entityNameLower}) {
        ${entityNameLower}Service.update(${entityNameLower});
        return Result.ok("删除成功！");
    }

    /**
    * 查看
    *
    * @param ${entityName}
    * @return
    */
    @ApiOperation(value="${entityName}-查看", notes="${entityName}-查看")
    @GetMapping(value = "/{id}")
    public Result<?> view(@PathVariable String id) {
        ${entityNameLower}Service.view(${entityNameLower});
        return Result.ok("删除成功！");
    }

    /**
    * 列表查看
    *
    * @param ${entityName}
    * @return
    */
    @ApiOperation(value="${entityName}-查看", notes="${entityName}-查看")
    @GetMapping
    public Result<?> list(@RequestBody ${entityName} ${entityNameLower},
                          @RequestParam(name="pageNo", defaultValue="1") Integer pageNo,
                          @RequestParam(name="pageSize", defaultValue="10") Integer pageSize) {
        LambdaQueryWrapper<${entityName}> queryWrapper = buildQueryWrapper(${entityNameLower});
        Page<${entityName}> page = new Page<${entityName}>(pageNo, pageSize);
        return Result.ok(${entityNameLower}Service.page(page, queryWrapper)));
    }

    /**
    * 构建查询对象
    */
    private void buildQueryWrapper(${entityName} ${entityNameLower}){
        LambdaQueryWrapper<${entityName}> queryWrapper = new LambdaQueryWrapper<>();
        //TODO 构建查询条件
        return queryWrapper;
    }

}