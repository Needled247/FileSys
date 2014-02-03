<%@ page import="com.gjjt.pojo.ExcelReplaceDataVO" %>
<%@ page import="com.gjjt.pojo.gj_file_plant" %>
<%@ page import="com.gjjt.tool.FileSysTool" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page import="java.io.File" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    }
    Date d = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
    String dirStr = sdf.format(d);
    List<ExcelReplaceDataVO> datas = new ArrayList<ExcelReplaceDataVO>();
    String[] arr = null;
    String[] rharr = null;
    if(bean!=null){
        arr = bean.getCOPYRANGE().split(",");
        rharr = bean.getGRANTRANGE().split(",");
    }

    //日期
    ExcelReplaceDataVO vo1 = new ExcelReplaceDataVO();
    vo1.setRow(4);
    vo1.setColumn(0);
    vo1.setValue(bean.getSENDTIME().substring(bean.getSENDTIME().indexOf("-")+1,bean.getSENDTIME().length()).replace("-","."));
    datas.add(vo1);
    //行政文号
    ExcelReplaceDataVO vo2 = new ExcelReplaceDataVO();
    vo2.setRow(4);
    vo2.setColumn(1);
    vo2.setValue(bean.getXNUM1()+bean.getXNUM2());
    datas.add(vo2);
    //体系文号
    ExcelReplaceDataVO vo3 = new ExcelReplaceDataVO();
    vo3.setRow(4);
    vo3.setColumn(2);
    vo3.setValue(bean.getTNUM1()+bean.getTNUM2()+bean.getTNUM3());
    datas.add(vo3);
    //文件名称
    ExcelReplaceDataVO vo4 = new ExcelReplaceDataVO();
    vo4.setRow(4);
    vo4.setColumn(6);
    vo4.setValue(bean.getFILENAME());
    datas.add(vo4);
    //数量
    ExcelReplaceDataVO vo5 = new ExcelReplaceDataVO();
    vo5.setRow(4);
    vo5.setColumn(4);
    vo5.setValue(bean.getQUANTITY()+bean.getRHQUANTITY()+"");
    datas.add(vo5);
    //发文单位
    int mark = 0;
    for(int i=0;i<arr.length;i++){
        ExcelReplaceDataVO vo = new ExcelReplaceDataVO();
        mark = 4+i;
        vo.setRow(mark);
        vo.setColumn(3);
        vo.setValue(arr[i]);
        datas.add(vo);
    }
    for(int i=0;i<rharr.length;i++){
        ExcelReplaceDataVO vo = new ExcelReplaceDataVO();
        vo.setRow(mark+1+i);
        vo.setColumn(3);
        vo.setValue(rharr[i]);
        datas.add(vo);
    }
    //引号
    for(int x=0;x<arr.length+rharr.length-1;x++){
        ExcelReplaceDataVO pvo = new ExcelReplaceDataVO();
        pvo.setRow(5+x);
        pvo.setColumn(6);
        pvo.setValue("\"");
        datas.add(pvo);
    }

    String path=application.getRealPath(request.getRequestURI());
    String dir=new File(path).getParent();
    dir += "\\module\\";
    if(new FileSysTool().replaceModel(datas, dir + "ff.xls", dir + dirStr+".xls")){
        response.sendRedirect("download.jsp?filename="+dirStr+".xls");
    }
%>