package com.gjjt.action;

import com.gjjt.pojo.file_type;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

/**
 * Created with IntelliJ IDEA.
 * User: HP
 * Date: 14-1-13
 */
public class SnumAction extends ActionSupport{
    private String fileType;

    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }

    @Override
    public String execute() throws Exception {
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html;charset=GBK");
        PrintWriter out = response.getWriter();
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-config.xml");
        file_type bean = ctx.getBean("file_type",file_type.class);
        out.print(bean.getSnumLatest(fileType));
        out.flush();
        out.close();
        return null;
    }
}
