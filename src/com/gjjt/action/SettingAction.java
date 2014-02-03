package com.gjjt.action;

import com.gjjt.pojo.caddress;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: HP
 * Date: 13-10-31
 * Time: ÉÏÎç12:52
 * To change this template use File | Settings | File Templates.
 */
public class SettingAction extends ActionSupport {
    HttpServletResponse response = ServletActionContext.getResponse();
    private String id;
    private String type;
    private String field;
    private String tbl;
    private String key;
    private String value;
    ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-config.xml");
    caddress bean = ctx.getBean("caddress",caddress.class);

    public String getTbl() {
        return tbl;
    }

    public void setTbl(String tbl) {
        this.tbl = tbl;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    @Override
    public String execute(){
        //²éÑ¯
        if(type.equals("search")){
            try{
                this.SearchField();
            }
            catch (IOException e){
                e.printStackTrace();
            }
        }
        //É¾³ý
        if(type.equals("del")){
            try{
                this.delField();
            }
            catch (IOException e){
                e.printStackTrace();
            }
        }
        //Ìí¼Ó
        if(type.equals("add")){
            try{
                this.addField();
            }
            catch (IOException e){
                e.printStackTrace();
            }
        }
        if(type.equals("update")){
            try {
                this.updateField();
            }
            catch (IOException e){
                e.printStackTrace();
            }
        }
        return null;
    }

    public void SearchField() throws IOException {
        response.setContentType("text/json;charset=GBK");
        PrintWriter out = response.getWriter();
        List fieldList = new ArrayList();
        fieldList = bean.getField(field);
        caddress bean = null;
        Iterator it = fieldList.iterator();
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        while (it.hasNext()){
            bean = (caddress)it.next();
            sb.append("[")
                    .append("\""+bean.getID()+"\",")
                    .append("\""+bean.getVALUE()+"\"")
                    .append("],");
        }
        if (sb.length()>1){
            sb.deleteCharAt(sb.lastIndexOf(","));
        }
        sb.append("]");
        out.print(sb);
        out.flush();
        out.close();
    }

    public void delField() throws IOException{
        response.setContentType("text/html;charset=GBK");
        PrintWriter out = response.getWriter();
        if(bean.delFieldById(field,Integer.parseInt(id))){
            out.print("success");
        }
        else {
            out.print("failed");
        }
        out.flush();
        out.close();
    }

    public void addField() throws IOException{
        response.setContentType("text/html;charset=GBK");
        PrintWriter out = response.getWriter();
        if(bean.addField(tbl,key,value)){
            out.print("success");
        }
        else {
            out.print("failed");
        }
        out.flush();
        out.close();
    }

    public void updateField() throws IOException{
        response.setContentType("text/html;charset=GBK");
        PrintWriter out = response.getWriter();
        if(bean.updateField(Integer.parseInt(id),key,value,tbl)){
            out.print("success");
        }
        else {
            out.print("failed");
        }
        out.flush();
        out.close();
    }
}
