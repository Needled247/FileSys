<%@ page import="com.gjjt.dao.FileSysDAOImpl" %>
<%@include file="Validate.jsp"%>
<%@ page import="com.gjjt.pojo.gj_file_plant" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title></title>
    <link id="bs-css" href="css/bootstrap-cerulean.css" rel="stylesheet">
    <style type="text/css">
        .print td{ height:35px; border:#000000 1px solid;}
    </style>
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
</head>
<body>
<div style="text-align: center" class="print" id="toPrint">
    <br>
    <p style="font-size: 25px">文件分发登记表</p>
    <p style="width:90%;text-align: right">页号：</p>
    <table border="1px" cellspacing="0px" style="margin:auto;width:95%;text-align: center;">
        <thead>
            <tr>
                <td style="width: 8%">日期</td>
                <td>行政文号</td>
                <td>体系文号</td>
                <td>发文单位</td>
                <td>件数</td>
                <td>附件</td>
                <td>文件名称</td>
                <td>受控编号</td>
                <td>持有单位/人</td>
                <td>承收人签字</td>
            </tr>
        </thead>
        <tbody style="font-size: 14px">
        <%
            String[] arr = null;
            if(bean!=null){
                arr = bean.getCOPYRANGE().split(",");
            }
            int i = 0;
            for( i=0;i<arr.length;i++){
                if(i==0){
        %>
            <tr>
                <td><%=bean.getSENDTIME()%></td>
                <td><%=bean.getXNUM1()+bean.getXNUM2()%></td>
                <td><%=bean.getTNUM1()+bean.getTNUM2()+bean.getTNUM3()%></td>
                <td><%=arr[i]%></td>
                <td><%=bean.getQUANTITY()%></td>
                <td></td>
                <td><%=bean.getFILENAME()%></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <%
                }
                else {
            %>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td><%=arr[i]%></td>
                <td></td>
                <td></td>
                <td style="text-align: center">”</td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <%
                }
            }
            while (i<15){
            %>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
             <%
                i++;
            }
            %>
        </tbody>
    </table>
</div>
<hr>
<div style="text-align: center">
    <input type="button" onclick="editTable()" value="编辑" style="height: 30px;width: 100px" id="btn_edit">
    <input type="button" onclick="printTbl()" value="打印" style="height: 30px;width: 100px" id="btn_print">
</div>
</body>
<script src="js/jquery-1.7.2.min.js"></script>
<script src="js/jquery.jqprint-0.3.js"></script>
<script src="js/fileSys/toPrint.js"></script>
</html>