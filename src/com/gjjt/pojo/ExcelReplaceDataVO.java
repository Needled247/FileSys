package com.gjjt.pojo;

/**
 * Created with IntelliJ IDEA.
 * User: HP
 * Date: 14-1-7
 * Time: 下午10:29
 */
public class ExcelReplaceDataVO {
    private int row;// Excel单元格行
    private int column;// Excel单元格列
    private String key;// 替换的关键字
    private String value;// 替换的文本

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
