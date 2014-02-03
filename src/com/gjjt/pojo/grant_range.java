package com.gjjt.pojo;

import com.gjjt.dao.FileSysDAO;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: HP
 * Date: 13-7-18
 * Time: ÏÂÎç8:37
 * To change this template use File | Settings | File Templates.
 */
public class grant_range {
    private Integer ID;
    private String KEY;
    private String VALUE;
    private FileSysDAO dao;

    public grant_range() {
    }

    public grant_range(Integer ID, String KEY, String VALUE) {
        this.ID = ID;
        this.KEY = KEY;
        this.VALUE = VALUE;
    }

    public FileSysDAO getDao() {
        return dao;
    }

    public void setDao(FileSysDAO dao) {
        this.dao = dao;
    }

    public List getGrantRange(){
        return this.dao.getGrantRange();
    }

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public String getKEY() {
        return KEY;
    }

    public void setKEY(String KEY) {
        this.KEY = KEY;
    }

    public String getVALUE() {
        return VALUE;
    }

    public void setVALUE(String VALUE) {
        this.VALUE = VALUE;
    }
}
