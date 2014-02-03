package com.gjjt.action;

import com.gjjt.pojo.gj_User;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

/**
 * Created with IntelliJ IDEA.
 * User: HP
 * Date: 13-8-16
 * Time: ÏÂÎç4:17
 * To change this template use File | Settings | File Templates.
 */
public class ChangePassAction extends ActionSupport {
    private String oldpass;
    private String newpass1;
    private String newpass2;
    private String uid;

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getOldpass() {
        return oldpass;
    }

    public void setOldpass(String oldpass) {
        this.oldpass = oldpass;
    }

    public String getNewpass1() {
        return newpass1;
    }

    public void setNewpass1(String newpass1) {
        this.newpass1 = newpass1;
    }

    public String getNewpass2() {
        return newpass2;
    }

    public void setNewpass2(String newpass2) {
        this.newpass2 = newpass2;
    }

    @Override
    public String execute() throws Exception {
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html;charset=GBK");
        PrintWriter out = response.getWriter();
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-config.xml");
        gj_User user = ctx.getBean("gj_user",gj_User.class);
        if(!newpass1.equals(newpass2)){
            out.print("error");
        }
        else {
            if(user.checkPassword(uid,oldpass)){
                if(user.changePass(newpass1,uid)){
                    out.print("success");
                }
            }
            else {
                out.print("ck_err");
            }
        }
        out.flush();
        out.close();
        return null;
    }
}
