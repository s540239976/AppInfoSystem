package com.hisoft.appinfosystem.controller;

import com.hisoft.appinfosystem.pojo.FlatFrom;
import com.hisoft.appinfosystem.pojo.Level;
import com.hisoft.appinfosystem.service.dict.DictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/dict")
public class DictController {
    @Autowired
    private DictService dictService;

    @RequestMapping("/queryFlatFroms")
    @ResponseBody
    public List<FlatFrom> queryFlatFroms(){
        List<FlatFrom> flatFormList = dictService.queryFlatForm();
        return flatFormList;
    }

    @RequestMapping("/queryLevel")
    @ResponseBody
    public List<Level> queryLevel(@RequestParam(value = "id",defaultValue = "0") Integer id){
        List<Level> levelList = dictService.queryLevel(id);
        return levelList;
    }

}
