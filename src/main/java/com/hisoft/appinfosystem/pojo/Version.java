package com.hisoft.appinfosystem.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class Version {
    private int id;
    private int appId;
    private String versionNo;
    private String versionInfo;
    private int publishStatus;
    private String downloadLink;
    private int versionSize;
    private int createdBy;
    private Date creationDate;
    private int modifyBy;
    private Date modifyDate;
    private String apkLocPath;
    private String apkFileName;

    private String appName;
}
