package com.gjjt.dao;

import com.gjjt.pojo.gj_User;
import com.gjjt.pojo.gj_file_company;
import com.gjjt.pojo.gj_file_plant;
import com.gjjt.pojo.gj_send_info;

import java.util.List;

/**
 * Author: JH
 * Date: 13-7-7
 * Time: 下午10:24
 * 系统DAO接口。
 */
public interface FileSysDAO {
    //登陆校验
    public List loginCheck(gj_User user);
    //发布公司文件
    public boolean newCompanyArticle(gj_file_company newFile);
    //发布厂文件
    public boolean newPlantArticle(gj_file_plant newFile);
    //获取行政文号前缀
    public List getXnumPrefix();
    //获取体系文号前缀  字段1
    public  List getTnumPrefixFirst();
    //获取体系文号前缀  字段2
    public  List getTnumPrefixSecond();
    //获取来文单位前缀
    public List getCaddress();
    //获取文件类型前缀
    public List getFileType();
    //获取发文范围前缀（复印）
    public List getCopyRange();
    //获取发放范围前缀（红头）
    public List getGrantRange();
    //获取来文类型前缀
    public List getCtype();
    //获取已发布文件内容
    public List getReleasedFile();
    //按发文日期和发文单位查询
    public List SearchFileByDate(String date,String comp);
    //按文件名称查询
    public List SearchFileByName(String fileName);
    //根据id和发放单位获取信息
    public List SearchFileInfoById(String id,String add);
    //修改厂发文件内容
    public boolean EditPlantFileInfo(gj_file_plant plant);
    //修改分公司发文件内容
    public boolean EditCompFileInfo(gj_file_company comp);
    //删除厂发文件内容
    public boolean DelPlantFileInfo(gj_file_plant plant);
    //删除分公司发文件内容
    public boolean DelCompFileInfo(gj_file_company comp);
    //添加文件发送记录
    public boolean InsertSendInfo(gj_send_info info);
    //按ID删除文件发送记录
    public boolean DelSendInfo(String id);
    //根据日期文件名称获取信息
    public String getInfoByFileName(String date,String fileName);
    //添加新用户
    public boolean addUser(String username,String userid,String level,String apartment);
    //查询用户
    public List getUser(gj_User user);
    //根据用户部门，查询发文信息
    public List getInfoByDepartment(String Department);
    //根据ID,表名查询文件详细信息
    public List getFileById(int id,String tblName);
    //根据ID，查询ischeck值
    public String getCheckById(int id,String department);
    //根据ID，修改发文记录中的ischeck
    public boolean updateSendInfoById(int id,String checkperson,String department);
    //修改密码
    public boolean checkPassword(String uid, String password);
    public boolean changePass(String newpass, String uid);
    //删除文件信息连带发送信息
    public boolean delSendInfo(int id,String tbl);
    //按发文状态查询文件信息
    public List getFileInfoByStatus(String status);
    //按ID和分发单位查询阅办状态
    public String executeSituation(int id,String tbl,String status);
    //根据ID,TBL获取sendinfo
    public List getSendInfoByParam(int id,String tbl);
    //删除用户
    public boolean delUser(int id);
    //查询字段
    public List getField(String tbl);
    //按ID查询字段
    public List getFiledById(int id,String tbl);
    //删除字段
    public boolean delFieldById(String tbl,int id);
    //添加字段
    public boolean addField(String tbl,String key,String value);
    //修改字段
    public boolean updateField(int id,String key,String value,String tbl);
    //获取文件数量
    public String getFileCount(String tbl);
    //过期未阅办数量

    //传阅完毕数量

    //按时间段和部门查询
    public List getFileByTime(String from ,String to , String department);
    public List getFileByTime(String from ,String to);

    public String getSnumLatest(String fileType);

    public List getAllFile();
}
