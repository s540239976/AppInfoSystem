package com.hisoft.appinfosystem.service.version;

import com.hisoft.appinfosystem.pojo.Version;

import java.util.List;

public interface VersionService {
    List<Version> quueryVersionById(Integer id);

    Integer addVersion(Version version);

    Integer modifyVersion(Version version);


}
