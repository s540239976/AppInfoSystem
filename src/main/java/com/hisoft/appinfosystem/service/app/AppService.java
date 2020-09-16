package com.hisoft.appinfosystem.service.app;

import com.hisoft.appinfosystem.pojo.App;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AppService {
    List<App> queryAppList(App app);

    App queryOneApp(Integer id);

    Integer modifyStatus(Integer num,Integer id);

    List<App> queryAppList1(App app);

    Integer delete(Integer id);

    Integer addApp(App app);

    Integer modifyApp(App app);

}
