package com.gjjt.dao;

import com.gjjt.pojo.*;
import com.gjjt.tool.FileSysTool;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.RowMapper;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: HP
 * Date: 13-7-7
 * Time: 下午10:35
 * To change this template use File | Settings | File Templates.
 */
public class FileSysDAOImpl implements FileSysDAO {
    private JdbcTemplate jdbcTemplate;
    private FileSysTool tool;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    /**
     * 功能：登陆验证
     * Spring DEMO.
     * @param user
     * @return List
     */
    @Override
    public List loginCheck(final gj_User user) {
        final List li = new ArrayList();
        String sql = "SELECT * FROM gj_User WHERE userid=? AND userpass=PASSWORD(?)";
        jdbcTemplate.query(sql,new PreparedStatementSetter() {
                    @Override
                    public void setValues(PreparedStatement pstmt) throws SQLException {
                        pstmt.setString(1,user.getUserid());
                        pstmt.setString(2,user.getUserpass());
                    }
                },new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet resultSet) throws SQLException {
                gj_User user = new gj_User();
                user.setId(resultSet.getInt("id"));
                user.setUserid(resultSet.getString("userid"));
                user.setUserpass(resultSet.getString("userpass"));
                user.setUsername(resultSet.getString("username"));
                user.setLevel(resultSet.getString("level"));
                user.setDepartment(resultSet.getString("department"));
                li.add(user);
            }
        });
        return li;
    }

    /**
     * 发布公司文件
     * @param newFile
     * @return boolean
     */
    @Override
    public boolean newCompanyArticle(final gj_file_company newFile) {
        boolean flag = false;
        final String sql =
                "INSERT INTO gj_file_company(" +
                "XNUM1,XNUM2,TNUM1,TNUM2,TNUM3,CADDRESS," +
                "QUANTITY,FILENAME,FUNAME,FILETYPE,SNUM," +
                "CONTROLNUM,HANDOBJ,RPERSON,COPYRANGE," +
                "GRANTRANGE,COPYQUANTITY,ISINVALID,RECQUANTITY," +
                "CFILETYPE,RHQUANTITY,ATTURL,SENDTIME,TBL,STATUS,ITIME)" +
                "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
        int fixed = jdbcTemplate.update(sql,new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement pstmt) throws SQLException {
                pstmt.setString(1,newFile.getXNUM1());
                pstmt.setString(2,newFile.getXNUM2());
                pstmt.setString(3,newFile.getTNUM1());
                pstmt.setString(4,newFile.getTNUM2());
                pstmt.setString(5,newFile.getTNUM3());
                pstmt.setString(6,newFile.getCADDRESS());
                pstmt.setInt(7,newFile.getQUANTITY());
                pstmt.setString(8,newFile.getFILENAME());
                pstmt.setString(9,newFile.getFUNAME());
                pstmt.setString(10,newFile.getFILETYPE());
                pstmt.setInt(11,newFile.getSNUM());
                pstmt.setString(12,newFile.getCONTROLNUM());
                pstmt.setString(13,newFile.getHANDOBJ());
                pstmt.setString(14,newFile.getRPERSON());
                pstmt.setString(15,newFile.getCOPYRANGE());
                pstmt.setString(16,newFile.getGRANTRANGE());
                pstmt.setString(17,newFile.getCOPYQUANTITY());
                pstmt.setString(18,newFile.getISINVALID());
                pstmt.setString(19,newFile.getRECQUANTITY());
                pstmt.setString(20,newFile.getCFILETYPE());
                pstmt.setInt(21,newFile.getRHQUANTITY());
                pstmt.setString(22,newFile.getATTURL());
                pstmt.setString(23,newFile.getSENDTIME());
                pstmt.setString(24,newFile.getTBL());
                pstmt.setString(25,newFile.getSTATUS());
                pstmt.setString(26,newFile.getITIME());
            }
        });
        if(fixed>0){
            flag = true;
        }
        return flag;
    }

    /**
     * 发布厂文件
     * @param newFile
     * @return boolean
     */
    @Override
    public boolean newPlantArticle(final gj_file_plant newFile) {
        boolean flag = false;
        final String sql =
                "INSERT INTO gj_file_plant(" +
                        "XNUM1,XNUM2,TNUM1,TNUM2,TNUM3,CADDRESS," +
                        "QUANTITY,FILENAME,FUNAME,FILETYPE,SNUM," +
                        "CONTROLNUM,HANDOBJ,RPERSON,COPYRANGE," +
                        "GRANTRANGE,COPYQUANTITY,ISINVALID,RECQUANTITY," +
                        "CFILETYPE,RHQUANTITY,ATTURL,SENDTIME,TBL,STATUS,ITIME)" +
                        "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
        int fixed = jdbcTemplate.update(sql,new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement pstmt) throws SQLException {
                pstmt.setString(1,newFile.getXNUM1());
                pstmt.setString(2,newFile.getXNUM2());
                pstmt.setString(3,newFile.getTNUM1());
                pstmt.setString(4,newFile.getTNUM2());
                pstmt.setString(5,newFile.getTNUM3());
                pstmt.setString(6,newFile.getCADDRESS());
                pstmt.setInt(7,newFile.getQUANTITY());
                pstmt.setString(8,newFile.getFILENAME());
                pstmt.setString(9,newFile.getFUNAME());
                pstmt.setString(10,newFile.getFILETYPE());
                pstmt.setInt(11,newFile.getSNUM());
                pstmt.setString(12,newFile.getCONTROLNUM());
                pstmt.setString(13,newFile.getHANDOBJ());
                pstmt.setString(14,newFile.getRPERSON());
                pstmt.setString(15,newFile.getCOPYRANGE());
                pstmt.setString(16,newFile.getGRANTRANGE());
                pstmt.setString(17,newFile.getCOPYQUANTITY());
                pstmt.setString(18,newFile.getISINVALID());
                pstmt.setString(19,newFile.getRECQUANTITY());
                pstmt.setString(20,newFile.getCFILETYPE());
                pstmt.setInt(21,newFile.getRHQUANTITY());
                pstmt.setString(22,newFile.getATTURL());
                pstmt.setString(23,newFile.getSENDTIME());
                pstmt.setString(24,newFile.getTBL());
                pstmt.setString(25,newFile.getSTATUS());
                pstmt.setString(26,newFile.getITIME());
            }
        });
        if(fixed>0){
            flag = true;
        }
        return flag;
    }

    @Override
    public List getXnumPrefix() {
        final List li = new ArrayList<xnum_fix>();
        String sql = "SELECT * FROM xnum_fix";
        jdbcTemplate.query(sql,new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet resultSet) throws SQLException {
                xnum_fix fix = new xnum_fix();
                fix.setID(resultSet.getInt("id"));
                fix.setKEY(resultSet.getString("key"));
                fix.setVALUE(resultSet.getString("value"));
                li.add(fix);
            }
        });
        return li;
    }

    @Override
    public List getTnumPrefixFirst() {
        final List li = new ArrayList<tnum_fix_first>();
        String sql = "SELECT * FROM tnum_fix_first";
        jdbcTemplate.query(sql,new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet resultSet) throws SQLException {
                tnum_fix_first fix = new tnum_fix_first();
                fix.setID(resultSet.getInt("id"));
                fix.setKEY(resultSet.getString("key"));
                fix.setVALUE(resultSet.getString("value"));
                li.add(fix);
            }
        });
        return li;
    }

    @Override
    public List getTnumPrefixSecond() {
        final List li = new ArrayList<tnum_fix_second>();
        String sql = "SELECT * FROM tnum_fix_second";
        jdbcTemplate.query(sql,new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet resultSet) throws SQLException {
                tnum_fix_second fix = new tnum_fix_second();
                fix.setID(resultSet.getInt("id"));
                fix.setKEY(resultSet.getString("key"));
                fix.setVALUE(resultSet.getString("value"));
                li.add(fix);
            }
        });
        return li;
    }

    @Override
    public List getCaddress() {
        final List li = new ArrayList<caddress>();
        String sql = "SELECT * FROM caddress";
        jdbcTemplate.query(sql,new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet resultSet) throws SQLException {
                caddress fix = new caddress();
                fix.setID(resultSet.getInt("id"));
                fix.setKEY(resultSet.getString("key"));
                fix.setVALUE(resultSet.getString("value"));
                li.add(fix);
            }
        });
        return li;
    }

    @Override
    public List getFileType() {
        final List li = new ArrayList<file_type>();
        String sql = "SELECT * FROM file_type";
        jdbcTemplate.query(sql,new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet resultSet) throws SQLException {
                file_type fix = new file_type();
                fix.setID(resultSet.getInt("id"));
                fix.setKEY(resultSet.getString("key"));
                fix.setVALUE(resultSet.getString("value"));
                li.add(fix);
            }
        });
        return li;
    }

    /**
     * 获取发文范围前缀（复印）
     * @return List
     */
    @Override
    public List getCopyRange() {
        final List li = new ArrayList<copy_range>();
        String sql = "SELECT * FROM copy_range";
        jdbcTemplate.query(sql,new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet resultSet) throws SQLException {
                copy_range fix = new copy_range();
                fix.setID(resultSet.getInt("id"));
                fix.setKEY(resultSet.getString("key"));
                fix.setVALUE(resultSet.getString("value"));
                li.add(fix);
            }
        });
        return li;
    }

    /**
     * 获取发放范围前缀（红头）
     * @return List
     */
    @Override
    public List getGrantRange() {
        final List li = new ArrayList<grant_range>();
        String sql = "SELECT * FROM grant_range";
        jdbcTemplate.query(sql,new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet resultSet) throws SQLException {
                grant_range fix = new grant_range();
                fix.setID(resultSet.getInt("id"));
                fix.setKEY(resultSet.getString("key"));
                fix.setVALUE(resultSet.getString("value"));
                li.add(fix);
            }
        });
        return li;
    }

    @Override
    public List getCtype() {
        final List li = new ArrayList<ctype>();
        String sql = "SELECT * FROM ctype";
        jdbcTemplate.query(sql,new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet resultSet) throws SQLException {
                ctype fix = new ctype();
                fix.setID(resultSet.getInt("id"));
                fix.setKEY(resultSet.getString("key"));
                fix.setVALUE(resultSet.getString("value"));
                li.add(fix);
            }
        });
        return li;
    }

    @Override
    public List getReleasedFile() {
        final List li = new ArrayList();
        String sql = "SELECT * FROM gj_file_view";
        jdbcTemplate.query(sql,new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet rs) throws SQLException {
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
                li.add(view);
            }
        });
        return li;
    }

    public List getAllFile(){
        final List li = new ArrayList();
        String sql = "SELECT * FROM gj_file_view";
        jdbcTemplate.query(sql,new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet rs) throws SQLException {
                gj_file_plant view = new gj_file_plant();
                view.setXNUM1(rs.getString("XNUM1"));
                view.setXNUM2(rs.getString("XNUM2"));
                view.setTNUM1(rs.getString("TNUM1"));
                view.setTNUM2(rs.getString("TNUM2"));
                view.setTNUM3(rs.getString("TNUM3"));
                view.setCADDRESS(rs.getString("CADDRESS"));
                view.setQUANTITY(rs.getInt("QUANTITY"));
                view.setRHQUANTITY(rs.getInt("RHQUANTITY"));
                view.setFILENAME(rs.getString("FILENAME"));
                view.setFUNAME(rs.getString("FUNAME"));
                view.setFILETYPE(rs.getString("FILETYPE"));
                view.setSNUM(rs.getInt("SNUM"));
                view.setCOPYRANGE(rs.getString("COPYRANGE"));
                view.setGRANTRANGE(rs.getString("GRANTRANGE"));
                view.setCFILETYPE(rs.getString("CFILETYPE"));
                view.setSENDTIME(rs.getString("SENDTIME"));
                view.setTBL(rs.getString("TBL"));
                view.setSTATUS(rs.getString("STATUS"));
                li.add(view);
            }
        });
        return li;
    }

    @Override
    public List SearchFileByDate(final String date, String comp) {
        final List li = new ArrayList();
        String sql = "SELECT * FROM "+comp+" WHERE SENDTIME=?";
        jdbcTemplate.query(sql,new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement pstmt) throws SQLException {
                pstmt.setString(1,date);
            }
        },new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet rs) throws SQLException {
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
                li.add(view);
            }
        });
        return li;
    }

    @Override
    public List SearchFileByName(String fileName) {
        final List li = new ArrayList();
        String sql = "SELECT * FROM gj_file_view WHERE FILENAME LIKE '%"+fileName+"%'";
        jdbcTemplate.query(sql,new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet rs) throws SQLException {
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
                li.add(view);
            }
        });
        return li;
    }

    @Override
    public List SearchFileInfoById(String id, String add) {
        final List li = new ArrayList();
        String sql = "";
        if(add!=null){
            if(add.length()==4){
                sql = "select * from gj_file_company where id="+Integer.parseInt(id);
            }
            if(add.length()==2){
                sql = "select * from gj_file_plant where id="+Integer.parseInt(id);
            }
        }
        jdbcTemplate.query(sql,new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet rs) throws SQLException {
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
                li.add(view);
            }
        });
        return li;
    }

    //TODO
    @Override
    public boolean EditPlantFileInfo(final gj_file_plant plant) {
        boolean flag = false;
        String sql = "UPDATE gj_file_plant SET " +
                "XNUM1=?,XNUM2=?,TNUM1=?,TNUM2=?," +
                "TNUM3=?,CADDRESS=?,QUANTITY=?," +
                "FILENAME=?,FUNAME=?,FILETYPE=?,SNUM=?," +
                "CONTROLNUM=?,HANDOBJ=?,RPERSON=?," +
                "COPYRANGE=?,GRANTRANGE=?,COPYQUANTITY=?," +
                "ISINVALID=?,RECQUANTITY=?,CFILETYPE=?,RHQUANTITY=?," +
                "ATTURL=?,SENDTIME=?,TBL=?,STATUS=?,ITIME=? " +
                "WHERE ID=?";
        int fixed = jdbcTemplate.update(sql,new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement pstmt) throws SQLException {
                pstmt.setString(1,plant.getXNUM1());
                pstmt.setString(2,plant.getXNUM2());
                pstmt.setString(3,plant.getTNUM1());
                pstmt.setString(4,plant.getTNUM2());
                pstmt.setString(5,plant.getTNUM3());
                pstmt.setString(6,plant.getCADDRESS());
                pstmt.setInt(7,plant.getQUANTITY());
                pstmt.setString(8,plant.getFILENAME());
                pstmt.setString(9,plant.getFUNAME());
                pstmt.setString(10,plant.getFILETYPE());
                pstmt.setInt(11,plant.getSNUM());
                pstmt.setString(12,plant.getCONTROLNUM());
                pstmt.setString(13,plant.getHANDOBJ());
                pstmt.setString(14,plant.getRPERSON());
                pstmt.setString(15,plant.getCOPYRANGE());
                pstmt.setString(16,plant.getGRANTRANGE());
                pstmt.setString(17,plant.getCOPYQUANTITY());
                pstmt.setString(18,plant.getISINVALID());
                pstmt.setString(19,plant.getRECQUANTITY());
                pstmt.setString(20,plant.getCFILETYPE());
                pstmt.setInt(21,plant.getRHQUANTITY());
                pstmt.setString(22,plant.getATTURL());
                pstmt.setString(23,plant.getSENDTIME());
                pstmt.setString(24,plant.getTBL());
                pstmt.setString(25,plant.getSTATUS());
                pstmt.setString(26,plant.getITIME());
                pstmt.setInt(27,plant.getID());
            }
        });
        if(fixed>0){
            flag = true;
        }
        return flag;
    }

    @Override
    public boolean EditCompFileInfo(final gj_file_company comp) {
        boolean flag = false;
        String sql = "UPDATE gj_file_company SET " +
                "XNUM1=?,XNUM2=?,TNUM1=?,TNUM2=?," +
                "TNUM3=?,CADDRESS=?,QUANTITY=?," +
                "FILENAME=?,FUNAME=?,FILETYPE=?,SNUM=?," +
                "CONTROLNUM=?,HANDOBJ=?,RPERSON=?," +
                "COPYRANGE=?,GRANTRANGE=?,COPYQUANTITY=?," +
                "ISINVALID=?,RECQUANTITY=?,CFILETYPE=?,RHQUANTITY=?," +
                "ATTURL=?,SENDTIME=?,TBL=?,STATUS=?,ITIME=? " +
                "WHERE ID=?";
        int fixed = jdbcTemplate.update(sql,new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement pstmt) throws SQLException {
                pstmt.setString(1,comp.getXNUM1());
                pstmt.setString(2,comp.getXNUM2());
                pstmt.setString(3,comp.getTNUM1());
                pstmt.setString(4,comp.getTNUM2());
                pstmt.setString(5,comp.getTNUM3());
                pstmt.setString(6,comp.getCADDRESS());
                pstmt.setInt(7,comp.getQUANTITY());
                pstmt.setString(8,comp.getFILENAME());
                pstmt.setString(9,comp.getFUNAME());
                pstmt.setString(10,comp.getFILETYPE());
                pstmt.setInt(11,comp.getSNUM());
                pstmt.setString(12,comp.getCONTROLNUM());
                pstmt.setString(13,comp.getHANDOBJ());
                pstmt.setString(14,comp.getRPERSON());
                pstmt.setString(15,comp.getCOPYRANGE());
                pstmt.setString(16,comp.getGRANTRANGE());
                pstmt.setString(17,comp.getCOPYQUANTITY());
                pstmt.setString(18,comp.getISINVALID());
                pstmt.setString(19,comp.getRECQUANTITY());
                pstmt.setString(20,comp.getCFILETYPE());
                pstmt.setInt(21,comp.getRHQUANTITY());
                pstmt.setString(22,comp.getATTURL());
                pstmt.setString(23,comp.getSENDTIME());
                pstmt.setString(24,comp.getTBL());
                pstmt.setString(25,comp.getSTATUS());
                pstmt.setString(26,comp.getITIME());
                pstmt.setInt(27,comp.getID());
            }
        });
        System.out.println(sql);
        if(fixed>0){
            flag = true;
        }
        return flag;
    }

    @Override
    public boolean DelPlantFileInfo(final gj_file_plant plant) {
        boolean flag = false;
        String sql = "DELETE FROM gj_file_plant WHERE ID=?";
        int fixed = jdbcTemplate.update(sql,new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement pstmt) throws SQLException {
                pstmt.setInt(1,plant.getID());
            }
        });
        if(fixed>0){
            flag = true;
        }
        return flag;
    }

    @Override
    public boolean DelCompFileInfo(final gj_file_company comp) {
        boolean flag = false;
        String sql = "DELETE FROM gj_file_company WHERE ID=?";
        int fixed = jdbcTemplate.update(sql,new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement pstmt) throws SQLException {
                pstmt.setInt(1,comp.getID());
            }
        });
        if(fixed>0){
            flag = true;
        }
        return flag;
    }

    @Override
    public boolean InsertSendInfo(final gj_send_info info) {
        boolean flag = false;
        String sql = "INSERT INTO gj_send_info(" +
                "SENDID,DEPARTMENT,TBL,ISCHECK,CHECKPERSON)" +
                "VALUES(?,?,?,?,?);";
        int fixed = jdbcTemplate.update(sql,new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement pstmt) throws SQLException {
                pstmt.setInt(1,info.getSENDID());
                pstmt.setString(2,info.getDEPARTMENT());
                pstmt.setString(3,info.getTBL());
                pstmt.setString(4,info.getISCHECK());
                pstmt.setString(5,info.getCHECKPERSON());
            }
        });
        if(fixed>0){
            flag = true;
        }
        return flag;
    }

    @Override
    public boolean DelSendInfo(final String id) {
        boolean flag = false;
        String sql = "DELETE FROM gj_send_info WHERE SENDID=?";
        int fixed = jdbcTemplate.update(sql,new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement pstmt) throws SQLException {
                pstmt.setInt(1,Integer.parseInt(id));
            }
        });
        if(fixed>0){
            flag = true;
        }
        return flag;
    }

    @Override
    public String getInfoByFileName(String date, String fileName) {
        List li = new ArrayList();
        String sql = "SELECT COPYRANGE,GRANTRANGE FROM gj_file_view WHERE FILENAME='"+fileName+"' AND SENDTIME='"+date+"'";
        String copyrange = "";
        gj_file_plant bean = jdbcTemplate.queryForObject(sql,new RowMapper<gj_file_plant>() {
            @Override
            public gj_file_plant mapRow(ResultSet rs, int i) throws SQLException {
                gj_file_plant view = new gj_file_plant();
                view.setCOPYRANGE(rs.getString("COPYRANGE"));
                view.setGRANTRANGE(rs.getString("GRANTRANGE"));
                return view;
            }
        });
        copyrange = bean.getCOPYRANGE()+","+bean.getGRANTRANGE();
        return copyrange;
    }

    /**
     * 添加新用户
     * @param username
     * @param userid
     * @param level
     * @param apartment
     * @return boolean
     */
    @Override
    public boolean addUser(final String username,final String userid,final String level,final String apartment) {
        boolean flag = false;
        String sql = "INSERT INTO gj_user(userid,userpass,username,level,department) VALUES (?,PASSWORD(?),?,?,?);";
        int fixed = jdbcTemplate.update(sql,new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement pstmt) throws SQLException {
                pstmt.setString(1,userid);
                pstmt.setString(2,userid);
                pstmt.setString(3,username);
                pstmt.setString(4,level);
                pstmt.setString(5,apartment);
            }
        });
        if (fixed>0){
            flag = true;
        }
        return flag;
    }

    @Override
    public List getUser(gj_User user) {
        final List li = new ArrayList();
        String sql = "";
        if(user==null){
            sql = "SELECT id,userid,username,level,department FROM gj_user";
        }
        else {
            sql = "SELECT id,userid,username,level,department FROM gj_user WHERE userid='"+user.getUserid()+"'";
        }
        jdbcTemplate.query(sql,new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet rs) throws SQLException {
                gj_User user = new gj_User();
                user.setId(rs.getInt("id"));
                user.setUserid(rs.getString("userid"));
                user.setUsername(rs.getString("username"));
                user.setLevel(rs.getString("level"));
                user.setDepartment(rs.getString("department"));
                li.add(user);
            }
        });
        return li;
    }

    @Override
    public List getInfoByDepartment(final String Department) {
        final List li = new ArrayList();
        String sql = "SELECT * FROM gj_send_info WHERE DEPARTMENT=?";
        jdbcTemplate.query(sql,new PreparedStatementSetter() {
                    @Override
                    public void setValues(PreparedStatement pstmt) throws SQLException {
                        pstmt.setString(1,Department);
                    }
                },new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet rs) throws SQLException {
                gj_send_info info = new gj_send_info();
                info.setID(rs.getInt("ID"));
                info.setSENDID(rs.getInt("SENDID"));
                info.setTBL(rs.getString("TBL"));
                info.setISCHECK(rs.getString("ISCHECK"));
                info.setCHECKPERSON(rs.getString("CHECKPERSON"));
                info.setDEPARTMENT(rs.getString("DEPARTMENT"));
                info.setITIME(rs.getDate("ITIME"));
                li.add(info);
            }
        });
        return li;
    }

    @Override
    public List getFileById(final int id,String tblName) {
        final List li = new ArrayList();
        String sql = "SELECT * FROM "+tblName+" WHERE ID=?";
        jdbcTemplate.query(sql,new PreparedStatementSetter() {
                    @Override
                    public void setValues(PreparedStatement pstmt) throws SQLException {
                        pstmt.setInt(1,id);
                    }
                },new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet rs) throws SQLException {
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
                li.add(view);
            }
        });
        return li;
    }

    @Override
    public String getCheckById(final int id,final String department) {
        String check = "";
        String sql = "SELECT ISCHECK FRO gj_send_info WHERE SENDID=? AND DEPARTMENT=?";
        gj_send_info info = jdbcTemplate.queryForObject(sql,new RowMapper<gj_send_info>() {
            @Override
            public gj_send_info mapRow(ResultSet resultSet, int i) throws SQLException {
                gj_send_info inner = new gj_send_info();
                inner.setISCHECK(resultSet.getString("ISCHECK"));
                return inner;
            }
        });
        if((check = info.getISCHECK()) == null){
            check = "";
        }
        return check;
    }

    @Override
    public boolean updateSendInfoById(final int id,final String checkperson,final String department) {
        boolean flag = false;
        String sql = "UPDATE gj_send_info SET ISCHECK='1',CHECKPERSON=? WHERE SENDID=? AND DEPARTMENT=?";
        int fixed = jdbcTemplate.update(sql,new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement pstmt) throws SQLException {
                pstmt.setString(1,checkperson);
                pstmt.setInt(2,id);
                pstmt.setString(3,department);
            }
        });
        if(fixed>0){
            flag = true;
        }
        return flag;
    }

    //TODO
    @Override
    public boolean checkPassword(final String uid,final String password) {
        boolean flag = false;
        String sql = "SELECT COUNT(*) FROM gj_user WHERE userid='"+uid+"' AND userpass=PASSWORD('"+password+"')";
        int count = jdbcTemplate.queryForInt(sql);
        if(count>0){
            flag = true;
        }
        return flag;
    }

    //TODO
    @Override
    public boolean changePass(final String newpass,final String uid) {
        boolean flag = false;
        String sql = "UPDATE gj_user SET userpass=PASSWORD(?) WHERE userid=?";
        int fixed = jdbcTemplate.update(sql,new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement pstmt) throws SQLException {
                pstmt.setString(1,newpass);
                pstmt.setString(2,uid);
            }
        });
        if(fixed>0){
            flag = true;
        }
        return flag;
    }

    @Override
    public boolean delSendInfo(final int id,final String tbl) {
        boolean flag = false;
        String sql = "DELETE FROM gj_send_info WHERE SENDID=? AND TBL=?";
        int fixed = jdbcTemplate.update(sql,new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement pstmt) throws SQLException {
                pstmt.setInt(1,id);
                pstmt.setString(2,tbl);
            }
        });
        if(fixed>0){
            flag = true;
        }
        return flag;
    }

    @Override
    public List getFileInfoByStatus(final String status) {
        final List li = new ArrayList();
        String sql = "SELECT * FROM gj_file_view WHERE STATUS=?";
        jdbcTemplate.query(sql,new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement pstmt) throws SQLException {
                pstmt.setString(1,status);
            }
        },new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet rs) throws SQLException {
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
                li.add(view);
            }
        });
        return li;
    }

    @Override
    public String executeSituation(int id, String tbl, String status) {
        String count = "";
        String sql = "SELECT COUNT(*) FROM gj_send_info WHERE SENDID=? AND TBL=? AND ISCHECK=?";
        Object[] para = {id,tbl,status};
        int co = jdbcTemplate.queryForInt(sql,para);
        count = co+"";
        return count;
    }

    @Override
    public List getSendInfoByParam(int id, String tbl) {
        final List li = new ArrayList();
        String sql = "SELECT * FROM gj_send_info WHERE SENDID='"+id+"' AND TBL='"+tbl+"'";
        jdbcTemplate.query(sql,new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet rs) throws SQLException {
                gj_send_info info = new gj_send_info();
                info.setID(rs.getInt("ID"));
                info.setSENDID(rs.getInt("SENDID"));
                info.setTBL(rs.getString("TBL"));
                info.setISCHECK(rs.getString("ISCHECK"));
                info.setCHECKPERSON(rs.getString("CHECKPERSON"));
                info.setDEPARTMENT(rs.getString("DEPARTMENT"));
                info.setITIME(rs.getDate("ITIME"));
                li.add(info);
            }
        });
        return li;
    }

    @Override
    public boolean delUser(final int id) {
        boolean flag = false;
        String sql = "DELETE FROM gj_User WHERE ID=?";
        int fixed = jdbcTemplate.update(sql,new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement pstmt) throws SQLException {
                pstmt.setInt(1,id);
            }
        });
        if(fixed>0){
            flag = true;
        }
        return flag;
    }

    @Override
    public List getField(String tbl) {
        final List li = new ArrayList();
        String sql = "SELECT * FROM "+tbl;
        jdbcTemplate.query(sql,new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet rs) throws SQLException {
                caddress bean = new caddress();
                bean.setID(rs.getInt("ID"));
                bean.setKEY(rs.getString("KEY"));
                bean.setVALUE(rs.getString("VALUE"));
                li.add(bean);
            }
        });
        return li;
    }

    @Override
    public List getFiledById(final int id, String tbl) {
        final List li = new ArrayList();
        String sql = "SELECT * FROM "+tbl+" WHERE ID=?";
        jdbcTemplate.query(sql,new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement pstmt) throws SQLException {
                pstmt.setInt(1,id);
            }
        },new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet rs) throws SQLException {
                caddress bean = new caddress();
                bean.setID(rs.getInt("ID"));
                bean.setKEY(rs.getString("KEY"));
                bean.setVALUE(rs.getString("VALUE"));
                li.add(bean);
            }
        });
        return li;
    }

    @Override
    public boolean delFieldById(String tbl,final int id) {
        boolean flag = false;
        String sql = "DELETE FROM "+tbl+" WHERE ID=?";
        int fixed = jdbcTemplate.update(sql,new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement pstmt) throws SQLException {
                pstmt.setInt(1,id);
            }
        });
        if(fixed>0){
            flag = true;
        }
        return flag;
    }

    @Override
    public boolean addField(String tbl,final String key,final String value) {
        boolean flag = false;
        String sql = "INSERT INTO "+tbl+"(`KEY`,`VALUE`) VALUES (?,?)";
        int fixed = jdbcTemplate.update(sql,new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement pstmt) throws SQLException {
                pstmt.setString(1,key);
                pstmt.setString(2,value);
            }
        });
        if(fixed>0){
            flag = true;
        }
        return flag;
    }

    @Override
    public boolean updateField(final int id,final String key,final String value,String tbl) {
        boolean flag = false;
        String sql = "UPDATE "+tbl+" SET `key`=?,`value`=? WHERE ID=?";
        int fixed = jdbcTemplate.update(sql,new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement pstmt) throws SQLException {
                pstmt.setString(1,key);
                pstmt.setString(2,value);
                pstmt.setInt(3,id);
            }
        });
        if(fixed>0){
            flag = true;
        }
        return flag;
    }

    @Override
    public String getFileCount(String tbl) {
        String sql = "SELECT COUNT(*) FROM "+tbl;
        System.out.println(sql);
        int count = jdbcTemplate.queryForInt(sql);
        return count+"";
    }

    @Override
    public List getFileByTime(final String from,final String to,final String department) {
        final List li = new ArrayList();
        String sql = "SELECT SENDID,TBL FROM gj_send_info WHERE DEPARTMENT=? AND (ITIME BETWEEN ? AND ?)";
        jdbcTemplate.query(sql,new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement pstmt) throws SQLException {
                pstmt.setString(1,department);
                pstmt.setDate(2, Date.valueOf(from));
                pstmt.setDate(3, Date.valueOf(to));
            }
        },new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet rs) throws SQLException {
                gj_send_info info = new gj_send_info();
                info.setSENDID(rs.getInt("SENDID"));
                info.setTBL(rs.getString("TBL"));
                li.add(info);
            }
        });
        return li;
    }

    @Override
    public List getFileByTime(final String from,final String to) {
        final List li = new ArrayList();
        String sql = "SELECT SENDID,TBL FROM gj_send_info WHERE ITIME BETWEEN ? AND ? GROUP BY SENDID";
        jdbcTemplate.query(sql,new PreparedStatementSetter() {
                    @Override
                    public void setValues(PreparedStatement pstmt) throws SQLException {
                        pstmt.setDate(1, Date.valueOf(from));
                        pstmt.setDate(2, Date.valueOf(to));
                    }
                },new RowCallbackHandler() {
                    @Override
                    public void processRow(ResultSet rs) throws SQLException {
                        gj_send_info info = new gj_send_info();
                        info.setSENDID(rs.getInt("SENDID"));
                        info.setTBL(rs.getString("TBL"));
                        li.add(info);
                    }
                });
        return li;
    }

    @Override
    public String getSnumLatest(String fileType) {
        String sql = "SELECT max(snum) FROM gj_file_view where FILETYPE='"+fileType+"'";
        int count = jdbcTemplate.queryForInt(sql);
        return count+1+"";
    }
}
