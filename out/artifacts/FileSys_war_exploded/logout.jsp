<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.removeAttribute("uid");
    session.removeAttribute("lid");
    session.removeAttribute("uname");
    session.removeAttribute("department");
    response.sendRedirect("login.jsp");
%>