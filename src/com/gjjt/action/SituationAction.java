package com.gjjt.action;

import com.gjjt.pojo.gj_file_plant;
import com.gjjt.tool.FileSysTool;
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
 * Date: 13-10-21
 * Time: 上午1:11
 * 状态查询Action
 */
public class SituationAction extends ActionSupport {
    private String situation;
    private String type;
    HttpServletResponse response = ServletActionContext.getResponse();
    FileSysTool tool = new FileSysTool();
    ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-config.xml");
    gj_file_plant bean = ctx.getBean("gj_file_plant",gj_file_plant.class);

    public String getSituation() {
        return situation;
    }

    public void setSituation(String situation) {
        this.situation = situation;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String execute() throws Exception {
        if(type.equals("grant")){
            this.executeSituation();
        }
        if (type.equals("read")){
        //?
        }
        return null;
    }

    /**
     * 分发情况查询
     * @throws IOException
     */
    public void executeSituation() throws IOException {
        response.setContentType("text/json;charset=GBK");
        PrintWriter out = response.getWriter();
        StringBuilder sb = new StringBuilder();
        List li = new ArrayList();
        li = bean.getFileInfoByStatus(situation);
        Iterator iterator = li.iterator();
        gj_file_plant bean = null;
        sb.append("[");
        while (iterator.hasNext()){
            bean = (gj_file_plant)iterator.next();
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
    }
}
