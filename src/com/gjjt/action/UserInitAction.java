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
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: HP
 * Date: 13-7-27
 * Time: ÉÏÎç12:53
 * To change this template use File | Settings | File Templates.
 */
public class UserInitAction extends ActionSupport{
    @Override
    public String execute() throws Exception {
        HttpServletResponse response = ServletActionContext.getResponse();
        HttpServletRequest request = ServletActionContext.getRequest();
        String department = request.getSession().getAttribute("department").toString();
        String uname = request.getSession().getAttribute("uname").toString();
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-config.xml");
        gj_send_info info = ctx.getBean("gj_send_info",gj_send_info.class);
        gj_file_plant plant = ctx.getBean("gj_file_plant",gj_file_plant.class);
        response.setContentType("text/json;charset=GBK");
        FileSysTool tool = new FileSysTool();
        PrintWriter out = response.getWriter();
        List li = new ArrayList();
        li = info.getInfoByDepartment(department);
        Iterator it = li.iterator();
        gj_send_info bean = new gj_send_info();
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        while (it.hasNext()){
            bean = (gj_send_info)it.next();
            List detailList = new ArrayList();
            detailList = plant.getFileById(bean.getSENDID(),bean.getTBL());
            Iterator detailIterator = detailList.iterator();
            gj_file_plant view = null;
            while (detailIterator.hasNext()){
                view = (gj_file_plant)detailIterator.next();
                sb.append("[")
                        .append("\"" + view.getID() + "\",")
                        .append("\"" + view.getSENDTIME() + "\",")
                        .append("\"" + view.getXNUM1()+view.getXNUM2() + "\",")
                        .append("\"" + view.getCADDRESS() + "\",")
                        .append("\"" + view.getFILENAME() + "\",")
                        .append("\""+tool.tbl2department(view.getTBL())+"\",")
                        .append("\""+tool.statusChange(bean.getISCHECK())+"\"")
                        .append("],");
            }
        }
        if(sb.length()>1){
            sb.deleteCharAt(sb.lastIndexOf(","));
        }
        sb.append("]");
        out.print(sb);
        out.flush();
        out.close();
        return null;
    }
}
