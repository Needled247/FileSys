package com.gjjt.action;

import com.gjjt.pojo.gj_file_plant;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

/**
 * User: HP
 * Date: 13-9-12
 * Time: 下午3:44
 * 生成拟办意见
 */
public class GenerateReceiptAction extends ActionSupport {
    private String swname1;
    private String swname2;
    private String swname3;
    private String swname4;
    private String hsw1;
    private String hsw2;
    private String hsw3;
    private String hsw4;

    public String getSwname1() {
        return swname1;
    }

    public void setSwname1(String swname1) {
        this.swname1 = swname1;
    }

    public String getSwname2() {
        return swname2;
    }

    public void setSwname2(String swname2) {
        this.swname2 = swname2;
    }

    public String getSwname3() {
        return swname3;
    }

    public void setSwname3(String swname3) {
        this.swname3 = swname3;
    }

    public String getSwname4() {
        return swname4;
    }

    public void setSwname4(String swname4) {
        this.swname4 = swname4;
    }

    public String getHsw1() {
        return hsw1;
    }

    public void setHsw1(String hsw1) {
        this.hsw1 = hsw1;
    }

    public String getHsw2() {
        return hsw2;
    }

    public void setHsw2(String hsw2) {
        this.hsw2 = hsw2;
    }

    public String getHsw3() {
        return hsw3;
    }

    public void setHsw3(String hsw3) {
        this.hsw3 = hsw3;
    }

    public String getHsw4() {
        return hsw4;
    }

    public void setHsw4(String hsw4) {
        this.hsw4 = hsw4;
    }

    @Override
    public String execute() throws Exception {
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html;charset=GBK");
        PrintWriter out = response.getWriter();
        StringBuilder sb = new StringBuilder();
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-config.xml");
        gj_file_plant bean = ctx.getBean("gj_file_plant",gj_file_plant.class);
        sb.append("     请厂领导参阅。");
        if(!hsw1.equals("")||!swname1.equals("")){
            sb.append("将收文1发至"+bean.getInfoByFileName(hsw1,swname1)+"。");
        }
        if(!hsw2.equals("")||!swname2.equals("")){
            sb.append("将收文2发至"+bean.getInfoByFileName(hsw2,swname2)+"。") ;
        }
        if(!hsw3.equals("")||!swname3.equals("")){
            sb.append("将收文3发至"+bean.getInfoByFileName(hsw3,swname3)+"。");
        }
        if (!hsw4.equals("")||!swname4.equals("")){
            sb.append("将收文4发至"+bean.getInfoByFileName(hsw4,swname4)+"。");
        }
        out.print(sb);
        out.flush();
        out.close();
        return null;
    }
}
