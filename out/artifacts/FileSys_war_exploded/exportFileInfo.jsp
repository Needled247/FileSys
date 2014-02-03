<%@ page contentType="application/vnd.ms-excel" language="java" pageEncoding="GBK"%>
<%@ page import="com.gjjt.tool.FileSysTool"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%
    Date d = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String datestr = sdf.format(d);
    response.setHeader("Content-Disposition","attachment;filename="+datestr+".xls");//指定下载的文件名
    response.setContentType("application/vnd.ms-excel");
    List li = (List)session.getAttribute("dept_time_file");
    FileSysTool tool = new FileSysTool();
    tool.getExcel("download.xls",response.getOutputStream(),li);
    session.removeAttribute("dept_time_file");
%>