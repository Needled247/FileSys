package com.gjjt.action;

import com.gjjt.pojo.gj_file_plant;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.File;

/**
 * Created with IntelliJ IDEA.
 * User: HP
 * Date: 13-7-25
 * Time: ����12:54
 * To change this template use File | Settings | File Templates.
 */
public class CreateFileAction extends ActionSupport {
    private String sendTime;
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
    private String ctype;
    private File fileInput;
    private String fileInputContentType;
    private String fileInputFileName;

    public File getFileInput() {
        return fileInput;
    }

    public void setFileInput(File fileInput) {
        this.fileInput = fileInput;
    }

    public String getFileInputContentType() {
        return fileInputContentType;
    }

    public void setFileInputContentType(String fileInputContentType) {
        this.fileInputContentType = fileInputContentType;
    }

    public String getFileInputFileName() {
        return fileInputFileName;
    }

    public void setFileInputFileName(String fileInputFileName) {
        this.fileInputFileName = fileInputFileName;
    }

    public String getSendTime() {
        return sendTime;
    }

    public void setSendTime(String sendTime) {
        this.sendTime = sendTime;
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

    public String getCtype() {
        return ctype;
    }

    public void setCtype(String ctype) {
        this.ctype = ctype;
    }

    @Override
    public String execute() throws Exception {
        String xnum = xnum1+xnum2;
        String tnum = tnum1+tnum2+tnum3;
        gj_file_plant plantFile = new gj_file_plant();
        plantFile.setSENDTIME(sendTime);
        plantFile.setXNUM1(xnum1);
        plantFile.setXNUM2(xnum2);
        plantFile.setTNUM1(tnum1);
        plantFile.setTNUM2(tnum2);
        plantFile.setTNUM3(tnum3);
        plantFile.setCADDRESS(caddress);
        if(!quantity.equals("")){
            plantFile.setQUANTITY(Integer.parseInt(quantity));
        }
        else {
            plantFile.setQUANTITY(0);
        }
        if(!rhquantity.equals("")){
            plantFile.setRHQUANTITY(Integer.parseInt(rhquantity));
        }
        else {
            plantFile.setRHQUANTITY(0);
        }

        plantFile.setFILENAME(filename);
        plantFile.setFUNAME(funame);
        plantFile.setFILETYPE(filetype);
        plantFile.setSNUM(Integer.parseInt(snum));
        plantFile.setCOPYRANGE(copyrange);
        plantFile.setGRANTRANGE(grantrange);
        plantFile.setCFILETYPE(ctype);
        plantFile.setSTATUS("0");
        plantFile.setATTURL(ServletActionContext.getServletContext().getRealPath("/upload/")+"\\"+fileInputFileName);
        plantFile.setTBL("gj_file_plant");
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-config.xml");
        gj_file_plant bean = ctx.getBean("gj_file_plant",gj_file_plant.class);
        if(bean.newPlantArticle(plantFile)){
            String realPath = ServletActionContext.getServletContext().getRealPath("/upload");
            if(fileInput !=null ){
                File destFile = new File(new File(realPath), fileInputFileName);//���� parent ����·������ child ·�����ַ�������һ���� File ʵ����
                if(!destFile.getParentFile().exists())//�ж�·��"/images"�Ƿ����
                    destFile.getParentFile().mkdirs();//��������ڣ��򴴽���·��
                //���ļ����浽Ӳ���ϣ���Ϊaction���н�������ʱ�ļ��ͻ��Զ���ɾ��
                FileUtils.copyFile(fileInput, destFile);
            }
            return SUCCESS;
        }
        else {
            return ERROR;
        }
    }
}
