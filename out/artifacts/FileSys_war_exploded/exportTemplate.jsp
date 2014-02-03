<%@ page import="com.gjjt.pojo.ExcelReplaceDataVO" %>
<%@ page import="com.gjjt.tool.FileSysTool" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String cadd1 = request.getParameter("cadd1");
    String cadd2 = request.getParameter("cadd2");
    String cadd3 = request.getParameter("cadd3");
    String cadd4 = request.getParameter("cadd4");
    String cnum1 = request.getParameter("cnum1");
    String cnum2 = request.getParameter("cnum2");
    String cnum3 = request.getParameter("cnum3");
    String cnum4 = request.getParameter("cnum4");
    String quantity1 = request.getParameter("quantity1");
    String quantity2 = request.getParameter("quantity2");
    String quantity3 = request.getParameter("quantity3");
    String quantity4 = request.getParameter("quantity4");
    String snum1 = request.getParameter("snum1");
    String snum2 = request.getParameter("snum2");
    String snum3 = request.getParameter("snum3");
    String snum4 = request.getParameter("snum4");
    String title1 = request.getParameter("title1");
    String title2 = request.getParameter("title2");
    String title3 = request.getParameter("title3");
    String title4 = request.getParameter("title4");
    String adv1 = request.getParameter("adv1");
    String adv2 = request.getParameter("adv2");
    String adv3 = request.getParameter("adv3");
    String[] date = request.getParameter("sendtime").split("-");
    Date d = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
    String dirStr = sdf.format(d);
    List<ExcelReplaceDataVO> datas = new ArrayList<ExcelReplaceDataVO>();

    ExcelReplaceDataVO vo1 = new ExcelReplaceDataVO();
    //日期
    vo1.setRow(1);
    vo1.setColumn(2);
    vo1.setValue(date[0]);
    datas.add(vo1);
    ExcelReplaceDataVO vo2 = new ExcelReplaceDataVO();
    vo2.setRow(1);
    vo2.setColumn(4);
    vo2.setValue(date[1]);
    datas.add(vo2);
    ExcelReplaceDataVO vo3 = new ExcelReplaceDataVO();
    vo3.setRow(1);
    vo3.setColumn(6);
    vo3.setValue(date[2]);
    datas.add(vo3);
    //收文1
    ExcelReplaceDataVO vo4 = new ExcelReplaceDataVO();
    vo4.setRow(2);
    vo4.setColumn(2);
    vo4.setValue(cadd1);
    datas.add(vo4);
    ExcelReplaceDataVO vo5 = new ExcelReplaceDataVO();
    vo5.setRow(2);
    vo5.setColumn(4);
    vo5.setValue(cnum1);
    datas.add(vo5);
    ExcelReplaceDataVO vo6 = new ExcelReplaceDataVO();
    vo6.setRow(2);
    vo6.setColumn(7);
    vo6.setValue(quantity1);
    datas.add(vo6);
    ExcelReplaceDataVO vo7 = new ExcelReplaceDataVO();
    vo7.setRow(3);
    vo7.setColumn(2);
    vo7.setValue(snum1);
    datas.add(vo7);
    ExcelReplaceDataVO vo8 = new ExcelReplaceDataVO();
    vo8.setRow(3);
    vo8.setColumn(4);
    vo8.setValue(title1);
    datas.add(vo8);
    //收文2
    ExcelReplaceDataVO vo9 = new ExcelReplaceDataVO();
    vo9.setRow(4);
    vo9.setColumn(2);
    vo9.setValue(cadd2);
    datas.add(vo9);
    ExcelReplaceDataVO vo10 = new ExcelReplaceDataVO();
    vo10.setRow(4);
    vo10.setColumn(4);
    vo10.setValue(cnum2);
    datas.add(vo10);
    ExcelReplaceDataVO vo11 = new ExcelReplaceDataVO();
    vo11.setRow(4);
    vo11.setColumn(7);
    vo11.setValue(quantity2);
    datas.add(vo11);
    ExcelReplaceDataVO vo12 = new ExcelReplaceDataVO();
    vo12.setRow(5);
    vo12.setColumn(2);
    vo12.setValue(snum2);
    datas.add(vo12);
    ExcelReplaceDataVO vo13 = new ExcelReplaceDataVO();
    vo13.setRow(5);
    vo13.setColumn(4);
    vo13.setValue(title2);
    datas.add(vo13);
    //收文3
    ExcelReplaceDataVO vo14 = new ExcelReplaceDataVO();
    vo14.setRow(6);
    vo14.setColumn(2);
    vo14.setValue(cadd3);
    datas.add(vo14);
    ExcelReplaceDataVO vo15 = new ExcelReplaceDataVO();
    vo15.setRow(6);
    vo15.setColumn(4);
    vo15.setValue(cnum3);
    datas.add(vo15);
    ExcelReplaceDataVO vo16 = new ExcelReplaceDataVO();
    vo16.setRow(6);
    vo16.setColumn(7);
    vo16.setValue(quantity3);
    datas.add(vo16);
    ExcelReplaceDataVO vo17 = new ExcelReplaceDataVO();
    vo17.setRow(7);
    vo17.setColumn(2);
    vo17.setValue(snum3);
    datas.add(vo17);
    ExcelReplaceDataVO vo18 = new ExcelReplaceDataVO();
    vo18.setRow(7);
    vo18.setColumn(4);
    vo18.setValue(title3);
    datas.add(vo18);
    //收文4
    ExcelReplaceDataVO vo19 = new ExcelReplaceDataVO();
    vo19.setRow(8);
    vo19.setColumn(2);
    vo19.setValue(cadd4);
    datas.add(vo19);
    ExcelReplaceDataVO vo20 = new ExcelReplaceDataVO();
    vo20.setRow(8);
    vo20.setColumn(4);
    vo20.setValue(cnum4);
    datas.add(vo20);
    ExcelReplaceDataVO vo21 = new ExcelReplaceDataVO();
    vo21.setRow(8);
    vo21.setColumn(7);
    vo21.setValue(quantity4);
    datas.add(vo21);
    ExcelReplaceDataVO vo22 = new ExcelReplaceDataVO();
    vo22.setRow(9);
    vo22.setColumn(2);
    vo22.setValue(snum4);
    datas.add(vo22);
    ExcelReplaceDataVO vo23 = new ExcelReplaceDataVO();
    vo23.setRow(9);
    vo23.setColumn(4);
    vo23.setValue(title4);
    datas.add(vo23);
    /*
    //领导批示
    vo1.setRow(10);
    vo1.setColumn(1);
    vo1.setValue(adv1);
    datas.add(vo1);
    //主管领导批示
    vo1.setRow(15);
    vo1.setColumn(1);
    vo1.setValue(adv2);
    datas.add(vo1);
    */
    //拟办意见
    ExcelReplaceDataVO vo24 = new ExcelReplaceDataVO();
    vo24.setRow(19);
    vo24.setColumn(1);
    vo24.setValue(adv3);
    datas.add(vo24);
    //拟办意见日期
    ExcelReplaceDataVO vo25 = new ExcelReplaceDataVO();
    vo25.setRow(22);
    vo25.setColumn(1);
    vo25.setValue(date[0]+"年"+date[1]+"月"+date[2]+"日");
    datas.add(vo25);

    String path=application.getRealPath(request.getRequestURI());
    String dir=new File(path).getParent();
    dir += "\\module\\";
    new FileSysTool().replaceModel(datas, dir + "sw.xls", dir + dirStr+".xls");
    PrintWriter pw = response.getWriter();
    pw.print(dirStr+".xls");
    pw.flush();
    pw.close();
%>