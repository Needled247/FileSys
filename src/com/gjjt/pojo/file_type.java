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
public class file_type {
    private Integer ID;
    private String KEY;
    private String VALUE;
    private FileSysDAO dao;

    public file_type() {
    }

    public file_type(Integer ID, String KEY, String VALUE) {
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

    public String getSnumLatest(String fileType){
        return this.dao.getSnumLatest(fileType);
    }

    public List getFileType(){
        return this.dao.getFileType();
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
