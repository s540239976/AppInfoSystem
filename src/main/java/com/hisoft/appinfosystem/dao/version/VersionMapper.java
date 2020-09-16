package com.hisoft.appinfosystem.dao.version;

import com.hisoft.appinfosystem.pojo.Version;
import org.omg.CORBA.INTERNAL;

import java.util.List;

public interface VersionMapper {
    List<Version> quueryVersionById(Integer id);

    Integer addVersion(Version version);

    Integer modifyVersion(Version version);
}
