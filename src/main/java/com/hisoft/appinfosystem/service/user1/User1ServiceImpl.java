package com.hisoft.appinfosystem.service.user1;

import com.hisoft.appinfosystem.dao.user1.User1Mapper;
import com.hisoft.appinfosystem.pojo.BackUser;
import com.hisoft.appinfosystem.pojo.DevUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class User1ServiceImpl implements User1Service {
    @Autowired
    private User1Mapper user1Mapper;
    @Override
    public DevUser queryOneUser(String userCode, String password) {
        DevUser devUser = user1Mapper.queryOneUser(userCode, password);
        return devUser;
    }
}
