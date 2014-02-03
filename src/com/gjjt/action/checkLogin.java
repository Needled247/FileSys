package com.gjjt.action;

import com.gjjt.pojo.gj_User;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

/**
 * Author: JH
 * Date: 13-7-7
 * Time: 下午10:31
 * 功能：登陆验证Action
 */
public class checkLogin extends ActionSupport {
    private String userid;
    private String userpass;

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getUserpass() {
        return userpass;
    }

    public void setUserpass(String userpass) {
        this.userpass = userpass;
    }

    @Override
    public String execute() throws Exception {
        gj_User user = new gj_User();
        user.setUserid(userid);
        user.setUserpass(userpass);
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-config.xml");
        gj_User bean = ctx.getBean("gj_user",gj_User.class);
        List li = bean.loginCheck(user);
        Iterator it = li.iterator();
        user = new gj_User();
        HttpServletResponse response = ServletActionContext.getResponse();
        HttpServletRequest request = ServletActionContext.getRequest();

        response.setContentType("text/html;charset=GBK");
        PrintWriter out = response.getWriter();
        while (it.hasNext()){
            user = (gj_User)it.next();
            request.getSession().setAttribute("lid",user.getLevel());
            request.getSession().setAttribute("uid",user.getUserid());
            request.getSession().setAttribute("uname",user.getUsername());
            request.getSession().setAttribute("department",user.getDepartment());
            out.print(user.getLevel());
            System.out.println(user.getUsername()+"已登录。权限为："+user.getLevel()+"；属于："+user.getDepartment()+"部门。");
        }
        if(li.isEmpty()){
            out.print("fail");
        }
        out.flush();
        out.close();
        return null;
    }
}
