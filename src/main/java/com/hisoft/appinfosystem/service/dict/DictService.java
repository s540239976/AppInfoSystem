package com.hisoft.appinfosystem.service.dict;

import com.hisoft.appinfosystem.pojo.FlatFrom;
import com.hisoft.appinfosystem.pojo.Level;

import java.util.List;

public interface DictService {
    List<FlatFrom> queryFlatForm();

    List<Level> queryLevel(Integer id);
}
