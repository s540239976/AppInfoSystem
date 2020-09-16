package com.hisoft.appinfosystem.dao.user1;

import com.hisoft.appinfosystem.pojo.BackUser;
import com.hisoft.appinfosystem.pojo.DevUser;
import org.apache.ibatis.annotations.Param;

public interface User1Mapper {
    public DevUser queryOneUser(@Param("userCode") String userCode, @Param("password") String password);
}
