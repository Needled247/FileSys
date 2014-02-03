package com.gjjt.tool;

import com.gjjt.pojo.ExcelReplaceDataVO;
import com.gjjt.pojo.gj_file_plant;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: HP
 * Date: 13-8-28
 * Time: 上午12:10
 * To change this template use File | Settings | File Templates.
 */
public class FileSysTool {
    /**
     * 发布编码转字符串
     * @param code
     * @return String
     */
    public String code2Str(String code){
        String status = "";
        if(code.equals("0")){
            status = "未发布";
        }
        else if(code.equals("1")){
            status = "已发布";
        }
        return status;
    }

    /**
     * 表名转换
     * @param tbl
     * @return String
     */
    public String tbl2department(String tbl){
        String department = "";
        if(tbl.equals("gj_file_company")){
            department = "分公司发";
        }
        else if(tbl.equals("gj_file_plant")){
            department = "厂发";
        }
        return department;
    }

    public String department2tbl(String department){
        String tbl = "";
        if(department.equals("分公司发")){
            tbl = "gj_file_company";
        }
        else if(department.equals("厂发")){
            tbl = "gj_file_plant";
        }
        return tbl;
    }

    /**
     * 状态码转换
     * @param statusCode
     * @return String
     */
    public String statusChange(String statusCode){
        String status = "";
        if(statusCode.equals("1")){
            status = "已阅读";
        }
        else {
            status = "未阅读";
        }
        return status;
    }

    public String getNow(){
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(date);
    }

    @SuppressWarnings("deprecation")
    public boolean getExcel(String sheetName,OutputStream outputStream,List li){
        boolean flag = false;
        HSSFWorkbook wb = new HSSFWorkbook();
        HSSFSheet sheet1 = wb.createSheet("sheet1");
        HSSFRow row = sheet1.createRow((short)0);
        HSSFCell cell = row.createCell((short)0);
        cell.setCellValue("编号");
        row.createCell((short)1).setCellValue("行政文号");
        row.createCell((short)2).setCellValue("体系文号");
        row.createCell((short)3).setCellValue("来文单位");
        row.createCell((short)4).setCellValue("来文数量");
        row.createCell((short)5).setCellValue("文件名称");
        row.createCell((short)6).setCellValue("附件名称");
        row.createCell((short)7).setCellValue("收文编号");
        row.createCell((short)8).setCellValue("发放范围（复印）");
        row.createCell((short)9).setCellValue("发放范围（红头）");
        row.createCell((short)10).setCellValue("文件类型");
        row.createCell((short)11).setCellValue("发文单位");
        row.createCell((short)12).setCellValue("状态");
        Iterator it = li.iterator();
        int i = 1;
        while (it.hasNext()){
            gj_file_plant bean = (gj_file_plant)it.next();
            row=sheet1.createRow((short)i);
            row.createCell((short)0).setCellValue(i);
            row.createCell((short)1).setCellValue(bean.getXNUM1()+bean.getXNUM2());
            row.createCell((short)2).setCellValue(bean.getTNUM1()+"/"+bean.getTNUM2()+"/"+bean.getTNUM3());
            row.createCell((short)3).setCellValue(bean.getCADDRESS());
            row.createCell((short)4).setCellValue(bean.getQUANTITY());
            row.createCell((short)5).setCellValue(bean.getFILENAME());
            row.createCell((short)6).setCellValue(bean.getFUNAME());
            row.createCell((short)7).setCellValue(bean.getSNUM());
            row.createCell((short)8).setCellValue(bean.getCOPYRANGE());
            row.createCell((short)9).setCellValue(bean.getGRANTRANGE());
            row.createCell((short)10).setCellValue(bean.getFILETYPE());
            row.createCell((short)11).setCellValue(this.tbl2department(bean.getTBL()));
            row.createCell((short)12).setCellValue(this.code2Str(bean.getSTATUS()));
            i++;
        }
        try{
            System.out.println("开始写入Excel");
            outputStream.flush();
            wb.write(outputStream);
            flag = true;
            outputStream.close();
        }
        catch   (IOException e){
            flag = false;
            e.printStackTrace();
        }
        System.out.println( "Excel写入完成");
        return  flag;
    }

    public gj_file_plant Assembly(ResultSet rs){
        gj_file_plant view = null;
        try{
            view = new gj_file_plant();
            view.setID(rs.getInt("ID"));
            view.setXNUM1(rs.getString("XNUM1"));
            view.setXNUM2(rs.getString("XNUM2"));
            view.setTNUM1(rs.getString("TNUM1"));
            view.setTNUM2(rs.getString("TNUM2"));
            view.setTNUM3(rs.getString("TNUM3"));
            view.setCADDRESS(rs.getString("CADDRESS"));
            view.setQUANTITY(rs.getInt("QUANTITY"));
            view.setFILENAME(rs.getString("FILENAME"));
            view.setFUNAME(rs.getString("FUNAME"));
            view.setFILETYPE(rs.getString("FILETYPE"));
            view.setSNUM(rs.getInt("SNUM"));
            view.setCONTROLNUM(rs.getString("CONTROLNUM"));
            view.setHANDOBJ(rs.getString("HANDOBJ"));
            view.setRPERSON(rs.getString("RPERSON"));
            view.setCOPYRANGE(rs.getString("COPYRANGE"));
            view.setGRANTRANGE(rs.getString("GRANTRANGE"));
            view.setCOPYQUANTITY(rs.getString("COPYQUANTITY"));
            view.setISINVALID(rs.getString("ISINVALID"));
            view.setRECQUANTITY(rs.getString("RECQUANTITY"));
            view.setCFILETYPE(rs.getString("CFILETYPE"));
            view.setRHQUANTITY(rs.getInt("RHQUANTITY"));
            view.setATTURL(rs.getString("ATTURL"));
            view.setSENDTIME(rs.getString("SENDTIME"));
            view.setTBL(rs.getString("TBL"));
            view.setSTATUS(rs.getString("STATUS"));
            view.setITIME(rs.getString("ITIME"));
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return view;
    }

    public boolean replaceModel(List<ExcelReplaceDataVO> datas, String sourceFilePath, String targetFilePath) {
        boolean bool = true;
        try {

            POIFSFileSystem fs  =new POIFSFileSystem(new FileInputStream(sourceFilePath));
            HSSFWorkbook wb = new HSSFWorkbook(fs);
            HSSFSheet sheet = wb.getSheetAt(0);

            for (ExcelReplaceDataVO data : datas) {
                //获取单元格内容
                HSSFRow row = sheet.getRow(data.getRow());
                HSSFCell cell = row.getCell((short)data.getColumn());

                //写入单元格内容
                cell.setCellType(HSSFCell.CELL_TYPE_STRING);
                cell.setCellType(HSSFCell.ENCODING_UTF_16);
                cell.setCellValue(data.getValue());
            }

            // 输出文件
            FileOutputStream fileOut = new FileOutputStream(targetFilePath);
            wb.write(fileOut);
            fileOut.close();

        } catch (Exception e) {
            bool = false;
            e.printStackTrace();
        }
        return bool;
    }
}
