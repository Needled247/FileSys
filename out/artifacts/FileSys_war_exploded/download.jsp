<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.OutputStream" %>
<%
    String filename = request.getParameter("filename");
    response.setContentType("text/plain");
    response.setHeader("Location",filename);
    response.setHeader("Content-Disposition", "attachment; filename=" + filename); //filename应该是编码后的(utf-8)
    OutputStream outputStream = response.getOutputStream();
    String path=application.getRealPath(request.getRequestURI());
    String dir=new File(path).getParent();
    dir += "\\module\\";
    InputStream inputStream = new FileInputStream(dir+filename);
    byte[] buffer = new byte[1024];
    int i = -1;
    while ((i = inputStream.read(buffer)) != -1) {
        outputStream.write(buffer, 0, i);
    }
    outputStream.flush();
    outputStream.close();
    inputStream.close();
    outputStream = null;
%> 