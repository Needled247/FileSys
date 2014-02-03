package com.gjjt.dao;

import com.gjjt.pojo.gj_User;
import com.gjjt.pojo.gj_file_company;
import com.gjjt.pojo.gj_file_plant;
import com.gjjt.pojo.gj_send_info;

import java.util.List;

/**
 * Author: JH
 * Date: 13-7-7
 * Time: ����10:24
 * ϵͳDAO�ӿڡ�
 */
public interface FileSysDAO {
    //��½У��
    public List loginCheck(gj_User user);
    //������˾�ļ�
    public boolean newCompanyArticle(gj_file_company newFile);
    //�������ļ�
    public boolean newPlantArticle(gj_file_plant newFile);
    //��ȡ�����ĺ�ǰ׺
    public List getXnumPrefix();
    //��ȡ��ϵ�ĺ�ǰ׺  �ֶ�1
    public  List getTnumPrefixFirst();
    //��ȡ��ϵ�ĺ�ǰ׺  �ֶ�2
    public  List getTnumPrefixSecond();
    //��ȡ���ĵ�λǰ׺
    public List getCaddress();
    //��ȡ�ļ�����ǰ׺
    public List getFileType();
    //��ȡ���ķ�Χǰ׺����ӡ��
    public List getCopyRange();
    //��ȡ���ŷ�Χǰ׺����ͷ��
    public List getGrantRange();
    //��ȡ��������ǰ׺
    public List getCtype();
    //��ȡ�ѷ����ļ�����
    public List getReleasedFile();
    //���������ںͷ��ĵ�λ��ѯ
    public List SearchFileByDate(String date,String comp);
    //���ļ����Ʋ�ѯ
    public List SearchFileByName(String fileName);
    //����id�ͷ��ŵ�λ��ȡ��Ϣ
    public List SearchFileInfoById(String id,String add);
    //�޸ĳ����ļ�����
    public boolean EditPlantFileInfo(gj_file_plant plant);
    //�޸ķֹ�˾���ļ�����
    public boolean EditCompFileInfo(gj_file_company comp);
    //ɾ�������ļ�����
    public boolean DelPlantFileInfo(gj_file_plant plant);
    //ɾ���ֹ�˾���ļ�����
    public boolean DelCompFileInfo(gj_file_company comp);
    //����ļ����ͼ�¼
    public boolean InsertSendInfo(gj_send_info info);
    //��IDɾ���ļ����ͼ�¼
    public boolean DelSendInfo(String id);
    //���������ļ����ƻ�ȡ��Ϣ
    public String getInfoByFileName(String date,String fileName);
    //������û�
    public boolean addUser(String username,String userid,String level,String apartment);
    //��ѯ�û�
    public List getUser(gj_User user);
    //�����û����ţ���ѯ������Ϣ
    public List getInfoByDepartment(String Department);
    //����ID,������ѯ�ļ���ϸ��Ϣ
    public List getFileById(int id,String tblName);
    //����ID����ѯischeckֵ
    public String getCheckById(int id,String department);
    //����ID���޸ķ��ļ�¼�е�ischeck
    public boolean updateSendInfoById(int id,String checkperson,String department);
    //�޸�����
    public boolean checkPassword(String uid, String password);
    public boolean changePass(String newpass, String uid);
    //ɾ���ļ���Ϣ����������Ϣ
    public boolean delSendInfo(int id,String tbl);
    //������״̬��ѯ�ļ���Ϣ
    public List getFileInfoByStatus(String status);
    //��ID�ͷַ���λ��ѯ�İ�״̬
    public String executeSituation(int id,String tbl,String status);
    //����ID,TBL��ȡsendinfo
    public List getSendInfoByParam(int id,String tbl);
    //ɾ���û�
    public boolean delUser(int id);
    //��ѯ�ֶ�
    public List getField(String tbl);
    //��ID��ѯ�ֶ�
    public List getFiledById(int id,String tbl);
    //ɾ���ֶ�
    public boolean delFieldById(String tbl,int id);
    //����ֶ�
    public boolean addField(String tbl,String key,String value);
    //�޸��ֶ�
    public boolean updateField(int id,String key,String value,String tbl);
    //��ȡ�ļ�����
    public String getFileCount(String tbl);
    //����δ�İ�����

    //�����������

    //��ʱ��κͲ��Ų�ѯ
    public List getFileByTime(String from ,String to , String department);
    public List getFileByTime(String from ,String to);

    public String getSnumLatest(String fileType);

    public List getAllFile();
}
