package com.hisoft.appinfosystem.service.backuser;

import com.hisoft.appinfosystem.pojo.BackUser;
import org.apache.ibatis.annotations.Param;

public interface BackUserService {
    public BackUser queryOneUser(String userCode,String password);
}
