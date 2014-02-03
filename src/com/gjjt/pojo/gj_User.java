package com.gjjt.pojo;

import com.gjjt.dao.FileSysDAO;

import java.util.List;

/**
 * Author: JH
 * Date: 13-7-7
 * Time: 下午10:26
 * 用户账号表bean
 */
public class gj_User {
    private Integer id;
    private String userid;
    private String userpass;
    private String username;
    private String level;
    private String department;
    private FileSysDAO dao;

    public gj_User() {
    }

    public gj_User(Integer id, String userid, String userpass, String username, String level, String department) {
        this.id = id;
        this.userid = userid;
        this.userpass = userpass;
        this.username = username;
        this.level = level;
        this.department = department;
    }

    public List loginCheck(gj_User user){
        return this.dao.loginCheck(user);
    }

    public boolean addUser(final String username,final String userid,final String level,final String apartment){
        return this.dao.addUser(username,userid,level,apartment);
    }

    public boolean delUser(final int id){
        return this.dao.delUser(id);
    }

    public List getUser(gj_User user){
        return this.dao.getUser(user);
    }

    public boolean checkPassword(final String uid,final String password){
        return this.dao.checkPassword(uid,password);
    }

    public boolean changePass(final String newpass,final String uid){
        return this.dao.changePass(newpass,uid);
    }

    public FileSysDAO getDao() {
        return dao;
    }

    public void setDao(FileSysDAO dao) {
        this.dao = dao;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getUserpass() {
        return userpass;
    }

    public void setUserpass(String userpass) {
        this.userpass = userpass;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }
}
