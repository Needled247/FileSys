<%@page language="java" pageEncoding="GBK" %>
<%@include file="EntryValidate.jsp"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<s:action name="getPrefixAction" id="getPrefixAction" namespace="/"/>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="GBK">
    <title>文件阅办管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 样式表 -->
    <link href="../css/bootstrap-cerulean.css" rel="stylesheet">
    <style type="text/css">
        body {padding-bottom: 40px;}
        .sidebar-nav {padding: 9px 0;}
        .adv{height: 100px;}
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
    <!-- HTML5兼容IE -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <!-- The fav icon -->
    <link rel="shortcut icon" href="../img/favicon.ico">
</head>

<body>
<!-- 顶部显示 -->
<%@include file="EntryHead.jsp"%>
<div class="container-fluid">
    <div class="row-fluid">
        <!--左侧菜单-->
        <%@include file="EntryMenu.jsp"%>
        <div id="content" class="span10">
            <!-- 主容器部分 -->
            <div>
                <ul class="breadcrumb">
                    <li>
                        <a href="#">发文管理</a> <span class="divider">/</span>
                    </li>
                    <li>
                        <a href="#">添加新用户</a>
                    </li>
                </ul>
            </div>

            <div class="row-fluid sortable ui-sortable">
                <div class="box span12">
                    <div class="box-header well" data-original-title="">
                        <h2><i class="icon-edit"></i>添加新用户</h2>
                    </div>
                    <div class="box-content">
                        <form class="form-horizontal">
                        <fieldset>
                            <legend>请填写数据</legend>
                            <div class="control-group">
                                <label class="control-label" for="username">用户名称：</label>
                                <div class="controls">
                                    <input class="input-xlarge focused" style="width: 20%" id="username" type="text" >
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="userid">用户账号：</label>
                                <div class="controls">
                                    <input class="input-xlarge focused" style="width: 20%" id="userid" name="sendTime" type="text">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="apartment">部门：</label>
                                <div class="controls">
                                    <s:select list="#getPrefixAction.copyRangeMap" name="copyrange"  data-rel="chosen" id="apartment"  headerKey="-1" listkey="key" listvalue="value" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="level">级别：</label>
                                <div class="controls">
                                    <select id="level">
                                        <option value="0" selected>---请选择---</option>
                                        <option value="2">普通用户</option>
                                        <option value="3">前台人员</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-actions">
                                <button type="button" class="btn btn-warning" onclick="addUser()"  id="btn_print">
                                    <i class="icon-print icon-white"></i>确定</button>
                                <button type="reset" class="btn btn-primary" id="btn_back">
                                    <i class="icon-chevron-left icon-white"></i>返回</button>
                            </div>
                        </fieldset>
                        </form>
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
<script src="../js/jquery-1.7.2.min.js"></script>
<!-- jQuery UI -->
<script src="../js/jquery-ui-1.8.21.custom.min.js"></script>
<!--ajax读取-->
<script src="js/addUser.js"></script>
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
<script src="../js/jquery.chosen.min.js"></script>
<!-- checkbox, radio, and file input styler -->
<script src="../js/jquery.uniform.min.js"></script>
<!-- plugin for gallery image view -->
<script src="../js/jquery.colorbox.min.js"></script>
<!-- rich text editor library -->
<script src="../js/jquery.cleditor.min.js"></script>
<!-- notification plugin -->
<script src="../js/jquery.noty.js"></script>
<!-- file manager library -->
<script src="../js/jquery.elfinder.min.js"></script>
<!-- star rating plugin -->
<script src="../js/jquery.raty.min.js"></script>
<!-- for iOS style toggle switch -->
<script src="../js/jquery.iphone.toggle.js"></script>
<!-- autogrowing textarea plugin -->
<script src="../js/jquery.autogrow-textarea.js"></script>
<!-- multiple file upload plugin -->
<script src="../js/jquery.uploadify-3.1.min.js"></script>
<!-- history.js for cross-browser state change on ajax -->
<script src="../js/jquery.history.js"></script>
<!-- application script for Charisma demo -->
<script src="../js/charisma.js"></script>
</body>
</html>
