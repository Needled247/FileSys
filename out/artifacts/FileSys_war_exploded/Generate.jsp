<%@page language="java" pageEncoding="GBK" %>
<%@include file="Validate.jsp"%>
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
        .adv{height: 100px;}
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
        <div id="content" class="span10">
            <!-- 主容器部分 -->
            <div>
                <ul class="breadcrumb">
                    <li>
                        <a href="#">发文管理</a> <span class="divider">/</span>
                    </li>
                    <li>
                        <a href="#">阅办单生成</a>
                    </li>
                </ul>
            </div>

            <div class="row-fluid sortable ui-sortable">
                <div class="box span12">
                    <div class="box-header well" data-original-title="">
                        <h2><i class="icon-edit"></i>生成收文阅办单</h2>
                    </div>
                    <div class="box-content">
                        <form class="form-horizontal">
                        <fieldset>
                            <legend>请填写数据</legend>
                            <div class="control-group">
                                <label class="control-label" for="sendTime">收文日期：</label>
                                <div class="controls">
                                    <input class="input-xlarge focused datepicker" style="width: 20%" id="sendTime" name="sendTime" type="text" placeholder="标题时间">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="sw1">收文1：</label>
                                <div class="controls">
                                    <input class="input-xlarge focused btn-setting" id="sw1" type="text" onclick="initTbl()" style="width: 20%" placeholder="点击选择">
                                    <input type="hidden" id="hsw1">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="sw2">收文2：</label>
                                <div class="controls">
                                    <input class="input-xlarge focused" id="sw2" type="text" style="width: 20%" placeholder="自动填充" disabled>
                                    <input type="hidden" id="hsw2">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="sw3">收文3：</label>
                                <div class="controls">
                                    <input class="input-xlarge focused" id="sw3" type="text" style="width: 20%" placeholder="自动填充" disabled>
                                    <input type="hidden" id="hsw3">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="sw4">收文4：</label>
                                <div class="controls">
                                    <input class="input-xlarge focused" id="sw4" type="text" style="width: 20%" placeholder="自动填充" disabled>
                                    <input type="hidden" id="hsw4">
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label" for="leader">领导批示：</label>
                                <div class="controls">
                                    <textarea rows="3" id="leader" placeholder="默认为空"></textarea>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="main">主管领导批示：</label>
                                <div class="controls">
                                    <textarea rows="3" id="main" placeholder="默认为空"></textarea>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="advice">拟办意见：</label>
                                <div class="controls">
                                    <textarea rows="3" id="advice" placeholder="自动生成"></textarea>
                                </div>
                            </div>

                            <div class="form-actions">
                                <button type="button" class="btn btn-warning"  id="btn_print">
                                    <i class="icon-print icon-white"></i>导出</button>
                                <button type="button" class="btn btn-danger" onclick="" id="btn_del">
                                    <i class="icon-print icon-white"></i>清空</button>
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
    <!--调出窗口-->
    <div class="modal-print hide fade" id="myModal">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">×</button>
            <h3>请选择收文内容</h3>
        </div>
        <div class="modal-body">
            <div id="ReleasedTblBlock" class="dataTables_wrapper" role="grid">
                <table class="table table-striped table-bordered bootstrap-datatable datatable dataTable" id="ReleasedTbl" aria-describedby="DataTables_Table_0_info">
                    <thead>
                    <tr>
                        <th>来文单位</th>
                        <th>收文编号</th>
                        <th>收文日期</th>
                        <th>行政文号</th>
                        <th>文件名称</th>
                        <th>件数</th>
                        <th>红头件数</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="modal-footer">
            <a href="#" class="btn" data-dismiss="modal">关闭</a>
            <a href="#" class="btn btn-primary" onclick="getFileName()">确定</a>
        </div>
    </div>
    <!--打印窗口-->
    <div class="modal-print hide fade" id="printModal">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">×</button>
            <h3>打印收文阅办单</h3>
        </div>
        <!--表格 开始-->
        <div class="modal-body" align="center" id="toPrint">
            <table style="border-collapse:collapse;
margin-left:6.7500pt; margin-right:6.7500pt; mso-table-layout-alt:fixed;
padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; ">
                <tbody>
                <tr style="height:19.9000pt; ">
                <td width="128" valign="center" colspan="2" style="width:96.0000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:1.5000pt solid rgb(0,0,0); mso-border-left-alt:1.5000pt solid rgb(0,0,0); border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:1.5000pt solid rgb(0,0,0); mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; line-height:150%; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'宋体'; ">收文日期</span><span style="font-size:10.5000pt; font-family:'宋体'; "><o:p></o:p></span></p></td>
                <td width="432" valign="center" colspan="8" style="width:324.0000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:1.5000pt solid rgb(0,0,0); mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'宋体'; " id="date"></span><span style="font-size:10.5000pt; font-family:'宋体'; "><o:p></o:p></span></p></td>
            </tr>
            <tr style="height:29.7000pt; "><td width="29" valign="center" rowspan="2" style="width:21.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:1.5000pt solid rgb(0,0,0); mso-border-left-alt:1.5000pt solid rgb(0,0,0); border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:none; ; border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-left:5.6500pt; margin-right:5.6500pt; margin-bottom:0pt; margin-top:0pt; text-align:justify;  "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'宋体'; ">收文一</span><span style="font-size:10.5000pt; font-family:'宋体'; "><o:p></o:p></span></p></td>
                <td width="99" valign="center" style="width:74.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'宋体'; ">来文机关</span><span style="font-size:10.5000pt; font-family:'宋体'; "><o:p></o:p></span></p></td>
                <td width="109" valign="center" colspan="2" style="width:81.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:1.5000pt solid rgb(0,0,0); mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'宋体'; " id="cadd1"></span></p></td>
                <td width="73" valign="center" style="width:54.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:1.5000pt solid rgb(0,0,0); mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'宋体'; ">来文字号</span><span style="font-size:10.5000pt; font-family:'宋体'; "><o:p></o:p></span></p></td>
                <td width="109" valign="center" colspan="2" style="width:81.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:1.5000pt solid rgb(0,0,0); mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'宋体'; " id="cnum1"></span></p></td>
                <td width="92" valign="center" colspan="2" style="width:69.0000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:1.5000pt solid rgb(0,0,0); mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'宋体'; ">份数</span></p></td>
                <td width="49" valign="center" style="width:36.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:1.5000pt solid rgb(0,0,0); mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'宋体'; " id="quantity1"></span></p></td>
            </tr>
            <tr style="height:30.4500pt; "><td width="99" valign="center" style="width:74.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'宋体'; ">收文编号</span><span style="font-size:10.5000pt; font-family:'宋体'; "><o:p></o:p></span></p></td>
                <td width="109" valign="center" colspan="2" style="width:81.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'宋体'; " id="snum1"></span></p></td>
                <td width="73" valign="center" style="width:54.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'宋体'; ">公文标题</span><span style="font-size:10.5000pt; font-family:'宋体'; "><o:p></o:p></span></p></td>
                <td width="250" valign="center" colspan="5" style="width:187.5000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'宋体'; " id="title1"></span></p></td>
            </tr>
            <tr style="height:30.4500pt; "><td width="29" valign="center" rowspan="2" style="width:21.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:1.5000pt solid rgb(0,0,0); mso-border-left-alt:1.5000pt solid rgb(0,0,0); border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:none; ; border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-left:5.6500pt; margin-right:5.6500pt; margin-bottom:0pt; margin-top:0pt; text-align:justify;  "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'宋体'; ">收文二</span><span style="font-size:10.5000pt; font-family:'宋体'; "><o:p></o:p></span></p></td>
                <td width="99" valign="center" style="width:74.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'宋体'; ">来文机关</span><span style="font-size:10.5000pt; font-family:'宋体'; "><o:p></o:p></span></p></td>
                <td width="109" valign="center" colspan="2" style="width:81.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'宋体'; " id="cadd2"></span></p></td>
                <td width="92" valign="center" style="width:69.0000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'宋体'; ">来文字号</span><span style="font-size:10.5000pt; font-family:'宋体'; "><o:p></o:p></span></p></td>
                <td width="109" valign="center" colspan="2" style="width:81.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'宋体'; " id="cnum2"></span></p></td>
                <td width="73" valign="center" colspan="2" style="width:54.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:1.5000pt solid rgb(0,0,0); mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'宋体'; ">份数</span></p></td>
                <td width="49" valign="center" style="width:36.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:1.5000pt solid rgb(0,0,0); mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'宋体'; " id="quantity2"></span></p></td>
            </tr>
            <tr style="height:31.1000pt; "><td width="99" valign="center" style="width:74.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'宋体'; ">收文编号</span><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><o:p></o:p></span></p></td>
                <td width="109" valign="center" colspan="2" style="width:81.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'Times New Roman'; " id="snum2"></span></p></td>
                <td width="73" valign="center" style="width:54.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'宋体'; ">公文标题</span><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><o:p></o:p></span></p></td>
                <td width="250" valign="center" colspan="5" style="width:187.5000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'Times New Roman'; " id="title2"></span></p></td>
            </tr>
            <tr style="height:27.4500pt; "><td width="29" valign="center" rowspan="2" style="width:21.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:1.5000pt solid rgb(0,0,0); mso-border-left-alt:1.5000pt solid rgb(0,0,0); border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:none; ; border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-left:5.6500pt; margin-right:5.6500pt; margin-bottom:0pt; margin-top:0pt; text-align:justify;  "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'宋体'; ">收文三</span><span style="font-size:10.5000pt; font-family:'宋体'; "><o:p></o:p></span></p></td>
                <td width="99" valign="center" style="width:74.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'宋体'; ">来文机关</span><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><o:p></o:p></span></p></td>
                <td width="109" valign="center" colspan="2" style="width:81.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'Times New Roman'; " id="cadd3"></span></p></td>
                <td width="73" valign="center" style="width:54.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'宋体'; ">来文字号</span><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><o:p></o:p></span></p></td>
                <td width="109" valign="center" colspan="2" style="width:81.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'Times New Roman'; " id="cnum3"></span></p></td>
                <td width="92" valign="center" colspan="2" style="width:69.0000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:1.5000pt solid rgb(0,0,0); mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'Times New Roman'; ">份数</span></p></td>
                <td width="49" valign="center" style="width:36.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:1.5000pt solid rgb(0,0,0); mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'Times New Roman'; " id="quantity3"></span></p></td>
            </tr>
            <tr style="height:28.2000pt; "><td width="99" valign="center" style="width:74.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'宋体'; ">收文编号</span><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><o:p></o:p></span></p></td>
                <td width="109" valign="center" colspan="2" style="width:81.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'Times New Roman'; " id="snum3"></span></p></td>
                <td width="73" valign="center" style="width:54.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'宋体'; ">公文标题</span><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><o:p></o:p></span></p></td>
                <td width="250" valign="center" colspan="5" style="width:187.5000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'Times New Roman'; " id="title3"></span></p></td>
            </tr>
            <tr style="height:26.2000pt; "><td width="29" valign="center" rowspan="2" style="width:21.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:1.5000pt solid rgb(0,0,0); mso-border-left-alt:1.5000pt solid rgb(0,0,0); border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:none; ; border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-left:5.6500pt; margin-right:5.6500pt; margin-bottom:0pt; margin-top:0pt; text-align:justify;  "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'宋体'; ">收文四</span><span style="font-size:10.5000pt; font-family:'宋体'; "><o:p></o:p></span></p></td>
                <td width="99" valign="center" style="width:74.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'宋体'; ">来文机关</span><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><o:p></o:p></span></p></td>
                <td width="109" valign="center" colspan="2" style="width:81.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'Times New Roman'; " id="cadd4"></span></p></td>
                <td width="73" valign="center" style="width:54.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'宋体'; ">来文字号</span><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><o:p></o:p></span></p></td>
                <td width="109" valign="center" colspan="2" style="width:81.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'Times New Roman'; " id="cnum4"></span></p></td>
                <td width="92" valign="center" colspan="2" style="width:69.0000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:1.5000pt solid rgb(0,0,0); mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'Times New Roman'; ">份数</span></p></td>
                <td width="49" valign="center" style="width:36.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:1.5000pt solid rgb(0,0,0); mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'Times New Roman'; " id="quantity4"></span></p></td>
            </tr>
            <tr style="height:28.2000pt; "><td width="99" valign="center" style="width:74.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'宋体'; ">收文编号</span><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><o:p></o:p></span></p></td>
                <td width="109" valign="center" colspan="2" style="width:81.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'Times New Roman'; " id="snum4"></span></p></td>
                <td width="73" valign="center" style="width:54.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'宋体'; ">公文标题</span><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><o:p></o:p></span></p></td>
                <td width="250" valign="center" colspan="5" style="width:187.5000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'Times New Roman'; " id="title4"></span></p></td>
            </tr>
            <tr style="height:77.0000pt; "><td width="29" valign="center" style="width:21.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:1.5000pt solid rgb(0,0,0); mso-border-left-alt:1.5000pt solid rgb(0,0,0); border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-left:5.6500pt; margin-right:5.6500pt; margin-bottom:0pt; margin-top:0pt; text-align:justify;  "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'宋体'; ">领导批示</span><span style="font-size:10.5000pt; font-family:'宋体'; "><o:p></o:p></span></p></td>
                <td width="531" valign="center" colspan="9" style="width:398.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; "><span style="font-size:10.5000pt; font-family:'Times New Roman'; " id="adv1"></span></p></td>
            </tr>
            <tr style="height:75.5000pt; "><td width="29" valign="center" style="width:21.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:1.5000pt solid rgb(0,0,0); mso-border-left-alt:1.5000pt solid rgb(0,0,0); border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-left:5.6500pt; margin-right:5.6500pt; margin-bottom:0pt; margin-top:0pt; text-align:justify;  "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'宋体'; ">主管领导批示</span><span style="font-size:10.5000pt; font-family:'宋体'; "><o:p></o:p></span></p></td>
                <td width="531" valign="center" colspan="9" style="width:398.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; "><span style="font-size:10.5000pt; font-family:'Times New Roman'; " id="adv2"></span></p></td>
            </tr>
            <tr style="height:75.5000pt; "><td width="29" valign="center" style="width:21.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:1.5000pt solid rgb(0,0,0); mso-border-left-alt:1.5000pt solid rgb(0,0,0); border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-left:5.6500pt; margin-right:5.6500pt; margin-bottom:0pt; margin-top:0pt; text-align:justify;  "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'宋体'; ">拟办意见</span><span style="font-size:10.5000pt; font-family:'宋体'; "><o:p></o:p></span></p></td>
                <td width=531  valign=center  colspan=9  style="width:398.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); " ><p class=p0  style="margin-bottom:0pt; margin-top:0pt; text-align:justify; " ><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'&#23435;&#20307;'; " id="adv3"></span><span style="font-size:10.5000pt; font-family:'&#23435;&#20307;'; " ><o:p></o:p></span></p></td>
            </tr>
            <tr style="height:22.9500pt; "><td width="29" valign="center" rowspan="5" style="width:21.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:1.5000pt solid rgb(0,0,0); mso-border-left-alt:1.5000pt solid rgb(0,0,0); border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:none; ; border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-left:5.6500pt; margin-right:5.6500pt; margin-bottom:0pt; margin-top:0pt; text-align:justify;  "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'宋体'; ">文件传阅</span><span style="font-size:10.5000pt; font-family:'宋体'; "><o:p></o:p></span></p></td>
                <td width="99" valign="center" style="width:74.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'宋体'; ">阅件部门或阅件人</span><span style="font-size:10.5000pt; font-family:'宋体'; "><o:p></o:p></span></p></td>
                <td width="103" valign="center" style="width:77.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:1.5000pt solid rgb(0,0,0); mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'宋体'; ">签字</span><span style="font-size:10.5000pt; font-family:'宋体'; "><o:p></o:p></span></p></td>
                <td width="79" valign="center" colspan="2" style="width:59.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:1.5000pt solid rgb(0,0,0); mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'宋体'; ">阅件日期</span><span style="font-size:10.5000pt; font-family:'宋体'; "><o:p></o:p></span></p></td>
                <td width="86" valign="center" style="width:64.5000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:1.5000pt solid rgb(0,0,0); mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'宋体'; ">阅件部门或阅件人</span><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><o:p></o:p></span></p></td>
                <td width="90" valign="center" colspan="2" style="width:67.5000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:1.5000pt solid rgb(0,0,0); mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'宋体'; ">签字</span><span style="font-size:10.5000pt; font-family:'宋体'; "><o:p></o:p></span></p></td>
                <td width="74" valign="center" colspan="2" style="width:55.5000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:1.5000pt solid rgb(0,0,0); mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt;  text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'宋体'; ">阅件日期</span><span style="font-size:10.5000pt; font-family:'宋体'; "><o:p></o:p></span></p></td>
            </tr>
            <tr style="height:20.1000pt; "><td width="99" valign="center" style="width:74.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; ">书记</span></p></td>
                <td width="103" valign="center" style="width:77.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; "></span></p></td>
                <td width="79" valign="center" colspan="2" style="width:59.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><!--date--></span></p></td>
                <td width="86" valign="center" style="width:64.5000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; ">厂长</span></p></td>
                <td width="90" valign="center" colspan="2" style="width:67.5000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; "></span></p></td>
                <td width="74" valign="center" colspan="2" style="width:55.5000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><!--date--></span></p></td>
            </tr>
            <tr style="height:20.1000pt; "><td width="99" valign="center" style="width:74.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; ">副书记</span></p></td>
                <td width="103" valign="center" style="width:77.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; "></span></p></td>
                <td width="79" valign="center" colspan="2" style="width:59.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><!--date--></span></p></td>
                <td width="86" valign="center" style="width:64.5000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; ">技术副厂长</span></p></td>
                <td width="90" valign="center" colspan="2" style="width:67.5000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; "></span></p></td>
                <td width="74" valign="center" colspan="2" style="width:55.5000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><!--date--></span></p></td>
            </tr>
            <tr style="height:20.8500pt; "><td width="99" valign="center" style="width:74.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt;  text-align:center; "><span style="font-size:10.5000pt; font-family:'Times New Roman'; ">总工程师</span></p></td>
                <td width="103" valign="center" style="width:77.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; "></span></p></td>
                <td width="79" valign="center" colspan="2" style="width:59.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><!--date--></span></p></td>
                <td width="86" valign="center" style="width:64.5000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; ">人事副厂长</span></p></td>
                <td width="90" valign="center" colspan="2" style="width:67.5000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; "></span></p></td>
                <td width="74" valign="center" colspan="2" style="width:55.5000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><!--date--></span></p></td>
            </tr>
            <tr style="height:20.1000pt; "><td width="99" valign="center" style="width:74.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; ">安全副厂长</span></p></td>
                <td width="103" valign="center" style="width:77.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt;  text-align:center; "><span style="font-size:10.5000pt; font-family:'Times New Roman'; "></span></p></td>
                <td width="79" valign="center" colspan="2" style="width:59.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><!--date--></span></p></td>
                <td width="86" valign="center" style="width:64.5000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; "></span></p></td>
                <td width="90" valign="center" colspan="2" style="width:67.5000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; "></span></p></td>
                <td width="74" valign="center" colspan="2" style="width:55.5000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><!--date--></span></p></td>
            </tr>
            <tr style="height:60.9000pt; "><td width="29" valign="center" style="width:21.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:1.5000pt solid rgb(0,0,0); mso-border-left-alt:1.5000pt solid rgb(0,0,0); border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-left:5.6500pt; margin-right:5.6500pt; margin-bottom:0pt; margin-top:0pt; text-align:justify;  "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'宋体'; ">办理结果</span><span style="font-size:10.5000pt; font-family:'宋体'; "><o:p></o:p></span></p></td>
                <td width="531" valign="center" colspan="9" style="width:398.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; "><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><o:p>&nbsp;</o:p></span></p></td>
            </tr>
            </tbody></table>
            <input type="hidden" id="rh1">
            <input type="hidden" id="rh2">
            <input type="hidden" id="rh3">
            <input type="hidden" id="rh4">
        </div>
        <!--表格 结束-->
        <div class="modal-footer">
            <a href="#" class="btn" data-dismiss="modal">关闭</a>
            <a href="#" class="btn btn-primary" onclick="exportExcel()">导出</a>
        </div>
    </div>
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
<!--ajax读取-->
<script src="js/fileSys/Generate.js"></script>
<!--jqprint-->
<script src="js/jquery.jqprint-0.3.js"></script>
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
<script type="text/javascript">
    $(function(){
        $("#sendTime").datepicker();
    })
</script>
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
<!-- tour library -->
<script src="js/bootstrap-tour.js"></script>
<!-- library for cookie management -->
<script src="js/jquery.cookie.js"></script>
<!-- calander plugin -->
<script src='js/fullcalendar.min.js'></script>
<!-- data table plugin -->
<script src='js/jquery.dataTables.min.js'></script>
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
