package ${basePackageUrl}.service;

import ${basePackageUrl}.entity.${entityName};
import com.baomidou.mybatisplus.extension.service.IService;


/**
* @Description: ${entityName}Service
* @Author: zhyj
* @Date:   ${.now?string["yyyy-MM-dd"]}
* @Version: V1.0
*/
public interface I${entityName}Service extends IService<${entityName}>{

    /**
    * 添加
    * @param ${entityNameLower}
    */
    public void add(${entityName} ${entityNameLower});

    /**
    * 删除
    * @param id
    */
    public void del(String id);

    /**
    * 批量删除
    * @param id
    */
    public void batchDel(String ids);

    /**
    * 更新
    * @param ${entityNameLower}
    */
    public void update(${entityName} ${entityNameLower});

    /**
    * 批量更新
    * @param id
    */
    public ${entityName} view(String id);

    /**
    * 列表查询
    * @param ${entityNameLower}
    */
    public List<${entityName}> ${entityName}List(${entityName} ${entityNameLower});

    /**
    * 批量插入
    * @param ${entityName}List
    */
    public void batchInsert(List<${entityName}> ${entityName}List);
}