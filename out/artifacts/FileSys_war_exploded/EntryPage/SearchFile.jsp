<%@page language="java" pageEncoding="GBK" %>
<%@include file="EntryValidate.jsp"%>
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
                        <a href="#">发文查询</a>
                    </li>
                </ul>
            </div>

            <div class="row-fluid">
                <div class="box span12">
                    <div class="box-header well">
                        <h2><i class="icon-info-sign"></i> 查询条件</h2>
                        <div class="box-icon">
                            <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                        </div>
                    </div>
                    <div class="box-content">
                        <div class="control-group">
                            <div class="controls">
                                <div class="input-append">
                                    收文日期：
                                    <input placeholder="请填写收文日期..." type="text" id="sendTime" style="width: 10%">
                                    &nbsp;发布单位：
                                    <select style="width: 10%" id="sendComp">
                                        <option value="gj_file_view">全部</option>
                                        <option value="gj_file_plant">厂发</option>
                                        <option value="gj_file_company">分公司发</option>
                                    </select>&nbsp;
                                    <button class="btn" type="button" onclick="SearchFileByDate()">查询</button>
                                    <button class="btn" type="button" onclick="initPage()">重置</button>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>

            <div class="row-fluid">
                <div class="box span12">
                    <div class="box-header well" data-original-title="">
                        <h2><i class="icon-edit"></i>查询结果</h2>
                    </div>
                    <div class="box-content">
                        <div id="ReleasedTblBlock" class="dataTables_wrapper" role="grid">
                            <table class="table table-striped table-bordered bootstrap-datatable datatable dataTable" id="ReleasedTbl" aria-describedby="DataTables_Table_0_info" style="width: 100%">
                                <thead>
                                <tr role="row">
                                    <th class="sorting_asc" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-sort="ascending">ID</th>
                                    <th class="sorting" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1">收文日期</th>
                                    <th class="sorting" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1">行政文号</th>
                                    <th class="sorting" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1">来文单位</th>
                                    <th class="sorting" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1">文件名称</th>
                                    <th class="sorting" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1">发布单位</th>
                                    <th class="sorting" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1">状态</th>
                                    <th class="sorting" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 12%">操作</th>
                                </tr>
                                </thead>
                                <tbody role="alert" aria-live="polite" aria-relevant="all">

                                </tbody>
                            </table>
                        </div>
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
<script src="js/SearchFile.js"></script>
<script src="../js/date_zhcn.js"></script>
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
<script type="text/javascript">
    $(function(){
        $("#sendTime").datepicker();
    })
</script>
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
