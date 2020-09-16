package com.hisoft.appinfosystem.dao.dict;

import com.hisoft.appinfosystem.pojo.FlatFrom;
import com.hisoft.appinfosystem.pojo.Level;

import java.util.List;

public interface DictMapper {
   List<FlatFrom> queryFlatForm();

   List<Level> queryLevel(Integer id);


}
