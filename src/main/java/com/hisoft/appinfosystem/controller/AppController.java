package com.hisoft.appinfosystem.controller;

import com.hisoft.appinfosystem.pojo.App;
import com.hisoft.appinfosystem.pojo.DevUser;
import com.hisoft.appinfosystem.pojo.Version;
import com.hisoft.appinfosystem.service.app.AppService;
import com.hisoft.appinfosystem.service.version.VersionService;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("/app")
public class AppController {
    @Autowired
    private AppService appService;
    @Autowired
    private VersionService versionService;

    @RequestMapping("/query")
    public String query(App app, Model model,@RequestParam(value = "currPageNo",defaultValue = "1") Integer currPageNo){
        app.setCurrPageNo(currPageNo);
        List<App> appList = appService.queryAppList(app);
        model.addAttribute("appList",appList);
        model.addAttribute("app",app);
        return "applist";
    }

    @RequestMapping("/appCheck")
    public String appCheck(@RequestParam("id") Integer id,Model model){
        App app = appService.queryOneApp(id);
        List<Version> versionList = versionService.quueryVersionById(id);
        model.addAttribute("versionList",versionList);
        model.addAttribute("app",app);
        return "appcheck";
    }

    @RequestMapping("/modifyStatus")
    public String modifyStatus(@RequestParam("num") Integer num,
                               @RequestParam("id") Integer id){
        Integer res = appService.modifyStatus(num, id);
        return "redirect:/app/query";
    }

    @RequestMapping("/query1")
    public String query1(App app, Model model,@RequestParam(value = "currPageNo",defaultValue = "1") Integer currPageNo){
        app.setCurrPageNo(currPageNo);
        List<App> appList = appService.queryAppList1(app);
        model.addAttribute("appList",appList);
        return "devapplist";
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Map delete(@RequestParam("id") Integer id){
        Integer res = appService.delete(id);
        Map map = new HashMap<>();
        map.put("result","true");
        return map;
    }

    @RequestMapping("/up")
    @ResponseBody
    public Map up(@RequestParam("id") Integer id){
        Integer res = appService.modifyStatus(4, id);
        Map map = new HashMap<>();
        map.put("result","true");
        return map;
    }

    @RequestMapping("/down")
    @ResponseBody
    public Map down(@RequestParam("id") Integer id){
        Integer res = appService.modifyStatus(5, id);
        Map map = new HashMap<>();
        map.put("result","true");
        return map;
    }

    @RequestMapping("/appInfo")
    public String appInfo(@RequestParam("id") Integer id,Model model){
        App app = appService.queryOneApp(id);
        List<Version> versionList = versionService.quueryVersionById(id);
        model.addAttribute("versionList",versionList);
        model.addAttribute("app",app);
        return "devappinfo";
    }

    @RequestMapping("/addVersion")
    public String addVersion(@RequestParam("id") Integer id,Model model){
        List<Version> versionList = versionService.quueryVersionById(id);
        model.addAttribute("versionList",versionList);
        return "addversion";
    }

    @RequestMapping("/addApp")
    public String addApp(App app, @RequestParam("logo")MultipartFile multipartFile,
                         HttpSession session,Model model){
        String savePath = null;
        if (!multipartFile.isEmpty()) {
            String oldName = multipartFile.getOriginalFilename();
            long size = multipartFile.getSize();
            String surfix = FilenameUtils.getExtension(oldName);
            if (size > 5000* 1024) {
                model.addAttribute("uploadFileError", "上传文件不能超过5000k");
                return "addapp";
            } else {
                String[] types = {"jpg", "png", "jpeg", "pneg", "gif"};
                if (!Arrays.asList(types).contains(surfix)) {
                    model.addAttribute("uploadFileError", "上传文件的类型只能为jpg,png,jpeg,pneg,gif");
                    return "addapp";
                } else {
                    String targetPath = session.getServletContext().getRealPath("statics" + File.separator + "upload");
                    String fileName = System.currentTimeMillis() + RandomUtils.nextInt(100000) + "_Personal." + surfix;
                    File saveFile = new File(targetPath, fileName);
                    if (!saveFile.exists()) {
                        saveFile.mkdirs();
                    }
                    try {
                        multipartFile.transferTo(saveFile);
                    } catch (IOException e) {
                        e.printStackTrace();
                        model.addAttribute("uploadFileError", "上传文件失败");
                        return "addapp";
                    }
                    savePath = targetPath + File.separator + fileName;
                }
            }
        }
        DevUser devUser = (DevUser) session.getAttribute("devUser");
        app.setCreatedBy(devUser.getId());
        app.setCreationDate(new Date());
        app.setLogoLocPath(savePath);
        Integer res = appService.addApp(app);
        return "redirect:/app/query1";
    }

    @RequestMapping("/modifyApp")
    public String modifyApp(@RequestParam("id") Integer id,Model model){
        App app = appService.queryOneApp(id);
        model.addAttribute("app",app);
        return "modifyapp";
    }

    @RequestMapping("/modifyAppSave")
    public String modifyAppSave(App app,@RequestParam("id") Integer id,
                                HttpSession session){
        DevUser devUser = (DevUser) session.getAttribute("devUser");
        app.setModifyBy(devUser.getId());
        app.setModifyDate(new Date());
        appService.modifyApp(app);
        return "redirect:/app/query1";
    }
}
