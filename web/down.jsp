<%@page language="java" contentType="application/x-msdownload"
        pageEncoding="GBK"%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%@ page language="java" import="java.io.*"%>
<%@ page language="java" import="java.net.URLEncoder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>下载文件</title>
    </head>
    <body>
        <%
            String docname = request.getParameter("attr");
            String filedisplay = docname.substring(docname.lastIndexOf("\\")+1,docname.length());
            response.reset();
            response.setContentType("application/x-download");
            String paths = pageContext.getServletContext().getRealPath("/");
            String realPath = paths + "/upload/";
            String filedownload = docname;
            response.addHeader("Content-Disposition", "attachment;filename=" + new String(filedisplay.getBytes("GBK"),"ISO-8859-1"));
            //此处记得清理下。在释放在jsp中使用的对象时，会调用response.getWriter(),因为这个方法是和response.getOutputStream()相冲突的！
            out.clear();
            out = pageContext.pushBody();

            OutputStream outp = null;
            FileInputStream in = null;
            try
            {
                outp = response.getOutputStream();
                in = new FileInputStream(filedownload);

                byte[] b = new byte[1024];
                int i = 0;

                while ((i = in.read(b)) > 0)
                {
                    outp.write(b, 0, i);
                }
                outp.flush();
            }
            catch (Exception e)
            {
                System.out.println("Download Error!");
                e.printStackTrace();
            }
            finally
            {
                if (in != null)
                {
                    in.close();
                    in = null;
                }
                if (outp != null)
                {
                    outp.close();
                    outp = null;
                }
                session.removeAttribute("attr");
            }
        %>
    </body>
</html>