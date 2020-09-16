package com.hisoft.appinfosystem.controller;

import com.hisoft.appinfosystem.pojo.BackUser;
import com.hisoft.appinfosystem.pojo.DevUser;
import com.hisoft.appinfosystem.service.user1.User1Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user1")
public class DevUserController {
    @Autowired
    private User1Service user1Service;

    @RequestMapping("/loginUser1")
    public String loginUser1(@RequestParam("username")String userCode,
                        @RequestParam("password")String password,
                        HttpSession session){
        DevUser devUser = user1Service.queryOneUser(userCode, password);
        if(devUser!=null){
            session.setAttribute("devUser",devUser);
            return "devindex";
        }else{
            return "devlogin";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "devlogin";
    }
}
