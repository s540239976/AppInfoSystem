package com.hisoft.appinfosystem.service.app;

import com.hisoft.appinfosystem.dao.app.AppMapper;
import com.hisoft.appinfosystem.pojo.App;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AppServiceImpl implements AppService {
    @Autowired
    private AppMapper appMapper;
    @Override
    public List<App> queryAppList(App app) {
        Integer count = appMapper.count(app);
        if(count%5==0){
            app.setTotalPageSize(count/5);
        }else{
            app.setTotalPageSize(count/5+1);
        }
        app.setFrom((app.getCurrPageNo()-1)*app.getPageSize());
        List<App> appList = appMapper.queryAppList(app);
        for (App obj : appList) {
            obj.setLevel1(appMapper.queryLevelById(obj.getCategoryLevel1()));
            obj.setLevel2(appMapper.queryLevelById(obj.getCategoryLevel2()));
            obj.setLevel3(appMapper.queryLevelById(obj.getCategoryLevel3()));
            obj.setFlatFormName(appMapper.queryFlatFromById(obj.getFlatformId()));
            obj.setStatusName(appMapper.queryStatusById(obj.getStatus()));
            if(obj.getVersionId()!=0){
                obj.setNewVersion(appMapper.queryNewVersionById(obj.getVersionId()));
            }
        }
        return appList;
    }

    @Override
    public App queryOneApp(Integer id) {
        App app = appMapper.queryOneApp(id);
        app.setLevel1(appMapper.queryLevelById(app.getCategoryLevel1()));
        app.setLevel2(appMapper.queryLevelById(app.getCategoryLevel2()));
        app.setLevel3(appMapper.queryLevelById(app.getCategoryLevel3()));
        app.setFlatFormName(appMapper.queryFlatFromById(app.getFlatformId()));
        app.setStatusName(appMapper.queryStatusById(app.getStatus()));
        if(app.getVersionId()!=0){
            app.setNewVersion(appMapper.queryNewVersionById(app.getVersionId()));
        }
        return app;
    }

    @Override
    public Integer modifyStatus(Integer num, Integer id) {
        Integer res = appMapper.modifyStatus(num, id);
        return res;
    }

    @Override
    public List<App> queryAppList1(App app) {
        Integer count = appMapper.count1(app);
        if(count%5==0){
            app.setTotalPageSize(count/5);
        }else{
            app.setTotalPageSize(count/5+1);
        }
        app.setFrom((app.getCurrPageNo()-1)*app.getPageSize());
        List<App> appList = appMapper.queryAppList1(app);
        for (App obj : appList) {
            obj.setLevel1(appMapper.queryLevelById(obj.getCategoryLevel1()));
            obj.setLevel2(appMapper.queryLevelById(obj.getCategoryLevel2()));
            obj.setLevel3(appMapper.queryLevelById(obj.getCategoryLevel3()));
            obj.setFlatFormName(appMapper.queryFlatFromById(obj.getFlatformId()));
            obj.setStatusName(appMapper.queryStatusById(obj.getStatus()));
            if(obj.getVersionId()!=0){
                obj.setNewVersion(appMapper.queryNewVersionById(obj.getVersionId()));
            }
        }
        return appList;
    }

    @Override
    public Integer delete(Integer id) {
        Integer res = appMapper.delete(id);
        return res;
    }

    @Override
    public Integer addApp(App app) {
        Integer res = appMapper.addApp(app);
        return res;
    }

    @Override
    public Integer modifyApp(App app) {
        Integer res = appMapper.modifyApp(app);
        return res;
    }
}
