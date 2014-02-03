package com.gjjt.action;

import com.gjjt.pojo.gj_file_plant;
import com.gjjt.pojo.gj_send_info;
import com.gjjt.tool.FileSysTool;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: HP
 * Date: 13-8-7
 * Time: 下午11:29
 * To change this template use File | Settings | File Templates.
 */
public class SearchFileAction extends ActionSupport {
    private String sendTime;
    private String sendComp;
    private String type;
    private String fileName;
    private String from;
    private String to;
    private String dept;
    HttpServletResponse response = ServletActionContext.getResponse();
    ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-config.xml");
    gj_file_plant plant = ctx.getBean("gj_file_plant",gj_file_plant.class);
    gj_send_info info = ctx.getBean("gj_send_info",gj_send_info.class);
    FileSysTool tool = new FileSysTool();

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getSendTime() {
        return sendTime;
    }

    public void setSendTime(String sendTime) {
        this.sendTime = sendTime;
    }

    public String getSendComp() {
        return sendComp;
    }

    public void setSendComp(String sendComp) {
        this.sendComp = sendComp;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String execute() throws Exception {
        //按发文日期和发文单位查询
        if(type.equals("date")){
            this.SearchByDate();
        }
        else if(type.equals("time")){
            this.SearchByTime();
        }
        return null;
    }

    /**
     *  按发文日期和发文单位查询
     */
    public void SearchByDate() throws IOException {
        response.setContentType("text/json;charset=GBK");
        HttpServletRequest request = ServletActionContext.getRequest();
        PrintWriter out = response.getWriter();
        StringBuilder sb = new StringBuilder();
        List li = new ArrayList();
        li =  plant.SearchFileByDate(sendTime,sendComp);
        request.getSession().setAttribute("dept_time_file",li);
        gj_file_plant bean = null;
        Iterator it = li.iterator();
        sb.append("[");
        while (it.hasNext()){
            bean = (gj_file_plant)it.next();
            sb.append("[")
                    .append("\"" + bean.getID() + "\",")
                    .append("\""+bean.getSENDTIME()+"\",")
                    .append("\""+bean.getXNUM1()+bean.getXNUM2()+"\",")
                    .append("\"" + bean.getCADDRESS() + "\",")
                    .append("\"" + bean.getFILENAME() + "\",")
                    .append("\""+tool.tbl2department(bean.getTBL())+"\",")
                    .append("\""+tool.code2Str(bean.getSTATUS())+"\"")
                    .append("],");
        }
        if(sb.length()>1){
            sb.deleteCharAt(sb.lastIndexOf(","));
        }
        sb.append("]");
        out.print(sb);
        out.flush();
        out.close();
    }



    /**
     * 按时间段查询某部门收文
     * @throws IOException
     */
    public void SearchByTime() throws IOException{
        response.setContentType("text/json;charset=GBK");
        HttpServletRequest request = ServletActionContext.getRequest();
        PrintWriter out = response.getWriter();
        StringBuilder sb = new StringBuilder();
        List infoList = new ArrayList();
        List<gj_file_plant> exportList = new ArrayList<gj_file_plant>();
        if(dept.equals("-1")){
            infoList = info.getFileByTime(from,to);
        }
        else {
            infoList = info.getFileByTime(from,to,dept);
        }
        Iterator it1 = infoList.iterator();
        gj_send_info bean = null;
        sb.append("[");
        while (it1.hasNext()){
            bean = (gj_send_info)it1.next();
            List fileList = new ArrayList();
            fileList = plant.getFileById(bean.getSENDID(),bean.getTBL());
            Iterator it2 = fileList.iterator();
            while (it2.hasNext()){
                gj_file_plant bean2 = (gj_file_plant)it2.next();
                exportList.add(bean2);
                sb.append("[")
                        .append("\""+bean2.getID()+"\",")
                        .append("\""+bean2.getSENDTIME()+"\",")
                        .append("\""+bean2.getXNUM1()+bean2.getXNUM2()+"\",")
                        .append("\""+bean2.getCADDRESS()+"\",")
                        .append("\""+bean2.getFILENAME()+"\",")
                        .append("\""+tool.tbl2department(bean2.getTBL())+"\",")
                        .append("\""+bean2.getSTATUS()+"\"")
                        .append("],");
            }
        }
        if(sb.length()>1){
            sb.deleteCharAt(sb.lastIndexOf(","));
        }
        request.getSession().setAttribute("dept_time_file",exportList);
        sb.append("]");
        out.print(sb);
        out.flush();
        out.close();
        /*
        li = impl.SearchFileByName(fileName);
        gj_file_plant bean = null;
        Iterator it = li.iterator();
        sb.append("[");
        while (it.hasNext()){
            bean = (gj_file_plant)it.next();
            sb.append("[")
                    .append("\"" + bean.getID() + "\",")
                    .append("\""+bean.getSENDTIME()+"\",")
                    .append("\""+bean.getXNUM1()+bean.getXNUM2()+"\",")
                    .append("\"" + bean.getCADDRESS() + "\",")
                    .append("\"" + bean.getFILENAME() + "\",")
                    .append("\""+new FileSysTool().tbl2department(bean.getTBL())+"\",")
                    .append("\""+tool.code2Str(bean.getSTATUS())+"\"")
                    .append("],");
        }
        if(sb.length()>1){
            sb.deleteCharAt(sb.lastIndexOf(","));
        }
        sb.append("]");
        out.print(sb);
        out.flush();
        out.close();
        */
    }
}
