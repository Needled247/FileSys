<%@page language="java" pageEncoding="GBK" %>
<%@include file="Validate.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="GBK">
    <title>�ļ��İ����ϵͳ</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- ��ʽ�� -->
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
    <!-- HTML5����IE -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <!-- The fav icon -->
    <link rel="shortcut icon" href="img/favicon.ico">
</head>

<body>
<!-- ������ʾ -->
<%@include file="head.jsp"%>
<div class="container-fluid">
    <div class="row-fluid">
        <!--���˵�-->
        <%@include file="menu.jsp"%>
        <div id="content" class="span10">
            <!-- ���������� -->
            <div>
                <ul class="breadcrumb">
                    <li>
                        <a href="#">���Ĺ���</a> <span class="divider">/</span>
                    </li>
                    <li>
                        <a href="#">�İ쵥����</a>
                    </li>
                </ul>
            </div>

            <div class="row-fluid sortable ui-sortable">
                <div class="box span12">
                    <div class="box-header well" data-original-title="">
                        <h2><i class="icon-edit"></i>���������İ쵥</h2>
                    </div>
                    <div class="box-content">
                        <form class="form-horizontal">
                        <fieldset>
                            <legend>����д����</legend>
                            <div class="control-group">
                                <label class="control-label" for="sendTime">�������ڣ�</label>
                                <div class="controls">
                                    <input class="input-xlarge focused datepicker" style="width: 20%" id="sendTime" name="sendTime" type="text" placeholder="����ʱ��">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="sw1">����1��</label>
                                <div class="controls">
                                    <input class="input-xlarge focused btn-setting" id="sw1" type="text" onclick="initTbl()" style="width: 20%" placeholder="���ѡ��">
                                    <input type="hidden" id="hsw1">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="sw2">����2��</label>
                                <div class="controls">
                                    <input class="input-xlarge focused" id="sw2" type="text" style="width: 20%" placeholder="�Զ����" disabled>
                                    <input type="hidden" id="hsw2">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="sw3">����3��</label>
                                <div class="controls">
                                    <input class="input-xlarge focused" id="sw3" type="text" style="width: 20%" placeholder="�Զ����" disabled>
                                    <input type="hidden" id="hsw3">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="sw4">����4��</label>
                                <div class="controls">
                                    <input class="input-xlarge focused" id="sw4" type="text" style="width: 20%" placeholder="�Զ����" disabled>
                                    <input type="hidden" id="hsw4">
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label" for="leader">�쵼��ʾ��</label>
                                <div class="controls">
                                    <textarea rows="3" id="leader" placeholder="Ĭ��Ϊ��"></textarea>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="main">�����쵼��ʾ��</label>
                                <div class="controls">
                                    <textarea rows="3" id="main" placeholder="Ĭ��Ϊ��"></textarea>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="advice">��������</label>
                                <div class="controls">
                                    <textarea rows="3" id="advice" placeholder="�Զ�����"></textarea>
                                </div>
                            </div>

                            <div class="form-actions">
                                <button type="button" class="btn btn-warning"  id="btn_print">
                                    <i class="icon-print icon-white"></i>����</button>
                                <button type="button" class="btn btn-danger" onclick="" id="btn_del">
                                    <i class="icon-print icon-white"></i>���</button>
                                <button type="reset" class="btn btn-primary" id="btn_back">
                                    <i class="icon-chevron-left icon-white"></i>����</button>
                            </div>
                        </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <hr>
    <!--��������-->
    <div class="modal-print hide fade" id="myModal">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">��</button>
            <h3>��ѡ����������</h3>
        </div>
        <div class="modal-body">
            <div id="ReleasedTblBlock" class="dataTables_wrapper" role="grid">
                <table class="table table-striped table-bordered bootstrap-datatable datatable dataTable" id="ReleasedTbl" aria-describedby="DataTables_Table_0_info">
                    <thead>
                    <tr>
                        <th>���ĵ�λ</th>
                        <th>���ı��</th>
                        <th>��������</th>
                        <th>�����ĺ�</th>
                        <th>�ļ�����</th>
                        <th>����</th>
                        <th>��ͷ����</th>
                        <th>����</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="modal-footer">
            <a href="#" class="btn" data-dismiss="modal">�ر�</a>
            <a href="#" class="btn btn-primary" onclick="getFileName()">ȷ��</a>
        </div>
    </div>
    <!--��ӡ����-->
    <div class="modal-print hide fade" id="printModal">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">��</button>
            <h3>��ӡ�����İ쵥</h3>
        </div>
        <!--��� ��ʼ-->
        <div class="modal-body" align="center" id="toPrint">
            <table style="border-collapse:collapse;
margin-left:6.7500pt; margin-right:6.7500pt; mso-table-layout-alt:fixed;
padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; ">
                <tbody>
                <tr style="height:19.9000pt; ">
                <td width="128" valign="center" colspan="2" style="width:96.0000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:1.5000pt solid rgb(0,0,0); mso-border-left-alt:1.5000pt solid rgb(0,0,0); border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:1.5000pt solid rgb(0,0,0); mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; line-height:150%; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'����'; ">��������</span><span style="font-size:10.5000pt; font-family:'����'; "><o:p></o:p></span></p></td>
                <td width="432" valign="center" colspan="8" style="width:324.0000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:1.5000pt solid rgb(0,0,0); mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'����'; " id="date"></span><span style="font-size:10.5000pt; font-family:'����'; "><o:p></o:p></span></p></td>
            </tr>
            <tr style="height:29.7000pt; "><td width="29" valign="center" rowspan="2" style="width:21.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:1.5000pt solid rgb(0,0,0); mso-border-left-alt:1.5000pt solid rgb(0,0,0); border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:none; ; border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-left:5.6500pt; margin-right:5.6500pt; margin-bottom:0pt; margin-top:0pt; text-align:justify;  "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'����'; ">����һ</span><span style="font-size:10.5000pt; font-family:'����'; "><o:p></o:p></span></p></td>
                <td width="99" valign="center" style="width:74.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'����'; ">���Ļ���</span><span style="font-size:10.5000pt; font-family:'����'; "><o:p></o:p></span></p></td>
                <td width="109" valign="center" colspan="2" style="width:81.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:1.5000pt solid rgb(0,0,0); mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'����'; " id="cadd1"></span></p></td>
                <td width="73" valign="center" style="width:54.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:1.5000pt solid rgb(0,0,0); mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'����'; ">�����ֺ�</span><span style="font-size:10.5000pt; font-family:'����'; "><o:p></o:p></span></p></td>
                <td width="109" valign="center" colspan="2" style="width:81.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:1.5000pt solid rgb(0,0,0); mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'����'; " id="cnum1"></span></p></td>
                <td width="92" valign="center" colspan="2" style="width:69.0000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:1.5000pt solid rgb(0,0,0); mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'����'; ">����</span></p></td>
                <td width="49" valign="center" style="width:36.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:1.5000pt solid rgb(0,0,0); mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'����'; " id="quantity1"></span></p></td>
            </tr>
            <tr style="height:30.4500pt; "><td width="99" valign="center" style="width:74.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'����'; ">���ı��</span><span style="font-size:10.5000pt; font-family:'����'; "><o:p></o:p></span></p></td>
                <td width="109" valign="center" colspan="2" style="width:81.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'����'; " id="snum1"></span></p></td>
                <td width="73" valign="center" style="width:54.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'����'; ">���ı���</span><span style="font-size:10.5000pt; font-family:'����'; "><o:p></o:p></span></p></td>
                <td width="250" valign="center" colspan="5" style="width:187.5000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'����'; " id="title1"></span></p></td>
            </tr>
            <tr style="height:30.4500pt; "><td width="29" valign="center" rowspan="2" style="width:21.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:1.5000pt solid rgb(0,0,0); mso-border-left-alt:1.5000pt solid rgb(0,0,0); border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:none; ; border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-left:5.6500pt; margin-right:5.6500pt; margin-bottom:0pt; margin-top:0pt; text-align:justify;  "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'����'; ">���Ķ�</span><span style="font-size:10.5000pt; font-family:'����'; "><o:p></o:p></span></p></td>
                <td width="99" valign="center" style="width:74.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'����'; ">���Ļ���</span><span style="font-size:10.5000pt; font-family:'����'; "><o:p></o:p></span></p></td>
                <td width="109" valign="center" colspan="2" style="width:81.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'����'; " id="cadd2"></span></p></td>
                <td width="92" valign="center" style="width:69.0000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'����'; ">�����ֺ�</span><span style="font-size:10.5000pt; font-family:'����'; "><o:p></o:p></span></p></td>
                <td width="109" valign="center" colspan="2" style="width:81.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'����'; " id="cnum2"></span></p></td>
                <td width="73" valign="center" colspan="2" style="width:54.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:1.5000pt solid rgb(0,0,0); mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'����'; ">����</span></p></td>
                <td width="49" valign="center" style="width:36.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:1.5000pt solid rgb(0,0,0); mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'����'; " id="quantity2"></span></p></td>
            </tr>
            <tr style="height:31.1000pt; "><td width="99" valign="center" style="width:74.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'����'; ">���ı��</span><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><o:p></o:p></span></p></td>
                <td width="109" valign="center" colspan="2" style="width:81.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'Times New Roman'; " id="snum2"></span></p></td>
                <td width="73" valign="center" style="width:54.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'����'; ">���ı���</span><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><o:p></o:p></span></p></td>
                <td width="250" valign="center" colspan="5" style="width:187.5000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'Times New Roman'; " id="title2"></span></p></td>
            </tr>
            <tr style="height:27.4500pt; "><td width="29" valign="center" rowspan="2" style="width:21.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:1.5000pt solid rgb(0,0,0); mso-border-left-alt:1.5000pt solid rgb(0,0,0); border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:none; ; border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-left:5.6500pt; margin-right:5.6500pt; margin-bottom:0pt; margin-top:0pt; text-align:justify;  "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'����'; ">������</span><span style="font-size:10.5000pt; font-family:'����'; "><o:p></o:p></span></p></td>
                <td width="99" valign="center" style="width:74.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'����'; ">���Ļ���</span><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><o:p></o:p></span></p></td>
                <td width="109" valign="center" colspan="2" style="width:81.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'Times New Roman'; " id="cadd3"></span></p></td>
                <td width="73" valign="center" style="width:54.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'����'; ">�����ֺ�</span><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><o:p></o:p></span></p></td>
                <td width="109" valign="center" colspan="2" style="width:81.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'Times New Roman'; " id="cnum3"></span></p></td>
                <td width="92" valign="center" colspan="2" style="width:69.0000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:1.5000pt solid rgb(0,0,0); mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'Times New Roman'; ">����</span></p></td>
                <td width="49" valign="center" style="width:36.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:1.5000pt solid rgb(0,0,0); mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'Times New Roman'; " id="quantity3"></span></p></td>
            </tr>
            <tr style="height:28.2000pt; "><td width="99" valign="center" style="width:74.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'����'; ">���ı��</span><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><o:p></o:p></span></p></td>
                <td width="109" valign="center" colspan="2" style="width:81.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'Times New Roman'; " id="snum3"></span></p></td>
                <td width="73" valign="center" style="width:54.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'����'; ">���ı���</span><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><o:p></o:p></span></p></td>
                <td width="250" valign="center" colspan="5" style="width:187.5000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'Times New Roman'; " id="title3"></span></p></td>
            </tr>
            <tr style="height:26.2000pt; "><td width="29" valign="center" rowspan="2" style="width:21.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:1.5000pt solid rgb(0,0,0); mso-border-left-alt:1.5000pt solid rgb(0,0,0); border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:none; ; border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-left:5.6500pt; margin-right:5.6500pt; margin-bottom:0pt; margin-top:0pt; text-align:justify;  "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'����'; ">������</span><span style="font-size:10.5000pt; font-family:'����'; "><o:p></o:p></span></p></td>
                <td width="99" valign="center" style="width:74.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'����'; ">���Ļ���</span><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><o:p></o:p></span></p></td>
                <td width="109" valign="center" colspan="2" style="width:81.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'Times New Roman'; " id="cadd4"></span></p></td>
                <td width="73" valign="center" style="width:54.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'����'; ">�����ֺ�</span><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><o:p></o:p></span></p></td>
                <td width="109" valign="center" colspan="2" style="width:81.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'Times New Roman'; " id="cnum4"></span></p></td>
                <td width="92" valign="center" colspan="2" style="width:69.0000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:1.5000pt solid rgb(0,0,0); mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'Times New Roman'; ">����</span></p></td>
                <td width="49" valign="center" style="width:36.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:1.5000pt solid rgb(0,0,0); mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'Times New Roman'; " id="quantity4"></span></p></td>
            </tr>
            <tr style="height:28.2000pt; "><td width="99" valign="center" style="width:74.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'����'; ">���ı��</span><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><o:p></o:p></span></p></td>
                <td width="109" valign="center" colspan="2" style="width:81.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'Times New Roman'; " id="snum4"></span></p></td>
                <td width="73" valign="center" style="width:54.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'����'; ">���ı���</span><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><o:p></o:p></span></p></td>
                <td width="250" valign="center" colspan="5" style="width:187.5000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="font-size:10.5000pt; font-family:'Times New Roman'; " id="title4"></span></p></td>
            </tr>
            <tr style="height:77.0000pt; "><td width="29" valign="center" style="width:21.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:1.5000pt solid rgb(0,0,0); mso-border-left-alt:1.5000pt solid rgb(0,0,0); border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-left:5.6500pt; margin-right:5.6500pt; margin-bottom:0pt; margin-top:0pt; text-align:justify;  "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'����'; ">�쵼��ʾ</span><span style="font-size:10.5000pt; font-family:'����'; "><o:p></o:p></span></p></td>
                <td width="531" valign="center" colspan="9" style="width:398.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; "><span style="font-size:10.5000pt; font-family:'Times New Roman'; " id="adv1"></span></p></td>
            </tr>
            <tr style="height:75.5000pt; "><td width="29" valign="center" style="width:21.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:1.5000pt solid rgb(0,0,0); mso-border-left-alt:1.5000pt solid rgb(0,0,0); border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-left:5.6500pt; margin-right:5.6500pt; margin-bottom:0pt; margin-top:0pt; text-align:justify;  "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'����'; ">�����쵼��ʾ</span><span style="font-size:10.5000pt; font-family:'����'; "><o:p></o:p></span></p></td>
                <td width="531" valign="center" colspan="9" style="width:398.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; "><span style="font-size:10.5000pt; font-family:'Times New Roman'; " id="adv2"></span></p></td>
            </tr>
            <tr style="height:75.5000pt; "><td width="29" valign="center" style="width:21.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:1.5000pt solid rgb(0,0,0); mso-border-left-alt:1.5000pt solid rgb(0,0,0); border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-left:5.6500pt; margin-right:5.6500pt; margin-bottom:0pt; margin-top:0pt; text-align:justify;  "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'����'; ">������</span><span style="font-size:10.5000pt; font-family:'����'; "><o:p></o:p></span></p></td>
                <td width=531  valign=center  colspan=9  style="width:398.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); " ><p class=p0  style="margin-bottom:0pt; margin-top:0pt; text-align:justify; " ><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'&#23435;&#20307;'; " id="adv3"></span><span style="font-size:10.5000pt; font-family:'&#23435;&#20307;'; " ><o:p></o:p></span></p></td>
            </tr>
            <tr style="height:22.9500pt; "><td width="29" valign="center" rowspan="5" style="width:21.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:1.5000pt solid rgb(0,0,0); mso-border-left-alt:1.5000pt solid rgb(0,0,0); border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:none; ; border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-left:5.6500pt; margin-right:5.6500pt; margin-bottom:0pt; margin-top:0pt; text-align:justify;  "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'����'; ">�ļ�����</span><span style="font-size:10.5000pt; font-family:'����'; "><o:p></o:p></span></p></td>
                <td width="99" valign="center" style="width:74.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'����'; ">�ļ����Ż��ļ���</span><span style="font-size:10.5000pt; font-family:'����'; "><o:p></o:p></span></p></td>
                <td width="103" valign="center" style="width:77.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:1.5000pt solid rgb(0,0,0); mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'����'; ">ǩ��</span><span style="font-size:10.5000pt; font-family:'����'; "><o:p></o:p></span></p></td>
                <td width="79" valign="center" colspan="2" style="width:59.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:1.5000pt solid rgb(0,0,0); mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'����'; ">�ļ�����</span><span style="font-size:10.5000pt; font-family:'����'; "><o:p></o:p></span></p></td>
                <td width="86" valign="center" style="width:64.5000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:1.5000pt solid rgb(0,0,0); mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'����'; ">�ļ����Ż��ļ���</span><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><o:p></o:p></span></p></td>
                <td width="90" valign="center" colspan="2" style="width:67.5000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:1.5000pt solid rgb(0,0,0); mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'����'; ">ǩ��</span><span style="font-size:10.5000pt; font-family:'����'; "><o:p></o:p></span></p></td>
                <td width="74" valign="center" colspan="2" style="width:55.5000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:1.5000pt solid rgb(0,0,0); mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt;  text-align:center; "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'����'; ">�ļ�����</span><span style="font-size:10.5000pt; font-family:'����'; "><o:p></o:p></span></p></td>
            </tr>
            <tr style="height:20.1000pt; "><td width="99" valign="center" style="width:74.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; ">���</span></p></td>
                <td width="103" valign="center" style="width:77.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; "></span></p></td>
                <td width="79" valign="center" colspan="2" style="width:59.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><!--date--></span></p></td>
                <td width="86" valign="center" style="width:64.5000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; ">����</span></p></td>
                <td width="90" valign="center" colspan="2" style="width:67.5000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; "></span></p></td>
                <td width="74" valign="center" colspan="2" style="width:55.5000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><!--date--></span></p></td>
            </tr>
            <tr style="height:20.1000pt; "><td width="99" valign="center" style="width:74.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; ">�����</span></p></td>
                <td width="103" valign="center" style="width:77.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; "></span></p></td>
                <td width="79" valign="center" colspan="2" style="width:59.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><!--date--></span></p></td>
                <td width="86" valign="center" style="width:64.5000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; ">����������</span></p></td>
                <td width="90" valign="center" colspan="2" style="width:67.5000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; "></span></p></td>
                <td width="74" valign="center" colspan="2" style="width:55.5000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><!--date--></span></p></td>
            </tr>
            <tr style="height:20.8500pt; "><td width="99" valign="center" style="width:74.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt;  text-align:center; "><span style="font-size:10.5000pt; font-family:'Times New Roman'; ">�ܹ���ʦ</span></p></td>
                <td width="103" valign="center" style="width:77.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; "></span></p></td>
                <td width="79" valign="center" colspan="2" style="width:59.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><!--date--></span></p></td>
                <td width="86" valign="center" style="width:64.5000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; ">���¸�����</span></p></td>
                <td width="90" valign="center" colspan="2" style="width:67.5000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; "></span></p></td>
                <td width="74" valign="center" colspan="2" style="width:55.5000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><!--date--></span></p></td>
            </tr>
            <tr style="height:20.1000pt; "><td width="99" valign="center" style="width:74.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; ">��ȫ������</span></p></td>
                <td width="103" valign="center" style="width:77.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt;  text-align:center; "><span style="font-size:10.5000pt; font-family:'Times New Roman'; "></span></p></td>
                <td width="79" valign="center" colspan="2" style="width:59.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><!--date--></span></p></td>
                <td width="86" valign="center" style="width:64.5000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; "></span></p></td>
                <td width="90" valign="center" colspan="2" style="width:67.5000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; "></span></p></td>
                <td width="74" valign="center" colspan="2" style="width:55.5000pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; text-align:center;  "><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><!--date--></span></p></td>
            </tr>
            <tr style="height:60.9000pt; "><td width="29" valign="center" style="width:21.7500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:1.5000pt solid rgb(0,0,0); mso-border-left-alt:1.5000pt solid rgb(0,0,0); border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-left:5.6500pt; margin-right:5.6500pt; margin-bottom:0pt; margin-top:0pt; text-align:justify;  "><span style="mso-spacerun:'yes'; font-size:10.5000pt; font-family:'����'; ">������</span><span style="font-size:10.5000pt; font-family:'����'; "><o:p></o:p></span></p></td>
                <td width="531" valign="center" colspan="9" style="width:398.2500pt; padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ; border-left:none; ; mso-border-left-alt:none; ; border-right:1.5000pt solid rgb(0,0,0); mso-border-right-alt:1.5000pt solid rgb(0,0,0); border-top:none; ; mso-border-top-alt:1.5000pt solid rgb(0,0,0); border-bottom:1.5000pt solid rgb(0,0,0); mso-border-bottom-alt:1.5000pt solid rgb(0,0,0); "><p class="p0" style="margin-bottom:0pt; margin-top:0pt; "><span style="font-size:10.5000pt; font-family:'Times New Roman'; "><o:p>&nbsp;</o:p></span></p></td>
            </tr>
            </tbody></table>
            <input type="hidden" id="rh1">
            <input type="hidden" id="rh2">
            <input type="hidden" id="rh3">
            <input type="hidden" id="rh4">
        </div>
        <!--��� ����-->
        <div class="modal-footer">
            <a href="#" class="btn" data-dismiss="modal">�ر�</a>
            <a href="#" class="btn btn-primary" onclick="exportExcel()">����</a>
        </div>
    </div>
    <!--ҳ��ײ�-->
    <footer>
        <p class="pull-left">&copy; <a href="#" target="_blank">BeiJing Bus.</a> 2013</p>
    </footer>
</div>
<!-- JS�ļ�
================================================== -->
<!-- jQuery -->
<script src="js/jquery-1.7.2.min.js"></script>
<!-- jQuery UI -->
<script src="js/jquery-ui-1.8.21.custom.min.js"></script>
<!--ajax��ȡ-->
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
