<%@page language="java" pageEncoding="GBK" %>
<%@include file="Validate.jsp"%>
<%@ page import="com.gjjt.dao.FileSysDAOImpl" %>
<%@ page import="com.gjjt.pojo.caddress" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="GBK">
    <title>文件阅办管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 样式表 -->
    <link id="bs-css" href="css/bootstrap-cerulean.css" rel="stylesheet">
    <style type="text/css">
        body {padding-bottom: 40px;}
        .sidebar-nav {padding: 9px 0;}
    </style>
    <link href="css/bootstrap-responsive.css" rel="stylesheet">
    <link href="css/charisma-app.css" rel="stylesheet">
    <link href="css/jquery-ui-1.8.21.custom.css" rel="stylesheet">
    <link href='css/fullcalendar.css' rel='stylesheet'>
    <link href='css/fullcalendar.print.css' rel='stylesheet'  media='print'>
    <link href='css/chosen.css' rel='stylesheet'>
    <link href='css/uniform.default.css' rel='stylesheet'>
    <link href='css/colorbox.css' rel='stylesheet'>
    <link href='css/jquery.cleditor.css' rel='stylesheet'>
    <link href='css/jquery.noty.css' rel='stylesheet'>
    <link href='css/noty_theme_default.css' rel='stylesheet'>
    <link href='css/elfinder.min.css' rel='stylesheet'>
    <link href='css/elfinder.theme.css' rel='stylesheet'>
    <link href='css/jquery.iphone.toggle.css' rel='stylesheet'>
    <link href='css/opa-icons.css' rel='stylesheet'>
    <link href='css/uploadify.css' rel='stylesheet'>
    <!-- HTML5兼容IE -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <!-- The fav icon -->
    <link rel="shortcut icon" href="img/favicon.ico">
</head>
<body>
<!-- 顶部显示 -->
<%@include file="head.jsp"%>
<div class="container-fluid">
    <div class="row-fluid">
        <!--左侧菜单-->
        <%@include file="menu.jsp"%>
        <%
            String pid = request.getParameter("id");
            String add = request.getParameter("add");
            List li = new ArrayList();
            ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-config.xml");
            caddress c = ctx.getBean("caddress",caddress.class);
            li = c.getFieldById(Integer.parseInt(pid),add);
            Iterator it = li.iterator();
            caddress bean = null;
            while(it.hasNext()){
                bean = (caddress)it.next();
            }
        %>
        <div id="content" class="span10">
            <!-- 主容器部分 -->
            <div>
                <ul class="breadcrumb">
                    <li>
                        <a href="#">系统</a> <span class="divider">/</span>
                    </li>
                    <li>
                        <a href="Setting.jsp">设置字段</a>  <span class="divider">/</span>
                    </li>
                    <li>
                        <a href="#">修改字段</a>
                    </li>
                </ul>
            </div>
            <div class="row-fluid sortable ui-sortable">
                <div class="box span12" style="">
                    <div class="box-header well" data-original-title="">
                        <h2><i class="icon-edit"></i>编辑</h2>
                    </div>
                    <div class="box-content">
                            <fieldset>
                                <legend>修改字段</legend>
                                <input type="hidden" value="<%=add%>" id="add">
                                <input type="hidden" value="<%=pid%>" id="pid">
                                <div class="control-group">
                                    <label class="control-label" for="id">ID：</label>
                                    <div class="controls">
                                        <input class="input-xlarge focused" disabled style="width: 15%" id="id" type="text" value="<%=bean.getID()%>">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="key">字段：</label>
                                    <div class="controls">
                                        <input class="input-xlarge focused" style="width: 15%" id="key" type="text" value="<%=bean.getKEY()%>">
                                        <span class="help-inline red" id="keyErr"></span>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="value">字段缩写：</label>
                                    <div class="controls">
                                        <input class="input-xlarge focused" style="width: 15%" id="value" type="text" value="<%=bean.getVALUE()%>">
                                        <span class="help-inline red" id="valueErr"></span>
                                    </div>
                                </div>
                                <div class="form-actions">
                                    <button type="button" class="btn btn-success" onclick="editField()" id="btn_save">
                                        <i class="icon-ok icon-white"></i>保存</button>
                                    <button type="button" class="btn btn-danger" onclick="delField()" id="btn_del">
                                        <i class="icon-print icon-white"></i>删除</button>
                                    <button type="reset" class="btn btn-primary" id="btn_back" onclick="window.location.href='Setting.jsp'">
                                        <i class="icon-chevron-left icon-white"></i>返回</button>
                                </div>
                            </fieldset>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <hr>
    <!--页面底部-->
    <footer>
        <p class="pull-left">&copy; <a href="#" target="_blank">BeiJing Bus.</a> 2013</p>
    </footer>
</div>
<!-- JS文件
================================================== -->
<!-- jQuery -->
<script src="js/jquery-1.7.2.min.js"></script>
<!-- jQuery UI -->
<script src="js/jquery-ui-1.8.21.custom.min.js"></script>
<!--ajaxxxxxxxxxxxxxxxxxxxxxxxxxxxx-->
<script src="js/fileSys/EditField.js"></script>
<!-- transition / effect library -->
<script src="js/bootstrap-transition.js"></script>
<!-- alert enhancer library -->
<script src="js/bootstrap-alert.js"></script>
<!-- modal / dialog library -->
<script src="js/bootstrap-modal.js"></script>
<!-- custom dropdown library -->
<script src="js/bootstrap-dropdown.js"></script>
<!-- scrolspy library -->
<script src="js/bootstrap-scrollspy.js"></script>
<!-- library for creating tabs -->
<script src="js/date_zhcn.js"></script>
<script src="js/bootstrap-tab.js"></script>
<!-- library for advanced tooltip -->
<script src="js/bootstrap-tooltip.js"></script>
<!-- popover effect library -->
<script src="js/bootstrap-popover.js"></script>
<!-- button enhancer library -->
<script src="js/bootstrap-button.js"></script>
<!-- accordion library (optional, not used in demo) -->
<script src="js/bootstrap-collapse.js"></script>
<!-- carousel slideshow library (optional, not used in demo) -->
<script src="js/bootstrap-carousel.js"></script>
<!-- autocomplete library -->
<script src="js/bootstrap-typeahead.js"></script>
<!-- library for cookie management -->
<script src="js/jquery.cookie.js"></script>
<!-- calander plugin -->
<script src='js/fullcalendar.min.js'></script>
<!-- select or dropdown enhancer -->
<script src="js/jquery.chosen.min.js"></script>
<!-- checkbox, radio, and file input styler -->
<script src="js/jquery.uniform.min.js"></script>
<!-- plugin for gallery image view -->
<script src="js/jquery.colorbox.min.js"></script>
<!-- rich text editor library -->
<script src="js/jquery.cleditor.min.js"></script>
<!--data tables-->
<script src="js/jquery.dataTables.min.js"></script>
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
