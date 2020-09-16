package com.hisoft.appinfosystem.service.user1;

import com.hisoft.appinfosystem.pojo.BackUser;
import com.hisoft.appinfosystem.pojo.DevUser;
import org.apache.ibatis.annotations.Param;

public interface User1Service {
    public DevUser queryOneUser(String userCode, String password);
}
