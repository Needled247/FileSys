package com.gjjt.action;

import com.gjjt.pojo.*;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: HP
 * Date: 13-7-18
 * Time: 下午8:48
 * To change this template use File | Settings | File Templates.
 */
public class getPrefixAction extends ActionSupport {
    private Map<String,String> xnumMap = new HashMap<String, String>();
    private Map<String,String> tnum1Map = new HashMap<String, String>();
    private Map<String,String> tnum2Map = new HashMap<String, String>();
    private Map<String,String> caddMap = new HashMap<String, String>();
    private Map<String,String> fileTypeMap = new HashMap<String,String>();
    private Map<String,String> copyRangeMap = new HashMap<String, String>();
    private Map<String,String> grantRangeMap = new HashMap<String, String>();
    private Map<String,String> ctypeMap = new HashMap<String, String>();

    public Map<String, String> getCtypeMap() {
        return ctypeMap;
    }

    public void setCtypeMap(Map<String, String> ctypeMap) {
        this.ctypeMap = ctypeMap;
    }

    public Map<String, String> getCopyRangeMap() {
        return copyRangeMap;
    }

    public void setCopyRangeMap(Map<String, String> copyRangeMap) {
        this.copyRangeMap = copyRangeMap;
    }

    public Map<String, String> getGrantRangeMap() {
        return grantRangeMap;
    }

    public void setGrantRangeMap(Map<String, String> grantRangeMap) {
        this.grantRangeMap = grantRangeMap;
    }

    public Map<String, String> getFileTypeMap() {
        return fileTypeMap;
    }

    public void setFileTypeMap(Map<String, String> fileTypeMap) {
        this.fileTypeMap = fileTypeMap;
    }

    public Map<String, String> getCaddMap() {
        return caddMap;
    }

    public void setCaddMap(Map<String, String> caddMap) {
        this.caddMap = caddMap;
    }

    public Map<String, String> getTnum1Map() {
        return tnum1Map;
    }

    public void setTnum1Map(Map<String, String> tnum1Map) {
        this.tnum1Map = tnum1Map;
    }

    public Map<String, String> getTnum2Map() {
        return tnum2Map;
    }

    public void setTnum2Map(Map<String, String> tnum2Map) {
        this.tnum2Map = tnum2Map;
    }

    public Map<String, String> getXnumMap() {
        return xnumMap;
    }

    public void setXnumMap(Map<String, String> xnumMap) {
        this.xnumMap = xnumMap;
    }

    @Override
    public String execute() throws Exception {
        //行政文号前缀获取
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-config.xml");
        xnum_fix xnum = ctx.getBean("xnum_fix",xnum_fix.class);
        List xnumList = xnum.getXnumPrefix();
        Iterator xnumIter = xnumList.iterator();
        while (xnumIter.hasNext()){
            xnum_fix fix = (xnum_fix)xnumIter.next();
            xnumMap.put(fix.getKEY(),fix.getVALUE());
        }

        //体系文号前缀获取  字段1
        tnum_fix_first tnum = ctx.getBean("tnum_fix_first",tnum_fix_first.class);
        List tnum1List = tnum.getTnumPrefixFirst();
        Iterator tnum1Iter = tnum1List.iterator();
        while (tnum1Iter.hasNext()){
            tnum_fix_first tfix1 = (tnum_fix_first)tnum1Iter.next();
            tnum1Map.put(tfix1.getKEY(),tfix1.getVALUE());
        }
        //体系文号前缀获取  字段2
        List tnum2List = tnum.getTnumPrefixSecond();
        Iterator tnum2Iter = tnum2List.iterator();
        while (tnum2Iter.hasNext()){
            tnum_fix_second tfix2 = (tnum_fix_second)tnum2Iter.next();
            tnum2Map.put(tfix2.getKEY(),tfix2.getVALUE());
        }
        //来文单位前缀获取
        caddress caddBean = ctx.getBean("caddress",caddress.class);
        List caddList = caddBean.getCaddress();
        Iterator caddIter = caddList.iterator();
        while (caddIter.hasNext()){
            caddress cadd = (caddress)caddIter.next();
            caddMap.put(cadd.getKEY(), cadd.getVALUE());
        }
        //文件类型前缀获取
        file_type ft = ctx.getBean("file_type",file_type.class);
        List fileTypeList = ft.getFileType();
        Iterator fileTypeIter = fileTypeList.iterator();
        while (fileTypeIter.hasNext()){
            file_type type = (file_type)fileTypeIter.next();
            fileTypeMap.put(type.getKEY(),type.getVALUE());
        }
        //发文范围（复印）前缀获取
        copy_range cr = ctx.getBean("copy_range",copy_range.class);
        List copyRangeList = cr.getCopyRange();
        Iterator copyRangeIter = copyRangeList.iterator();
        while (copyRangeIter.hasNext()){
            copy_range range = (copy_range)copyRangeIter.next();
            copyRangeMap.put(range.getKEY(),range.getVALUE());
            grantRangeMap.put(range.getKEY(),range.getVALUE());
        }
        //来文类型前缀获取
        ctype ctp = ctx.getBean("ctype",ctype.class);
        List ctypeList = ctp.getCtype();
        Iterator ctypeIter = ctypeList.iterator();
        while (ctypeIter.hasNext()){
            ctype ct = (ctype)ctypeIter.next();
            ctypeMap.put(ct.getKEY(),ct.getVALUE());
        }
        return null;
    }
}
