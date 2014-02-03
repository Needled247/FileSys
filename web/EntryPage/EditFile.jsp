<%@page language="java" pageEncoding="GBK" %>
<%@include file="EntryValidate.jsp"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<s:action name="getPrefixAction" id="getPrefixAction" namespace="/"/>
<%@ page import="com.gjjt.dao.FileSysDAOImpl" %>
<%@ page import="com.gjjt.pojo.gj_file_plant" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="GBK">
    <title>�ļ��İ����ϵͳ</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- ��ʽ�� -->
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
    <!-- HTML5����IE -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <!-- The fav icon -->
    <link rel="shortcut icon" href="img/favicon.ico">
</head>
<body>
<!-- ������ʾ -->
<%@include file="EntryHead.jsp"%>
<div class="container-fluid">
    <div class="row-fluid">
        <!--���˵�-->
        <%@include file="EntryMenu.jsp"%>
        <%
            String pid = request.getParameter("pid");
            String add = request.getParameter("add");
            List li = new ArrayList();
            ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-config.xml");
            gj_file_plant plant = ctx.getBean("gj_file_plant",gj_file_plant.class);
            li = plant.SearchFileInfoById(pid,add);
            Iterator it = li.iterator();
            gj_file_plant bean = null;
            while(it.hasNext()){
                bean = (gj_file_plant)it.next();
                request.setAttribute("bean",bean);
            }
        %>
        <div id="content" class="span10">
            <!-- ���������� -->
            <div>
                <ul class="breadcrumb">
                    <li>
                        <a href="#">���Ĺ���</a> <span class="divider">/</span>
                    </li>
                    <li>
                        <a href="#">�鿴/�༭�ļ�</a>
                    </li>
                </ul>
            </div>
            <div class="row-fluid sortable ui-sortable">
                <div class="box span12" style="">
                    <div class="box-header well" data-original-title="">
                        <h2><i class="icon-edit"></i>�ļ���ϸ��Ϣ</h2>
                    </div>
                    <div class="box-content">
                            <fieldset>
                                <legend><%=add%>�ļ�</legend>
                                <input type="hidden" value="<%=add%>" id="add">
                                <input type="hidden" value="<%=pid%>" id="pid">
                                <div class="control-group">
                                    <label class="control-label" for="sendTime">�������ڣ�</label>
                                    <div class="controls">
                                        <input class="input-xlarge focused datepicker" style="width: 15%" id="sendTime" name="sendTime" type="text" value="<%=bean.getSENDTIME()%>">
                                        <span class="help-inline red" id="sendTimeErr"></span>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="xnum1">�����ĺţ�</label>
                                    <div class="controls">
                                        <s:select list="#getPrefixAction.xnumMap" id="xnum1" name="xnum1" headerValue="--��ѡ��--" headerKey="" value="%{#request.bean.XNUM1}" listkey="key" listvalue="value" cssStyle="width: 10%"/>
                                        <input class="input-xlarge focused" id="xnum2" name="xnum2" type="text" style="width: 10%" value="<%=bean.getXNUM2()%>">
                                        <span class="help-inline red" id="xnumErr"></span>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="tnum1">��ϵ�ĺţ�</label>
                                    <div class="controls">
                                        <s:select list="#getPrefixAction.tnum1Map" id="tnum1" name="tnum1" headerValue="--��ѡ��--" headerKey="" value="%{#request.bean.TNUM1}" listkey="key" listvalue="value" cssStyle="width: 10%"/>
                                        <s:select list="#getPrefixAction.tnum2Map" id="tnum2" name="tnum2" headerValue="--��ѡ��--" headerKey="" value="%{#request.bean.TNUM2}" listkey="key" listvalue="value" cssStyle="width: 10%"/>
                                        <input class="input-xlarge focused" id="tnum3" name="tnum3" type="text" style="width: 10%" value="<%=bean.getTNUM3()%>">
                                        <span class="help-inline red" id="tnumErr"></span>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="caddress">���ĵ�λ��</label>
                                    <div class="controls">
                                        <s:select list="#getPrefixAction.caddMap" id="caddress" name="caddress" value="%{#request.bean.CADDRESS}" listkey="key" listvalue="value" cssStyle="width: 15%"/>
                                        <span class="help-inline red" id="caddressErr"></span>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="quantity">������</label>
                                    <div class="controls">
                                        <input class="input-xlarge focused" id="quantity" name="quantity" type="text" style="width: 8%" value="<%=bean.getQUANTITY()%>">
                                        <span class="help-inline red" id="quantityErr"></span>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="rhquantity">��ͷ������</label>
                                    <div class="controls">
                                        <input class="input-xlarge focused" id="rhquantity" name="rhquantity" type="text" style="width: 8%" value="<%=bean.getRHQUANTITY()%>">
                                        <span class="help-inline red" id="rhquantityErr"></span>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="filename">�ļ����ƣ�</label>
                                    <div class="controls">
                                        <input class="input-xlarge focused" id="filename" name="filename" type="text" value="<%=bean.getFILENAME()%>">
                                        <span class="help-inline red" id="filenameErr"></span>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="funame">�������ƣ�</label>
                                    <div class="controls">
                                        <input class="input-xlarge focused" id="funame" name="funame" type="text" value="<%=bean.getFUNAME()%>">
                                        <span class="help-inline red" id="funameErr"></span>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="filetype">�ļ����ͣ�</label>
                                    <div class="controls">
                                        <s:select list="#getPrefixAction.fileTypeMap" id="filetype" name="filetype" value="%{#request.bean.FILETYPE}" listkey="key" listvalue="value" cssStyle="width: 10%"/>
                                        <span class="help-inline red" id="filetypeErr"></span>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="snum">���ĺţ�</label>
                                    <div class="controls">
                                        <input class="input-xlarge focused" id="snum" name="snum" type="text" style="width: 8%" value="<%=bean.getSNUM()%>">
                                        <span class="help-inline red" id="snumErr"></span>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="copyrange">���ķ�Χ����ӡ����</label>
                                    <div class="controls">
                                        <s:select list="#getPrefixAction.copyRangeMap" name="copyrange"  multiple="true" data-rel="chosen" id="copyrange" headerKey="0" listkey="key" listvalue="value" />
                                        <span class="help-inline red" id="copyrangeErr"></span>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="grantrange">���ŷ�Χ����ͷ����</label>
                                    <div class="controls">
                                        <!--TODO-->
                                        <s:select list="#getPrefixAction.grantRangeMap" name="grantrange"  multiple="true" data-rel="chosen" id="grantrange" headerKey="0" listkey="key" listvalue="value" />
                                        <span class="help-inline red" id="grantrangeErr"></span>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="ctype">�������ͣ�</label>
                                    <div class="controls">
                                        <s:select list="#getPrefixAction.ctypeMap" id="ctype" name="ctype" value="%{#request.bean.CFILETYPE}" listkey="key" listvalue="value" cssStyle="width: 10%"/>
                                        <input type="hidden" id="attr" value="<%=bean.getATTURL()%>">
                                        <span class="help-inline red" id="ctypeErr"></span>
                                    </div>
                                </div>
                                <div class="form-actions">
                                    <button type="button" class="btn btn-success" onclick="saveFile()" id="btn_save">
                                        <i class="icon-ok icon-white"></i>����</button>
                                    <button type="reset" class="btn btn-primary" id="btn_back">
                                        <i class="icon-chevron-left icon-white"></i>����</button>
                                </div>
                            </fieldset>
                    </div>
                </div>
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
<!--��֤-->
<script src="js/EditFile.js"></script>
<!--select ��ѡĬ��ֵ-->
<script type="text/javascript">
    $(function(){
        var copyrangeList = '<%=bean.getCOPYRANGE()%>';
        var grantrangeList = '<%=bean.getGRANTRANGE()%>';
        var copyrange = copyrangeList.split(',');
        var grantrange = grantrangeList.split(',');
        var copyObj = document.getElementById("copyrange");
        var grantObj = document.getElementById("grantrange");
        var copyLen = copyObj.options.length;
        var grantLen = grantObj.options.length;
        for(var i=0;i<copyLen;i++){
            for(var j=0;j<copyrange.length;j++){
                if(copyObj.options[i].value ==copyrange[j].trim()){
                    copyObj.options[i].selected = true;
                }
            }
        }

        for(var z=0;z<grantLen;z++){
            for(var x=0;x<grantrange.length;x++){
                if(grantObj.options[z].value ==grantrange[x].trim()){
                    grantObj.options[z].selected = true;
                }
            }
        }
    })
</script>
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
