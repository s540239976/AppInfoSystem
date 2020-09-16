package com.hisoft.appinfosystem.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class App {
    private int id;
    private String softwareName;
    private String APKName;
    private String supportROM;
    private String interfaceLanguage;
    private int softwareSize;
    private Date updateDate;
    private int devId;
    private String appInfo;
    private int status;
    private Date onSaleDate;
    private Date offSaleDate;
    private int flatformId;
    private int categoryLevel3;
    private int downloads;
    private int createdBy;
    private Date creationDate;
    private int modifyBy;
    private Date modifyDate;
    private int categoryLevel1;
    private int categoryLevel2;
    private String logoPicPath;
    private String logoLocPath;
    private int versionId;
    private int from=0;
    private int pageSize=5;
    private int currPageNo=1;
    private int totalPageSize;
    private int count;

    private String flatFormName;
    private String level1;
    private String level2;
    private String level3;
    private String statusName;
    private String newVersion;
}
