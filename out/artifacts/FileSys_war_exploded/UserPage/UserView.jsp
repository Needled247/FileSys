<%@ page import="com.gjjt.pojo.gj_file_plant" %>
<%@include file="UserValidate.jsp"%>
<%@ page import="com.gjjt.pojo.gj_send_info" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@page language="java" pageEncoding="GBK" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="GBK">
    <title>�ļ��İ����ϵͳ</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- ��ʽ�� -->
    <link id="bs-css" href="../css/bootstrap-cerulean.css" rel="stylesheet">
    <style type="text/css">
        body {padding-bottom: 40px;}
        .sidebar-nav {padding: 9px 0;}
    </style>
    <link href="../css/bootstrap-responsive.css" rel="stylesheet">
    <link href="../css/charisma-app.css" rel="stylesheet">
    <link href="../css/jquery-ui-1.8.21.custom.css" rel="stylesheet">
    <link href='../css/fullcalendar.css' rel='stylesheet'>
    <link href='../css/fullcalendar.print.css' rel='stylesheet'  media='print'>
    <link href='../css/chosen.css' rel='stylesheet'>
    <link href='../css/uniform.default.css' rel='stylesheet'>
    <link href='../css/colorbox.css' rel='stylesheet'>
    <link href='../css/jquery.cleditor.css' rel='stylesheet'>
    <link href='../css/jquery.noty.css' rel='stylesheet'>
    <link href='../css/noty_theme_default.css' rel='stylesheet'>
    <link href='../css/elfinder.min.css' rel='stylesheet'>
    <link href='../css/elfinder.theme.css' rel='stylesheet'>
    <link href='../css/jquery.iphone.toggle.css' rel='stylesheet'>
    <link href='../css/opa-icons.css' rel='stylesheet'>
    <link href='../css/uploadify.css' rel='stylesheet'>
    <!-- HTML5����IE -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <!-- The fav icon -->
    <link rel="shortcut icon" href="../img/favicon.ico">
</head>

<body>
<!-- ������ʾ -->
<%@include file="UserHead.jsp"%>
<div class="container-fluid">
    <div class="row-fluid">
        <!--���˵�-->
        <%@include file="userMenu.jsp"%>
        <div id="content" class="span10">
            <!-- ���������� -->
            <div>
                <ul class="breadcrumb">
                    <li>
                        <a href="#">���Ĺ���</a> <span class="divider">/</span>
                    </li>
                    <li>
                        <a href="#">�鿴��ϸ</a>
                    </li>
                </ul>
            </div>
            <%
                String id = request.getParameter("id");
                String tbl = request.getParameter("tbl");
                ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-config.xml");
                gj_file_plant plant = ctx.getBean("gj_file_plant",gj_file_plant.class);
                gj_send_info sinfo = ctx.getBean("gj_send_info",gj_send_info.class);
                List li = new ArrayList();
                li = plant.SearchFileInfoById(id, tbl);
                gj_file_plant bean = null;
                Iterator it = li.iterator();
                while (it.hasNext()){
                    bean = (gj_file_plant)it.next();
                }
                session.setAttribute("attr",bean.getATTURL());
                if(!sinfo.updateSendInfoById(Integer.parseInt(id),uname.toString(),department.toString())){
                    System.out.println("���Ϊ�Ѷ�ʧ��...");
                }
            %>
        </div>

        <div class="box span10">
            <div class="box-header well" data-original-title="">
                <h2><i class="icon-plus"></i> ������ϸ��Ϣ</h2>
            </div>
            <div class="box-content">
                <table class="table table-bordered table-striped">
                    <tbody>
                    <tr>
                        <td><h3>�������ڣ�</h3></td>
                        <td><%=bean.getSENDTIME()%></td>
                        <td><h3>�����ĺţ�</h3></td>
                        <td><%=bean.getXNUM1()+bean.getXNUM2()%></td>
                    </tr>
                    <tr>
                        <td><h3>��ϵ�ĺţ�</h3></td>
                        <td><%=bean.getTNUM1()+bean.getTNUM2()+bean.getTNUM3()%></td>
                        <td><h3>���ĵ�λ��</h3></td>
                        <td><%=bean.getCADDRESS()%></td>
                    </tr>
                    <tr>
                        <td><h3>������</h3></td>
                        <td><%=bean.getQUANTITY()%>��</td>
                        <td><h3>��ͷ������</h3></td>
                        <td><%=bean.getRHQUANTITY()%>��</td>
                    </tr>
                    <tr>
                        <td><h3>�ļ����ͣ�</h3></td>
                        <td><%=bean.getFILETYPE()%></td>
                        <td><h3>���ĺţ�</h3></td>
                        <td><%=bean.getSNUM()%></td>
                    </tr>
                    <tr>
                        <td><h3>�������ͣ�</h3></td>
                        <td><%=bean.getCFILETYPE()%></td>
                        <td><h3>������</h3></td>
                        <%
                            if(bean.getATTURL()==null){
                        %>
                        <td>û�и���</td>
                        <%
                            }else {
                        %>
                        <td><a href='download.jsp' target="_blank"><%=bean.getFUNAME()%></a></td>
                        <%
                            }
                        %>
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align: center">
                            <button class="btn btn-large btn-info" onclick="window.location.href='index.jsp'">����</button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
    <hr>


    <!--ҳ��ײ�-->
    <footer>
        <p class="pull-left">&copy; <a href="#" target="_blank">BeiJing Bus.</a> 2013</p>
    </footer>
</div>
<!-- JS�ļ�
================================================== -->
<!-- jQuery -->
<script src="../js/jquery-1.7.2.min.js"></script>
<!-- jQuery UI -->
<script src="../js/jquery-ui-1.8.21.custom.min.js"></script>
<!-- transition / effect library -->
<script src="../js/bootstrap-transition.js"></script>
<!-- alert enhancer library -->
<script src="../js/bootstrap-alert.js"></script>
<!-- modal / dialog library -->
<script src="../js/bootstrap-modal.js"></script>
<!-- custom dropdown library -->
<script src="../js/bootstrap-dropdown.js"></script>
<!-- scrolspy library -->
<script src="../js/bootstrap-scrollspy.js"></script>
<!-- library for creating tabs -->
<script src="../js/date_zhcn.js"></script>
<script src="../js/bootstrap-tab.js"></script>
<!-- library for advanced tooltip -->
<script src="../js/bootstrap-tooltip.js"></script>
<!-- popover effect library -->
<script src="../js/bootstrap-popover.js"></script>
<!-- button enhancer library -->
<script src="../js/bootstrap-button.js"></script>
<!-- accordion library (optional, not used in demo) -->
<script src="../js/bootstrap-collapse.js"></script>
<!-- carousel slideshow library (optional, not used in demo) -->
<script src="../js/bootstrap-carousel.js"></script>
<!-- autocomplete library -->
<script src="../js/bootstrap-typeahead.js"></script>
<!-- tour library -->
<script src="../js/bootstrap-tour.js"></script>
<!-- library for cookie management -->
<script src="../js/jquery.cookie.js"></script>
<!-- calander plugin -->
<script src='../js/fullcalendar.min.js'></script>
<!-- data table plugin -->
<script src='../js/jquery.dataTables.min.js'></script>

<!-- select or dropdown enhancer -->
<script src="js/jquery.chosen.min.js"></script>
<!-- checkbox, radio, and file input styler -->
<script src="js/jquery.uniform.min.js"></script>
<!-- plugin for gallery image view -->
<script src="js/jquery.colorbox.min.js"></script>
<!-- rich text editor library -->
<script src="js/jquery.cleditor.min.js"></script>
<!-- notification plugin -->
<script src="js/jquery.noty.js"></script>
<!-- file manager library -->
<script src="js/jquery.elfinder.min.js"></script>
<!-- star rating plugin -->
<script src="js/jquery.raty.min.js"></script>
<!-- for iOS style toggle switch -->
<script src="js/jquery.iphone.toggle.js"></script>
<!-- autogrowing textarea plugin -->
<script src="js/jquery.autogrow-textarea.js"></script>
<!-- multiple file upload plugin -->
<script src="js/jquery.uploadify-3.1.min.js"></script>
<!-- history.js for cross-browser state change on ajax -->
<script src="js/jquery.history.js"></script>
<!-- application script for Charisma demo -->
<script src="js/charisma.js"></script>
</body>
</html>
