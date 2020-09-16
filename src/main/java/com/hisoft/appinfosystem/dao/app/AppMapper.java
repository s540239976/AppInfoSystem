package com.hisoft.appinfosystem.dao.app;

import com.hisoft.appinfosystem.pojo.App;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AppMapper {
    List<App> queryAppList(App app);

    String queryLevelById(Integer id);

    String queryFlatFromById(Integer id);

    String queryStatusById(Integer id);

    String queryNewVersionById(Integer id);

    Integer count(App app);

    Integer count1(App app);

    App queryOneApp(Integer id);

    Integer modifyStatus(@Param("num") Integer num,@Param("id") Integer id);

    List<App> queryAppList1(App app);

    Integer delete(Integer id);

    Integer addApp(App app);

    Integer modifyApp(App app);
}
