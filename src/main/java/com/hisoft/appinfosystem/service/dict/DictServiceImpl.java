package com.hisoft.appinfosystem.service.dict;

import com.hisoft.appinfosystem.dao.dict.DictMapper;
import com.hisoft.appinfosystem.pojo.FlatFrom;
import com.hisoft.appinfosystem.pojo.Level;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DictServiceImpl implements DictService {
    @Autowired
    private DictMapper dictMapper;
    @Override
    public List<FlatFrom> queryFlatForm() {
        List<FlatFrom> flatFromList = dictMapper.queryFlatForm();
        return flatFromList;
    }

    @Override
    public List<Level> queryLevel(Integer id) {
        List<Level> levelList = dictMapper.queryLevel(id);
        return levelList;
    }

}
