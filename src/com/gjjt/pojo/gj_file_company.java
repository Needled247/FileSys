package com.gjjt.pojo;

import com.gjjt.dao.FileSysDAO;

/**
 * 厂发文件bean
 * User: JH
 * Date: 13-7-15
 * Time: 上午12:21
 */
public class gj_file_company {
    private Integer ID;
    private String XNUM1;
    private String XNUM2;
    private String TNUM1;
    private String TNUM2;
    private String TNUM3;
    private String CADDRESS;
    private Integer QUANTITY;
    private String FILENAME;
    private String FUNAME;
    private String FILETYPE;
    private Integer SNUM;
    private String CONTROLNUM;
    private String HANDOBJ;
    private String RPERSON;
    private String COPYRANGE;
    private String GRANTRANGE;
    private String COPYQUANTITY;
    private String ISINVALID;
    private String RECQUANTITY;
    private String CFILETYPE;
    private Integer RHQUANTITY;
    private String ATTURL;
    private String SENDTIME;
    private String TBL;
    private String STATUS;
    private String ITIME;
    private FileSysDAO dao;

    public gj_file_company() {
    }

    public gj_file_company(Integer ID, String XNUM1, String XNUM2, String TNUM1, String TNUM2, String TNUM3, String CADDRESS, Integer QUANTITY, String FILENAME, String FUNAME, String FILETYPE, Integer SNUM, String CONTROLNUM, String HANDOBJ, String RPERSON, String COPYRANGE, String GRANTRANGE, String COPYQUANTITY, String ISINVALID, String RECQUANTITY, String CFILETYPE, Integer RHQUANTITY, String ATTURL, String SENDTIME, String TBL, String STATUS, String ITIME) {
        this.ID = ID;
        this.XNUM1 = XNUM1;
        this.XNUM2 = XNUM2;
        this.TNUM1 = TNUM1;
        this.TNUM2 = TNUM2;
        this.TNUM3 = TNUM3;
        this.CADDRESS = CADDRESS;
        this.QUANTITY = QUANTITY;
        this.FILENAME = FILENAME;
        this.FUNAME = FUNAME;
        this.FILETYPE = FILETYPE;
        this.SNUM = SNUM;
        this.CONTROLNUM = CONTROLNUM;
        this.HANDOBJ = HANDOBJ;
        this.RPERSON = RPERSON;
        this.COPYRANGE = COPYRANGE;
        this.GRANTRANGE = GRANTRANGE;
        this.COPYQUANTITY = COPYQUANTITY;
        this.ISINVALID = ISINVALID;
        this.RECQUANTITY = RECQUANTITY;
        this.CFILETYPE = CFILETYPE;
        this.RHQUANTITY = RHQUANTITY;
        this.ATTURL = ATTURL;
        this.SENDTIME = SENDTIME;
        this.TBL = TBL;
        this.STATUS = STATUS;
        this.ITIME = ITIME;
    }

    public FileSysDAO getDao() {
        return dao;
    }

    public void setDao(FileSysDAO dao) {
        this.dao = dao;
    }

    public boolean newCompanyArticle(final gj_file_company newFile){
        return this.dao.newCompanyArticle(newFile);
    }

    public boolean EditCompFileInfo(final gj_file_company comp){
        return this.dao.EditCompFileInfo(comp);
    }

    public boolean DelCompFileInfo(final gj_file_company comp){
        return this.dao.DelCompFileInfo(comp);
    }

    public String getFileCount(String tbl){
        return this.dao.getFileCount(tbl);
    }

    public String getITIME() {
        return ITIME;
    }

    public void setITIME(String ITIME) {
        this.ITIME = ITIME;
    }

    public String getSTATUS() {
        return STATUS;
    }

    public void setSTATUS(String STATUS) {
        this.STATUS = STATUS;
    }

    public String getTNUM3() {
        return TNUM3;
    }

    public void setTNUM3(String TNUM3) {
        this.TNUM3 = TNUM3;
    }

    public String getTNUM2() {
        return TNUM2;
    }

    public void setTNUM2(String TNUM2) {
        this.TNUM2 = TNUM2;
    }

    public String getTNUM1() {
        return TNUM1;
    }

    public void setTNUM1(String TNUM1) {
        this.TNUM1 = TNUM1;
    }

    public String getXNUM2() {
        return XNUM2;
    }

    public void setXNUM2(String XNUM2) {
        this.XNUM2 = XNUM2;
    }

    public String getXNUM1() {
        return XNUM1;
    }

    public void setXNUM1(String XNUM1) {
        this.XNUM1 = XNUM1;
    }

    public String getTBL() {
        return TBL;
    }

    public void setTBL(String TBL) {
        this.TBL = TBL;
    }

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public String getCADDRESS() {
        return CADDRESS;
    }

    public void setCADDRESS(String CADDRESS) {
        this.CADDRESS = CADDRESS;
    }

    public Integer getQUANTITY() {
        return QUANTITY;
    }

    public void setQUANTITY(Integer QUANTITY) {
        this.QUANTITY = QUANTITY;
    }

    public String getFILENAME() {
        return FILENAME;
    }

    public void setFILENAME(String FILENAME) {
        this.FILENAME = FILENAME;
    }

    public String getFUNAME() {
        return FUNAME;
    }

    public void setFUNAME(String FUNAME) {
        this.FUNAME = FUNAME;
    }

    public String getFILETYPE() {
        return FILETYPE;
    }

    public void setFILETYPE(String FILETYPE) {
        this.FILETYPE = FILETYPE;
    }

    public Integer getSNUM() {
        return SNUM;
    }

    public void setSNUM(Integer SNUM) {
        this.SNUM = SNUM;
    }

    public String getCONTROLNUM() {
        return CONTROLNUM;
    }

    public void setCONTROLNUM(String CONTROLNUM) {
        this.CONTROLNUM = CONTROLNUM;
    }

    public String getHANDOBJ() {
        return HANDOBJ;
    }

    public void setHANDOBJ(String HANDOBJ) {
        this.HANDOBJ = HANDOBJ;
    }

    public String getRPERSON() {
        return RPERSON;
    }

    public void setRPERSON(String RPERSON) {
        this.RPERSON = RPERSON;
    }

    public String getCOPYRANGE() {
        return COPYRANGE;
    }

    public void setCOPYRANGE(String COPYRANGE) {
        this.COPYRANGE = COPYRANGE;
    }

    public String getGRANTRANGE() {
        return GRANTRANGE;
    }

    public void setGRANTRANGE(String GRANTRANGE) {
        this.GRANTRANGE = GRANTRANGE;
    }

    public String getCOPYQUANTITY() {
        return COPYQUANTITY;
    }

    public void setCOPYQUANTITY(String COPYQUANTITY) {
        this.COPYQUANTITY = COPYQUANTITY;
    }

    public String getISINVALID() {
        return ISINVALID;
    }

    public void setISINVALID(String ISINVALID) {
        this.ISINVALID = ISINVALID;
    }

    public String getRECQUANTITY() {
        return RECQUANTITY;
    }

    public void setRECQUANTITY(String RECQUANTITY) {
        this.RECQUANTITY = RECQUANTITY;
    }

    public String getCFILETYPE() {
        return CFILETYPE;
    }

    public void setCFILETYPE(String CFILETYPE) {
        this.CFILETYPE = CFILETYPE;
    }

    public Integer getRHQUANTITY() {
        return RHQUANTITY;
    }

    public void setRHQUANTITY(Integer RHQUANTITY) {
        this.RHQUANTITY = RHQUANTITY;
    }

    public String getATTURL() {
        return ATTURL;
    }

    public void setATTURL(String ATTURL) {
        this.ATTURL = ATTURL;
    }

    public String getSENDTIME() {
        return SENDTIME;
    }

    public void setSENDTIME(String SENDTIME) {
        this.SENDTIME = SENDTIME;
    }
}
