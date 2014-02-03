package com.gjjt.pojo;

import com.gjjt.dao.FileSysDAO;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: HP
 * Date: 13-7-19
 * Time: ÏÂÎç11:14
 * To change this template use File | Settings | File Templates.
 */
public class tnum_fix_first {
    private Integer ID;
    private String KEY;
    private String VALUE;
    private FileSysDAO dao;

    public tnum_fix_first() {
    }

    public tnum_fix_first(Integer ID, String KEY, String VALUE) {
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

    public List getTnumPrefixFirst(){
        return this.dao.getTnumPrefixFirst();
    }

    public List getTnumPrefixSecond(){
        return this.dao.getTnumPrefixSecond();
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
