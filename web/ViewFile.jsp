<%@page language="java" pageEncoding="GBK" %>
<%@include file="Validate.jsp"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<s:action name="getPrefixAction" id="getPrefixAction" namespace="/"/>
<%@ page import="com.gjjt.dao.FileSysDAOImpl" %>
<%@ page import="com.gjjt.pojo.gj_file_plant" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
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
            String pid = request.getParameter("pid");
            String add = request.getParameter("add");
            List li = new ArrayList();
            FileSysDAOImpl impl = new FileSysDAOImpl();
            li = impl.SearchFileInfoById(pid,add);
            Iterator it = li.iterator();
            gj_file_plant bean = null;
            while(it.hasNext()){
                bean = (gj_file_plant)it.next();
            }
        %>
        <div id="content" class="span10">
            <!-- 主容器部分 -->
            <div>
                <ul class="breadcrumb">
                    <li>
                        <a href="#">发文管理</a> <span class="divider">/</span>
                    </li>
                    <li>
                        <a href="#">查看/编辑文件</a>
                    </li>
                </ul>
            </div>
            <div class="row-fluid sortable ui-sortable">
                <div class="box span12" style="">
                    <div class="box-header well" data-original-title="">
                        <h2><i class="icon-edit"></i>文件详细信息</h2>
                    </div>
                    <div class="box-content">
                            <fieldset>
                                <legend><%=add%>文件</legend>
                                <div id="table">
                                    <table class="table table-bordered table-striped" style="width: 50%">
                                        <thead>
                                            <tr>
                                                <td style="width: 30%"><h4>名称</h4></td>
                                                <td style="width: 50%"></td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>收文日期</td>
                                                <td><%=bean.getSENDTIME()%></td>
                                            </tr>
                                            <tr>
                                                <td>行政文号</td>
                                                <td><%=bean.getXNUM1()+bean.getXNUM2()%></td>
                                            </tr>
                                            <tr>
                                                <td>体系文号</td>
                                                <td><%=bean.getTNUM1()+bean.getTNUM2()+bean.getTNUM3()%></td>
                                            </tr>
                                            <tr>
                                                <td>来文单位</td>
                                                <td><%=bean.getCADDRESS()%></td>
                                            </tr>
                                            <tr>
                                                <td>件数</td>
                                                <td><%=bean.getQUANTITY()%></td>
                                            </tr>
                                            <tr>
                                                <td>红头件数</td>
                                                <td><%=bean.getRHQUANTITY()%></td>
                                            </tr>
                                            <tr>
                                                <td>文件名称</td>
                                                <td><%=bean.getFILENAME()%></td>
                                            </tr>
                                            <tr>
                                                <td>附件名称</td>
                                                <td><%=bean.getFUNAME()%></td>
                                            </tr>
                                            <tr>
                                                <td>文件类型</td>
                                                <td><%=bean.getFILETYPE()%></td>
                                            </tr>
                                            <tr>
                                                <td>收文号</td>
                                                <td><%=bean.getSNUM()%></td>
                                            </tr>
                                            <tr>
                                                <td>发文范围（复印）</td>
                                                <td><%=bean.getCOPYRANGE()%></td>
                                            </tr>
                                            <tr>
                                                <td>发放范围（红头）</td>
                                                <td><%=bean.getGRANTRANGE()%></td>
                                            </tr>
                                            <tr>
                                                <td>来文类型</td>
                                                <td><%=bean.getCFILETYPE()%></td>
                                            </tr>
                                            <tr>
                                                <td>发文份数</td>
                                                <td><%=bean.getCOPYQUANTITY()%></td>
                                            </tr>
                                            <tr>
                                                <td>是否作废</td>
                                                <td><%=bean.getISINVALID()%></td>
                                            </tr>
                                            <tr>
                                                <td>回收件数</td>
                                                <td><%=bean.getRECQUANTITY()%></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <input type="hidden" value="<%=pid%>" id="pid">
                                    <input type="hidden" value="<%=add%>" id="add">
                                </div>
                                <div class="form-actions">
                                    <button type="button" class="btn btn-success" onclick="editFile()" id="btn_save">
                                        <i class="icon-ok icon-white"></i>编辑</button>
                                    <button type="button" class="btn btn-warning" onclick="editFile()" id="btn_print">
                                        <i class="icon-print icon-white"></i>打印</button>
                                    <button type="reset" class="btn btn-primary" id="btn_back">
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
<!--验证-->
<script src="js/fileSys/EditFile.js"></script>
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
