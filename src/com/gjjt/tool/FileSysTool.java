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
 * Time: ����12:10
 * To change this template use File | Settings | File Templates.
 */
public class FileSysTool {
    /**
     * ��������ת�ַ���
     * @param code
     * @return String
     */
    public String code2Str(String code){
        String status = "";
        if(code.equals("0")){
            status = "δ����";
        }
        else if(code.equals("1")){
            status = "�ѷ���";
        }
        return status;
    }

    /**
     * ����ת��
     * @param tbl
     * @return String
     */
    public String tbl2department(String tbl){
        String department = "";
        if(tbl.equals("gj_file_company")){
            department = "�ֹ�˾��";
        }
        else if(tbl.equals("gj_file_plant")){
            department = "����";
        }
        return department;
    }

    public String department2tbl(String department){
        String tbl = "";
        if(department.equals("�ֹ�˾��")){
            tbl = "gj_file_company";
        }
        else if(department.equals("����")){
            tbl = "gj_file_plant";
        }
        return tbl;
    }

    /**
     * ״̬��ת��
     * @param statusCode
     * @return String
     */
    public String statusChange(String statusCode){
        String status = "";
        if(statusCode.equals("1")){
            status = "���Ķ�";
        }
        else {
            status = "δ�Ķ�";
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
        cell.setCellValue("���");
        row.createCell((short)1).setCellValue("�����ĺ�");
        row.createCell((short)2).setCellValue("��ϵ�ĺ�");
        row.createCell((short)3).setCellValue("���ĵ�λ");
        row.createCell((short)4).setCellValue("��������");
        row.createCell((short)5).setCellValue("�ļ�����");
        row.createCell((short)6).setCellValue("��������");
        row.createCell((short)7).setCellValue("���ı��");
        row.createCell((short)8).setCellValue("���ŷ�Χ����ӡ��");
        row.createCell((short)9).setCellValue("���ŷ�Χ����ͷ��");
        row.createCell((short)10).setCellValue("�ļ�����");
        row.createCell((short)11).setCellValue("���ĵ�λ");
        row.createCell((short)12).setCellValue("״̬");
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
            System.out.println("��ʼд��Excel");
            outputStream.flush();
            wb.write(outputStream);
            flag = true;
            outputStream.close();
        }
        catch   (IOException e){
            flag = false;
            e.printStackTrace();
        }
        System.out.println( "Excelд�����");
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
                //��ȡ��Ԫ������
                HSSFRow row = sheet.getRow(data.getRow());
                HSSFCell cell = row.getCell((short)data.getColumn());

                //д�뵥Ԫ������
                cell.setCellType(HSSFCell.CELL_TYPE_STRING);
                cell.setCellType(HSSFCell.ENCODING_UTF_16);
                cell.setCellValue(data.getValue());
            }

            // ����ļ�
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
