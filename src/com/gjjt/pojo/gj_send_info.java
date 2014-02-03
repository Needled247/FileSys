package com.gjjt.pojo;

import com.gjjt.dao.FileSysDAO;

import java.util.Date;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: HP
 * Date: 13-8-26
 * Time: ÏÂÎç11:44
 * To change this template use File | Settings | File Templates.
 */
public class gj_send_info {
    private Integer ID;
    private Integer SENDID;
    private String DEPARTMENT;
    private String TBL;
    private String ISCHECK;
    private String CHECKPERSON;
    private Date ITIME;
    private FileSysDAO dao;

    public gj_send_info() {
    }

    public gj_send_info(Integer ID, Integer SENDID, String DEPARTMENT, String TBL, String ISCHECK, String CHECKPERSON, Date ITIME) {
        this.ID = ID;
        this.SENDID = SENDID;
        this.DEPARTMENT = DEPARTMENT;
        this.TBL = TBL;
        this.ISCHECK = ISCHECK;
        this.CHECKPERSON = CHECKPERSON;
        this.ITIME = ITIME;
    }

    public FileSysDAO getDao() {
        return dao;
    }

    public void setDao(FileSysDAO dao) {
        this.dao = dao;
    }


    public boolean InsertSendInfo(final gj_send_info info){
        return this.dao.InsertSendInfo(info);
    }

    public boolean DelSendInfo(final String id){
        return this.dao.DelSendInfo(id);
    }

    public List getInfoByDepartment(final String Department){
        return this.dao.getInfoByDepartment(Department);
    }

    public boolean delSendInfo(final int id,final String tbl){
        return this.dao.delSendInfo(id,tbl);
    }

    public String getCheckById(final int id,final String department){
        return this.dao.getCheckById(id,department);
    }

    public boolean updateSendInfoById(final int id,final String checkperson,final String department){
        return this.dao.updateSendInfoById(id,checkperson,department);
    }

    public boolean delSendInfoTbl(final int id,final String tbl){
        return this.dao.delSendInfo(id,tbl);
    }

    public String executeSituation(int id, String tbl, String status){
        return this.dao.executeSituation(id,tbl,status);
    }

    public List getSendInfoByParam(int id, String tbl){
        return this.dao.getSendInfoByParam(id,tbl);
    }

    public List getFileByTime(final String from,final String to,final String department){
        return this.dao.getFileByTime(from,to,department);
    }

    public List getFileByTime(final String from,final String to){
        return this.dao.getFileByTime(from,to);
    }

    public Date getITIME() {
        return ITIME;
    }

    public void setITIME(Date ITIME) {
        this.ITIME = ITIME;
    }

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public Integer getSENDID() {
        return SENDID;
    }

    public void setSENDID(Integer SENDID) {
        this.SENDID = SENDID;
    }

    public String getDEPARTMENT() {
        return DEPARTMENT;
    }

    public void setDEPARTMENT(String DEPARTMENT) {
        this.DEPARTMENT = DEPARTMENT;
    }

    public String getTBL() {
        return TBL;
    }

    public void setTBL(String TBL) {
        this.TBL = TBL;
    }

    public String getISCHECK() {
        return ISCHECK;
    }

    public void setISCHECK(String ISCHECK) {
        this.ISCHECK = ISCHECK;
    }

    public String getCHECKPERSON() {
        return CHECKPERSON;
    }

    public void setCHECKPERSON(String CHECKPERSON) {
        this.CHECKPERSON = CHECKPERSON;
    }
}
