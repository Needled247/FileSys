package com.gjjt.action;

import com.gjjt.pojo.gj_file_plant;
import com.gjjt.pojo.gj_send_info;
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
 * Time: 上午12:53
 * To change this template use File | Settings | File Templates.
 */
public class SituationInitAction extends ActionSupport{
    ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-config.xml");
    gj_file_plant plant = ctx.getBean("gj_file_plant",gj_file_plant.class);
    gj_send_info info = ctx.getBean("gj_send_info",gj_send_info.class);
    @Override
    public String execute() throws Exception {
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/json;charset=GBK");
        FileSysTool tool = new FileSysTool();
        PrintWriter out = response.getWriter();
        List li = new ArrayList();
        li = plant.getReleasedFile();
        Iterator it = li.iterator();
        gj_file_plant bean = new gj_file_plant();
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        while (it.hasNext()){
            bean = (gj_file_plant)it.next();
            sb.append("[")
                    .append("\"" + bean.getID() + "\",")
                    .append("\"" + bean.getSENDTIME() + "\",")
                    .append("\"" + bean.getXNUM1()+bean.getXNUM2() + "\",")
                    .append("\"" + bean.getCADDRESS() + "\",")
                    .append("\"" + bean.getFILENAME() + "\",")
                    .append("\""+tool.tbl2department(bean.getTBL())+"\",")
                    .append("\""+this.getSituation(bean.getID(),bean.getTBL(),bean.getCOPYRANGE())+"\"")
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

    public String getSituation(int id,String tbl,String array){
        String status = "";
        //已阅
        String read = info.executeSituation(id,tbl,"1");
        String[] copyArr = array.split(",");
        if(Integer.parseInt(read)<copyArr.length){
            status = "未传阅完毕";
        }
        else if(Integer.parseInt(read)==copyArr.length){
            status = "传阅完毕";
        }
        return status;
    }
}
