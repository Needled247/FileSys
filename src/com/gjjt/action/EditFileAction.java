package com.gjjt.action;

import com.gjjt.pojo.gj_file_company;
import com.gjjt.pojo.gj_file_plant;
import com.gjjt.pojo.gj_send_info;
import com.gjjt.tool.FileSysTool;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created with IntelliJ IDEA.
 * User: HP
 * Date: 13-8-21
 * Time: 下午1:42
 * To change this template use File | Settings | File Templates.
 */
public class EditFileAction extends ActionSupport {
    private String sendtime;
    private String xnum1;
    private String xnum2;
    private String tnum1;
    private String tnum2;
    private String tnum3;
    private String caddress;
    private String quantity;
    private String rhquantity;
    private String filename;
    private String funame;
    private String filetype;
    private String snum;
    private String copyrange;
    private String grantrange;
    private String cfiletype;
    private String copyquantity;
    private String isinvalid;
    private String recquantity;
    private String pid;
    private String tbl;
    private String type;
    private String attr;
    HttpServletResponse response = ServletActionContext.getResponse();
    ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-config.xml");
    gj_send_info infoBean = ctx.getBean("gj_send_info",gj_send_info.class);
    gj_file_plant plantBean = ctx.getBean("gj_file_plant",gj_file_plant.class);
    gj_file_company compBean = ctx.getBean("gj_file_company",gj_file_company.class);

    public String getAttr() {
        if(attr==null){
            attr="";
        }
        return attr;
    }

    public void setAttr(String attr) {
        this.attr = attr;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getSendtime() {
        return sendtime;
    }

    public void setSendtime(String sendtime) {
        this.sendtime = sendtime;
    }

    public String getXnum1() {
        return xnum1;
    }

    public void setXnum1(String xnum1) {
        this.xnum1 = xnum1;
    }

    public String getXnum2() {
        return xnum2;
    }

    public void setXnum2(String xnum2) {
        this.xnum2 = xnum2;
    }

    public String getTnum1() {
        return tnum1;
    }

    public void setTnum1(String tnum1) {
        this.tnum1 = tnum1;
    }

    public String getTnum2() {
        return tnum2;
    }

    public void setTnum2(String tnum2) {
        this.tnum2 = tnum2;
    }

    public String getTnum3() {
        return tnum3;
    }

    public void setTnum3(String tnum3) {
        this.tnum3 = tnum3;
    }

    public String getCaddress() {
        return caddress;
    }

    public void setCaddress(String caddress) {
        this.caddress = caddress;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getRhquantity() {
        return rhquantity;
    }

    public void setRhquantity(String rhquantity) {
        this.rhquantity = rhquantity;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getFuname() {
        return funame;
    }

    public void setFuname(String funame) {
        this.funame = funame;
    }

    public String getFiletype() {
        return filetype;
    }

    public void setFiletype(String filetype) {
        this.filetype = filetype;
    }

    public String getSnum() {
        return snum;
    }

    public void setSnum(String snum) {
        this.snum = snum;
    }

    public String getCopyrange() {
        return copyrange;
    }

    public void setCopyrange(String copyrange) {
        this.copyrange = copyrange;
    }

    public String getGrantrange() {
        return grantrange;
    }

    public void setGrantrange(String grantrange) {
        this.grantrange = grantrange;
    }

    public String getCfiletype() {
        return cfiletype;
    }

    public void setCfiletype(String cfiletype) {
        this.cfiletype = cfiletype;
    }

    public String getCopyquantity() {
        return copyquantity;
    }

    public void setCopyquantity(String copyquantity) {
        this.copyquantity = copyquantity;
    }

    public String getIsinvalid() {
        return isinvalid;
    }

    public void setIsinvalid(String isinvalid) {
        this.isinvalid = isinvalid;
    }

    public String getRecquantity() {
        return recquantity;
    }

    public void setRecquantity(String recquantity) {
        this.recquantity = recquantity;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getTbl() {
        return tbl;
    }

    public void setTbl(String tbl) {
        this.tbl = tbl;
    }

    @Override
    public String execute() throws Exception {
        System.out.println(attr);
        response.setContentType("text/html;charset=GBK");
        PrintWriter out = response.getWriter();
        //编辑
        if(type.equals("editFile")){
            if(this.Str2Tbl(tbl).equals("gj_file_plant")){
                this.savePlantFile();
            }
            else if(this.Str2Tbl(tbl).equals("gj_file_company")){
                this.saveCompFile();
            }
        }
        //删除
        if(type.equals("delFile")){
            if(this.Str2Tbl(tbl).equals("gj_file_plant")){
                gj_file_plant plant = new gj_file_plant();
                plant.setID(Integer.parseInt(pid));
                if(plantBean.DelPlantFileInfo(plant)&&infoBean.delSendInfo(Integer.parseInt(pid),this.Str2Tbl(tbl))){
                    out.print("success");
                }
                else{
                    out.print("fail");
                }
            }
            else if(this.Str2Tbl(tbl).equals("gj_file_company")){
                gj_file_company comp = new gj_file_company();
                comp.setID(Integer.parseInt(pid));
                if(compBean.DelCompFileInfo(comp)&&infoBean.delSendInfo(Integer.parseInt(pid),this.Str2Tbl(tbl))){
                    out.print("success");
                }
                else{
                    out.print("fail");
                }
            }
        }
        out.flush();
        out.close();
        return null;
    }

    /**
     * 字符串表名转换
     * @param tbl
     * @return String
     */
    public String Str2Tbl(String tbl){
        String table = "";
        if(tbl.equals("厂发")){
            table = "gj_file_plant";
        }
        else if(tbl.equals("分公司发")){
            table = "gj_file_company";
        }
        return table;
    }

    public void savePlantFile() throws IOException {
        response.setContentType("text/html;charset=GBK");
        PrintWriter out = response.getWriter();
        gj_file_plant plant = new gj_file_plant();
        plant.setSENDTIME(sendtime);
        plant.setXNUM1(xnum1);
        plant.setXNUM2(xnum2);
        plant.setTNUM1(tnum1);
        plant.setTNUM2(tnum2);
        plant.setTNUM3(tnum3);
        plant.setCADDRESS(caddress);
        plant.setQUANTITY(Integer.parseInt(quantity));
        plant.setRHQUANTITY(Integer.parseInt(rhquantity));
        plant.setFILENAME(filename);
        plant.setFUNAME(funame);
        plant.setFILETYPE(filetype);
        plant.setSNUM(Integer.parseInt(snum));
        plant.setCOPYRANGE(String.valueOf(copyrange));
        plant.setGRANTRANGE(String.valueOf(grantrange));
        plant.setCFILETYPE(cfiletype);
        plant.setCOPYQUANTITY(copyquantity);
        plant.setISINVALID(isinvalid);
        plant.setRECQUANTITY(recquantity);
        plant.setID(Integer.parseInt(pid));
        plant.setTBL("gj_file_plant");
        plant.setATTURL(attr);
        plant.setSTATUS("1");
        plant.setITIME(new FileSysTool().getNow());
        boolean flag = false;
        flag = plantBean.EditPlantFileInfo(plant);
        if(flag){
            if(copyrange.indexOf(",")>0){
                gj_send_info info = null;
                String[] arr = copyrange.split(",");
                infoBean.DelSendInfo(pid);
                for (String aSendArr : arr) {
                    info = new gj_send_info();
                    info.setSENDID(Integer.parseInt(pid));
                    info.setDEPARTMENT(aSendArr);
                    info.setTBL("gj_file_plant");
                    info.setISCHECK("0");
                    info.setCHECKPERSON("");
                    infoBean.InsertSendInfo(info);
                }
            }
            if(grantrange.indexOf(",")>0){
                gj_send_info info = null;
                String[] arr = grantrange.split(",");
                for (String aSendArr : arr) {
                    info = new gj_send_info();
                    info.setSENDID(Integer.parseInt(pid));
                    info.setDEPARTMENT(aSendArr);
                    info.setTBL("gj_file_plant");
                    info.setISCHECK("0");
                    info.setCHECKPERSON("");
                    infoBean.InsertSendInfo(info);
                }
            }
            out.print("success");
        }
        else{
            out.print("fail");
        }
        out.flush();
        out.close();
    }

    public void saveCompFile() throws  IOException{
        response.setContentType("text/html;charset=GBK");
        PrintWriter out = response.getWriter();
        gj_file_company com = new gj_file_company();
        com.setSENDTIME(sendtime);
        com.setXNUM1(xnum1);
        com.setXNUM2(xnum2);
        com.setTNUM1(tnum1);
        com.setTNUM2(tnum2);
        com.setTNUM3(tnum3);
        com.setCADDRESS(caddress);
        com.setQUANTITY(Integer.parseInt(quantity));
        com.setRHQUANTITY(Integer.parseInt(rhquantity));
        com.setFILENAME(filename);
        com.setFUNAME(funame);
        com.setFILETYPE(filetype);
        com.setSNUM(Integer.parseInt(snum));
        com.setCOPYRANGE(String.valueOf(copyrange));
        com.setGRANTRANGE(String.valueOf(grantrange));
        com.setCFILETYPE(cfiletype);
        com.setCOPYQUANTITY(copyquantity);
        com.setISINVALID(isinvalid);
        com.setRECQUANTITY(recquantity);
        com.setID(Integer.parseInt(pid));
        com.setTBL("gj_file_company");
        com.setATTURL(attr);
        com.setSTATUS("1");
        com.setITIME(new FileSysTool().getNow());
        boolean flag = false;
        flag = compBean.EditCompFileInfo(com);
        if(flag){
            if(copyrange.indexOf(",")>0){
                gj_send_info info = null;
                String[] arr = copyrange.split(",");
                infoBean.DelSendInfo(pid);
                for (String aSendArr : arr) {
                    info = new gj_send_info();
                    info.setSENDID(Integer.parseInt(pid));
                    info.setDEPARTMENT(aSendArr);
                    info.setTBL("gj_file_company");
                    info.setISCHECK("0");
                    info.setCHECKPERSON("");
                    infoBean.InsertSendInfo(info);
                }
            }
            if(grantrange.indexOf(",")>0){
                gj_send_info info = null;
                String[] arr = grantrange.split(",");
                for (String aSendArr : arr) {
                    info = new gj_send_info();
                    info.setSENDID(Integer.parseInt(pid));
                    info.setDEPARTMENT(aSendArr);
                    info.setTBL("gj_file_company");
                    info.setISCHECK("0");
                    info.setCHECKPERSON("");
                    infoBean.InsertSendInfo(info);
                }
            }
            out.print("success");
        }
        else{
            out.print("fail");
        }
        out.flush();
        out.close();
    }
}
