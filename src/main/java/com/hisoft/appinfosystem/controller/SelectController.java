package com.hisoft.appinfosystem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/select")
public class SelectController {

    @RequestMapping("/toBackLogin")
    public String toBackLogin(){
        return "backlogin";
    }

    @RequestMapping("/toApplist")
    public String toApplist(){
        return "applist";
    }

    @RequestMapping("/toDevLogin")
    public String toDevLogin(){
        return "devlogin";
    }

    @RequestMapping("/toAddApp")
    public String toAddApp(){
        return "addapp";
    }
}
