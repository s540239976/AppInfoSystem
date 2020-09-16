package com.hisoft.appinfosystem.service.version;

import com.hisoft.appinfosystem.dao.version.VersionMapper;
import com.hisoft.appinfosystem.pojo.Version;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class VersionServiceImpl implements VersionService {
    @Autowired
    private VersionMapper versionMapper;
    @Override
    public List<Version> quueryVersionById(Integer id) {
        List<Version> versionList = versionMapper.quueryVersionById(id);
        return versionList;
    }

    @Override
    public Integer addVersion(Version version) {
        Integer res = versionMapper.addVersion(version);
        return res;
    }

    @Override
    public Integer modifyVersion(Version version) {
        Integer res = versionMapper.modifyVersion(version);
        return res;
    }
}
