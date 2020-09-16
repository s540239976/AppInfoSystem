package com.hisoft.appinfosystem.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class BackUser {
    private int id;
    private String userCode;
    private String userName;
    private int userType;
    private int createdBy;
    private Date creationDate;
    private int modifyBy;
    private Date modifiyDate;
    private String userPassword;
}
