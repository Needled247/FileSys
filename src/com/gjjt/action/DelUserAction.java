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
 * Date: 13-10-21
 * Time: ÏÂÎç3:19
 * To change this template use File | Settings | File Templates.
 */
public class DelUserAction extends ActionSupport {
    private String id;
    private String userid;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    @Override
    public String execute() throws Exception {
        HttpServletResponse response = ServletActionContext.getResponse();
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-config.xml");
        gj_User user = ctx.getBean("gj_user",gj_User.class);
        response.setContentType("text/html;charset=GBK");
        PrintWriter out = response.getWriter();
        if(user.delUser(Integer.parseInt(id))){
            out.print("success");
        }
        else {
            out.print("fail");
        }
        out.flush();
        out.close();
        return null;
    }
}
