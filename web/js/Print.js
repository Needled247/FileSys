var json;
$(function(){
    var pid = $("#pid").val();
    var add = $("#add").val();
    $.post("xxxx",{pid:pid,add:add},function(data){
        json = data;
    })
});
$('#example1').handsontable({
    startRows: 16,
    startCols: 10,
    colHeaders: ["日期", "行政文号", "体系文号","发文单位","件数","附件","文件名称","受控编号","持有单位/人","承收人签字"],
    contextMenu: false
});
    /*[
    ["2013-11-18","保修人发[2013]0913", "GJBYJJ11124", "行政部", "5","","收文阅办单（样表）.xls","","",""],
    ["2013-11-18","保修人发[2013]0913", "GJBYJJ11124", "行政部", "5","","收文阅办单（样表）.xls","","",""],
    ["2013-11-18","保修人发[2013]0913", "GJBYJJ11124", "行政部", "5","","收文阅办单（样表）.xls","","",""],
    ["2013-11-18","保修人发[2013]0913", "GJBYJJ11124", "行政部", "5","","收文阅办单（样表）.xls","","",""],
    ["2013-11-18","保修人发[2013]0913", "GJBYJJ11124", "行政部", "5","","收文阅办单（样表）.xls","","",""],
    ["2013-11-18","保修人发[2013]0913", "GJBYJJ11124", "行政部", "5","","收文阅办单（样表）.xls","","",""],
    ["2013-11-18","保修人发[2013]0913", "GJBYJJ11124", "行政部", "5","","收文阅办单（样表）.xls","","",""],
    ["2013-11-18","保修人发[2013]0913", "GJBYJJ11124", "行政部", "5","","收文阅办单（样表）.xls","","",""],
    ["2013-11-18","保修人发[2013]0913", "GJBYJJ11124", "行政部", "5","","收文阅办单（样表）.xls","","",""],
    ["2013-11-18","保修人发[2013]0913", "GJBYJJ11124", "行政部", "5","","收文阅办单（样表）.xls","","",""]
];     */
$("#example1").handsontable("loadData", json);