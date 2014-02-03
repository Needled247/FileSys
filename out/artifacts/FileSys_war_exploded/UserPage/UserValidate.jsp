<%@ page contentType="text/html;charset=GBK" language="java" %>
<%
    Object uid = session.getAttribute("uid");
    Object lid = session.getAttribute("lid");
    Object uname = session.getAttribute("uname");
    Object department = session.getAttribute("department");
    if(uid==null){
        response.sendRedirect("../login.jsp");
        return;
    }
    if(lid==null){
        response.sendRedirect("../login.jsp");
        return;
    }
    if(uname==null){
        response.sendRedirect("../login.jsp");
        return;
    }
    if(department==null){
        response.sendRedirect("../login.jsp");
        return;
    }
    if(!lid.toString().equals("2")){
        response.sendRedirect("../login.jsp");
        return;
    }
%>