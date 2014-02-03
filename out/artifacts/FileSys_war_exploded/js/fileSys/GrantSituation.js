var ReleasedTbl;
$(function(){
    $.post("ReleasedAction",null,function(data){
        $('#ReleasedTbl').on('click', 'td .btn-warning', function() {
            var para1 = $(this).closest('tr').find('td:first').html();
            var para6 = $(this).closest('tr').find('td:nth-child(6)').html();
            window.location.href='EditFile.jsp?pid='+para1+'&add='+para6;
        });

        $('#ReleasedTbl').on('click', 'td .btn-danger', function() {
            var para1 = $(this).closest('tr').find('td:first').html();
            var para6 = $(this).closest('tr').find('td:nth-child(6)').html();
            var type='delFile';
            if(confirm('确定要删除这条记录吗？（注意：一旦删除，不可恢复）')){
                $.post("EditFileAction",{type:type,pid:para1,tbl:para6},function(data){
                    if(data=='success'){
                        alert('删除成功！');
                        window.location.href='SearchFile.jsp';
                    }
                    else{
                        alert('删除失败...');
                    }
                })
            }
            else{
                return;
            }
        });


        ReleasedTbl = $("#ReleasedTbl").dataTable({
            "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span12'i><'span12 center'p>>",
            "bPaginate": true,
            "sProcessing" : "正在读取数据，请稍后...",
            "aaData" :data,
            "aoColumns": [
                { "mData": "ID" },
                { "mData": "收文日期" },
                { "mData": "行政文号" },
                { "mData": "来文单位", "sClass": "center" },
                { "mData": "文件名称", "sClass": "center" },
                { "mData": "发布单位", "sClass": "center" },
                { "mData": "状态", "sClass": "center" },
                {
                    "mData": null,
                    "sClass": "center",
                    "sDefaultContent": '<a class="btn btn-warning" href="#"><i class="icon-edit icon-white"></i>查看/编辑</a>&nbsp;&nbsp;<a class="btn btn-danger" href="#"><i class="icon-edit icon-white"></i>删除</a>'
                }
            ],
            "bDestroy" : true,
            "sPaginationType": "bootstrap",
            "bAutoWith": true,
            "bSort": true,
            "bLengthChange": false,
            "bStateSave": false,
            "oLanguage": {
                "sInfo": "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",
                "sInfoFiltered": "数据表中共为 _MAX_ 条记录",
                "sSearch": "搜索",
                "sZeroRecords": "对不起，查询不到相关数据！",
                "sEmptyTable": "表中无数据存在！",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "上一页",
                    "sNext": "下一页",
                    "sLast": "末页"
                }
            }
        } );
    })
});


function alreadyRelease(){
    var situation = '1';
    var type = 'grant';
    $.post("SituationAction",{type:type,situation:situation},function(data){
        ReleasedTbl.fnClearTable();
        ReleasedTbl.fnAddData(data);
        ReleasedTbl.fnDraw(data);
    })
}

function notRelease(){
    var situation = '0';
    var type = 'grant';
    $.post("SituationAction",{type:type,situation:situation},function(data){
        ReleasedTbl.fnClearTable();
        ReleasedTbl.fnAddData(data);
        ReleasedTbl.fnDraw(data);
    })
}

function SearchFileByName(){
    var fileName = $("#fileName").val();
    var type = 'name';
    $.post("SearchFileAction",{type:type,fileName:fileName},function(data){
        ReleasedTbl.fnClearTable();
        ReleasedTbl.fnAddData(data);
        ReleasedTbl.fnDraw(data);
    })
}
