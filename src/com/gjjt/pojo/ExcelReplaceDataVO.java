package com.gjjt.pojo;

/**
 * Created with IntelliJ IDEA.
 * User: HP
 * Date: 14-1-7
 * Time: ����10:29
 */
public class ExcelReplaceDataVO {
    private int row;// Excel��Ԫ����
    private int column;// Excel��Ԫ����
    private String key;// �滻�Ĺؼ���
    private String value;// �滻���ı�

    public int getRow() {
        return row;
    }

    public void setRow(int row) {
        this.row = row;
    }

    public int getColumn() {
        return column;
    }

    public void setColumn(int column) {
        this.column = column;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
