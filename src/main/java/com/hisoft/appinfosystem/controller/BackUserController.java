package com.hisoft.appinfosystem.controller;

import com.hisoft.appinfosystem.pojo.BackUser;
import com.hisoft.appinfosystem.service.backuser.BackUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/backUser")
public class BackUserController {
    @Autowired
    private BackUserService backUserService;

    @RequestMapping("/login")
    public String login(@RequestParam("username")String userCode,
                        @RequestParam("password")String password,
                        HttpSession session){
        BackUser backUser = backUserService.queryOneUser(userCode, password);
        if(backUser!=null){
            session.setAttribute("backUser",backUser);
            return "index";
        }else{
            return "backlogin";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "backlogin";
    }

}
