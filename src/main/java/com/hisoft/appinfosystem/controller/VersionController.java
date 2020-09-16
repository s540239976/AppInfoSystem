package com.hisoft.appinfosystem.controller;

import com.hisoft.appinfosystem.dao.app.AppMapper;
import com.hisoft.appinfosystem.dao.version.VersionMapper;
import com.hisoft.appinfosystem.pojo.App;
import com.hisoft.appinfosystem.pojo.DevUser;
import com.hisoft.appinfosystem.pojo.Version;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/version")
public class VersionController {
    @Autowired
    private VersionMapper versionMapper;
    @Autowired
    private AppMapper appMapper;

    @RequestMapping("/query")
    public String query(@RequestParam("id") Integer id, Model model){
        List<Version> versionList = versionMapper.quueryVersionById(id);
        model.addAttribute("versionList",versionList);
        return "devappinfo";
    }

    @RequestMapping("/addVersion")
    public String addVersion(Version version,
                             @RequestParam("apk")MultipartFile multipartFile,
                             Model model, HttpSession session){
        String savePath = null;
        if (!multipartFile.isEmpty()) {
            String oldName = multipartFile.getOriginalFilename();
            long size = multipartFile.getSize();
            String surfix = FilenameUtils.getExtension(oldName);
            if (size > 5000* 1024) {
                model.addAttribute("uploadFileError", "上传文件不能超过5000k");
                return "addversion";
            } else {
                String[] types = {"apk"};
                if (!Arrays.asList(types).contains(surfix)) {
                    model.addAttribute("uploadFileError", "上传文件的类型只能为apk");
                    return "addversion";
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
                        return "addversion";
                    }
                    savePath = targetPath + File.separator + fileName;
                    version.setApkFileName(fileName);
                }
            }
        }
        DevUser devUser =(DevUser) session.getAttribute("devUser");
        version.setCreatedBy(devUser.getId());
        version.setCreationDate(new Date());
        version.setApkLocPath(savePath);
        Integer res = versionMapper.addVersion(version);
        return "redirect:/app/query1";
    }

    @RequestMapping("/modifyVersion")
    public String modifyVersion(@RequestParam("id") Integer id,Model model){
        List<Version> versionList = versionMapper.quueryVersionById(id);
        model.addAttribute("versionList",versionList);
        return "modifyversion";
    }

    @RequestMapping("/modifyVersionSave")
    public String modifyVersionSave(@RequestParam("id") Integer id,Version version,HttpSession session){
        DevUser devUser =(DevUser) session.getAttribute("devUser");
        version.setModifyBy(devUser.getId());
        version.setModifyDate(new Date());
        version.setId(id);
        Integer res = versionMapper.modifyVersion(version);
        return "redirect:/app/query1";
    }

}
