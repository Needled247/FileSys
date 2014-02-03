<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="java.net.*" %>
<%@ page import="java.sql.*" %>

<html>
  <head>
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body bgcolor='#FFCCAA'>
  		<table>
  			<tr>
	  	<%
	     	String ip = request.getHeader("x-forwarded-for");
	     	if(ip == null || ip.length() == 0 || "unknow".equalsIgnoreCase(ip))
	     	{
	     		ip = request.getHeader("Proxy-Client-IP");
	     	}
	     	if(ip == null || ip.length() == 0 || "unknow".equalsIgnoreCase(ip))
	     	{
	     		ip = request.getHeader("WL-Proxy-Client-IP");
	     	}
	     	if(ip == null || ip.length() == 0 || "unknow".equalsIgnoreCase(ip))
	     	{
	     		ip = request.getRemoteAddr();
	     	}
	     %>
	     <!--
	   <td>
	  		<h5>您的IP地址是: <%=ip %></h5>
	  	</td>
	  	-->
	  	<%
	  		Connection conn = null;
	  		PreparedStatement pstmt = null;
	  		PreparedStatement pstmt2 = null;
	  		ResultSet rs = null;
	  		ResultSet rs2 = null;
	  		String username = null;
	  		String subUser = null;
	  		String star = "*";
	  		String newUsername = null;
	  		final String DB_DRIVER = "oracle.jdbc.driver.OracleDriver";
	  		final String DB_USER = "mydradius";
	  		final String DB_PASS = "mydradius";
	  		final String DB_URL = "jdbc:oracle:thin:@10.0.1.129:1521:radius";
	  		try
	  		{
	  			Class.forName(DB_DRIVER).newInstance();
	  			conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASS);
	  			pstmt = conn.prepareStatement("select SUSERNAME from TBL_ONLINERECORD where pkg_util.iip_to_cip(IFRAMEDIP)='"+ip+"'");
	  			rs = pstmt.executeQuery();
	  			if(rs.next())
	  			{
	  				username = rs.getString("SUSERNAME");
	  				subUser = username.substring(2,username.length()-2);
	  				for(int i=0;i<subUser.length()-1;i++)
	  				{
	  					star += "*";
	  				}
	  				newUsername = username.replaceAll(subUser,star);
	  			%>
	  		  <td>
	  				<h3>欢迎用户:<%=newUsername%></h3>
	  			</td>
	  			<%
	  				pstmt2 = conn.prepareStatement("select DOVERDATE from TBL_USERS where SUSERNAME='"+rs.getString("SUSERNAME")+"'");
	  				rs2 = pstmt2.executeQuery();
	  				if(rs2.next())
	  				{
	  					%>
	  				<td>
	  					<h3>您的服务到期时间为：<%=rs2.getDate("DOVERDATE")%></h3>
	  				</td>
	  					<%
	  				}
	  			}
	  		}
	  		catch(SQLException e)
	  		{
	  			e.printStackTrace();
	  			conn.close();
	  		}
	  		finally
	  		{
	  			if(rs!=null)
	  			{
	  				try
	  				{
	  					rs.close();
	  				}
	  				catch(SQLException er)
	  				{
	  					er.printStackTrace();
	  				}
	  			}
	  			if(rs2 != null)
	  			{
	  				try
	  				{
	  					rs2.close();
	  				}
	  				catch(SQLException er)
	  				{
	  					er.printStackTrace();
	  				}
	  			}
	  			if(pstmt != null)
	  			{
	  				try
	  				{
	  					pstmt.close();
	  				}
	  				catch(SQLException er)
	  				{
	  					er.printStackTrace();
	  				}
	  			}
	  			if(pstmt2 != null)
	  			{
	  				try
	  				{
	  					pstmt2.close();
	  				}
	  				catch(SQLException er)
	  				{
	  					er.printStackTrace();
	  				}
	  			}
	  			
	  			if(conn != null)
	  			{
	  				try
	  				{
	  					conn.close();
	  				}
	  				catch(SQLException er)
	  				{
							er.printStackTrace();	  				
	  				}
	  			}
	  		}
	  	%>
	  </tr>
     </table>
  </body>
</html>
