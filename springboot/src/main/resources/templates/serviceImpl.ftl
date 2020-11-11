package ${basePackageUrl}.service.impl;

import ${basePackageUrl}.bean.${entityName};
import ${basePackageUrl}.dao.${entityName}Mapper;
import ${basePackageUrl}.service.I${entityName}Service;
import org.springframework.beans.factory.annotation.Resource;
import org.springframework.stereotype.Service;


/**
* @Description: ${entityName}ServiceImpl
* @Author: zhyj
* @Date:   ${.now?string["yyyy-MM-dd"]}
* @Version: V1.0
*/
@Transactional
@Service
@Slf4j
public class ${entityName}ServiceImpl ServiceImpl<${entityName}Mapper, ${entityName}> implements I${entityName}Service {

    @Resource
    private ${entityName}Mapper ${entityNameLower}Mapper;

    /**
    * 添加
    * @param ${entityNameLower}
    */
    public void add(${entityName} ${entityNameLower}){
        ${entityNameLower}Mapper.insert(${entityNameLower});
    }

    /**
    * 删除
    * @param id
    */
    public void del(String id){
        ${entityNameLower}Mapper.deleteById(id);
    }

    /**
    * 批量删除
    * @param id
    */
    public void batchDel(String ids){
        //获取要删除的id集合
        List<String> idList = Arrays.asList(ids.split(","));
        //批量删除
        ${entityNameLower}Mapper.deleteBatchIds(idList);
    }

    /**
    * 更新
    * @param ${entityNameLower}
    */
    public void update(${entityName} ${entityNameLower}){
        //根据id进行更新
        ${entityNameLower}Mapper.updateById(idList);
    }

    /**
    * 批量更新
    * @param id
    */
    public ${entityName} view(String id){
        //根据id进行查询
        return ${entityNameLower}Mapper.selectById(id);
    }

    /**
    * 批量插入
    * @param ${entityName}List
    */
    public void batchInsert(List<${entityName}> ${entityName}List){
        ${entityNameLower}Mapper.batchInsert(${entityName}List));
    }
}