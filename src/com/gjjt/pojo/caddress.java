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
public class caddress {
    private int ID;
    private String KEY;
    private String VALUE;
    private FileSysDAO dao;

    public caddress(){}

    public caddress(int ID,String KEY,String VALUE){
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

    public List getCaddress(){
        return this.dao.getCaddress();
    }

    public List getField(String tbl){
        return this.dao.getField(tbl);
    }

    public List getFieldById(int id, String tbl){
        return this.dao.getFiledById(id,tbl);
    }

    public boolean updateField(final int id,final String key,final String value,String tbl){
        return this.dao.updateField(id,key,value,tbl);
    }

    public boolean delFieldById(String tbl,final int id){
        return this.dao.delFieldById(tbl,id);
    }

    public boolean addField(String tbl,final String key,final String value){
        return this.dao.addField(tbl,key,value);
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
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
