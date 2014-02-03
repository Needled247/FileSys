package com.gjjt.action;

import com.gjjt.pojo.gj_file_plant;
import com.gjjt.tool.FileSysTool;
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
 * Date: 13-7-27
 * Time: ÉÏÎç12:53
 * To change this template use File | Settings | File Templates.
 */
public class AllFileAction extends ActionSupport{
    @Override
    public String execute() throws Exception {
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/json;charset=GBK");
        FileSysTool tool = new FileSysTool();
        PrintWriter out = response.getWriter();
        List li = new ArrayList();
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-config.xml");
        gj_file_plant plant = ctx.getBean("gj_file_plant",gj_file_plant.class);
        li = plant.getAllFile();
        Iterator it = li.iterator();
        gj_file_plant bean = new gj_file_plant();
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        while (it.hasNext()){
            bean = (gj_file_plant)it.next();
            sb.append("[")
                    .append("\"" + bean.getXNUM1()+bean.getXNUM2() + "\",")
                    .append("\"" + bean.getTNUM1()+bean.getTNUM2()+bean.getTNUM3() + "\",")
                    .append("\"" + bean.getCADDRESS() + "\",")
                    .append("\"" + bean.getQUANTITY() + "\",")
                    .append("\"" + bean.getRHQUANTITY() + "\",")
                    .append("\"" + bean.getFILENAME() + "\",")
                    .append("\"" + bean.getFUNAME() + "\",")
                    .append("\"" + bean.getFILETYPE() + "\",")
                    .append("\"" + bean.getSNUM() + "\",")
                    .append("\"" + bean.getCOPYRANGE() + "\",")
                    .append("\"" + bean.getGRANTRANGE() + "\",")
                    .append("\"" + bean.getCFILETYPE() + "\",")
                    .append("\"" + bean.getSENDTIME() + "\",")
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
        return null;
    }
}
