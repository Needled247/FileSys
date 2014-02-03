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
 * Date: 13-10-7
 * Time: ÉÏÎç11:03
 * To change this template use File | Settings | File Templates.
 */
public class AddUserAction extends ActionSupport {
    private String username;
    private String apartment;
    private String level;
    private String userid;

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getApartment() {
        return apartment;
    }

    public void setApartment(String apartment) {
        this.apartment = apartment;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    @Override
    public String execute() throws Exception {
        //FileSysDAOImpl impl = new FileSysDAOImpl();
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-config.xml");
        gj_User user = ctx.getBean("gj_user",gj_User.class);
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html;charset=GBK");
        PrintWriter out = response.getWriter();
        if(user.addUser(username,userid,level,apartment)){
            out.print("success");
            out.flush();
            out.close();
        }
        return null;
    }
}
