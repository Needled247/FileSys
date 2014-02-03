package com.gjjt.action;

import com.gjjt.pojo.gj_User;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: HP
 * Date: 13-10-7
 * Time: ÏÂÎç2:31
 */
public class UserManageAction extends ActionSupport {

    @Override
    public String execute() throws Exception {
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/json;charset=GBK");
        PrintWriter out = response.getWriter();
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-config.xml");
        gj_User user = ctx.getBean("gj_user",gj_User.class);
        List li = new ArrayList();
        li = user.getUser(null);
        gj_User userBean = new gj_User();
        StringBuilder sb = new StringBuilder();
        Iterator it = li.iterator();
        sb.append("[");
        while (it.hasNext()){
            userBean = (gj_User)it.next();
            sb.append("[")
                    .append("\""+userBean.getId()+"\",")
                    .append("\""+userBean.getUsername()+"\",")
                    .append("\""+userBean.getUserid()+"\",")
                    .append("\""+userBean.getLevel()+"\",")
                    .append("\""+userBean.getDepartment()+"\"")
                    .append("],");
        }
        if(sb.length()>1){
            sb.deleteCharAt(sb.lastIndexOf(","));
        }
        sb.append("]");
        out.println(sb);
        out.flush();
        out.close();
        return null;
    }
}
