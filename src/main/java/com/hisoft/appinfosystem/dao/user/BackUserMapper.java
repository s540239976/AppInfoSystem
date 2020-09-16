package com.hisoft.appinfosystem.dao.user;

import com.hisoft.appinfosystem.pojo.BackUser;
import org.apache.ibatis.annotations.Param;

public interface BackUserMapper {
    public BackUser queryOneUser(@Param("userCode") String userCode, @Param("password") String password);
}
