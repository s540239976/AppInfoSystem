package com.hisoft.appinfosystem.service.backuser;

import com.hisoft.appinfosystem.dao.user.BackUserMapper;
import com.hisoft.appinfosystem.pojo.BackUser;
import com.hisoft.appinfosystem.service.backuser.BackUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BackUserServiceImpl implements BackUserService {
    @Autowired
    private BackUserMapper backUserMapper;
    @Override
    public BackUser queryOneUser(String userCode, String password) {
        BackUser backUser = backUserMapper.queryOneUser(userCode, password);
        return backUser;
    }
}
