<%@include file="Validate.jsp"%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPEhtmlPUBLIC"-//W3C//DTDXHTML1.1//EN"
"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/jquery.handsontable.full.css">
</head>
<body>
<input type="hidden" value="<%=request.getParameter("pid")%>" id="pid">
<input type="hidden" value="<%=request.getParameter("add")%>" id="add">
<div  id="toPrint" style="width:1000px;margin-left: auto;margin-right: auto;text-align: center">
    <br>
    <p style="font-size: 25px">文件分发登记表</p>
    <p style="width:90%;text-align: right">页号：</p>
    <div id="example1" >
    </div>
</div>
<hr>
<div style="text-align: center">
    <input type="button" id="next" value="下一页" style="height: 30px;width: 100px" hidden>
    <input type="button" onclick="printTbl()" value="打印" style="height: 30px;width: 100px" id="btn_print">
</div>
</body>
<script src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery.handsontable.full.js"></script>
<script src="js/jquery.jqprint-0.3.js"></script>
<script src="js/Print.js"></script>
</html>