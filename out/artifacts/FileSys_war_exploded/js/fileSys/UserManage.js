var ReleasedTbl;
$(function(){

    $.post("UserManageAction",null,function(data){
        $('#UserManageTbl').on('click', 'td .btn-danger', function() {
            var para1 = $(this).closest('tr').find('td:first').html();
            var para3 = $(this).closest('tr').find('td:nth-child(3)').html();
            if(confirm('确定要删除这个用户吗？')){
                $.post("DelUserAction",{id:para1},function(data){
                    if(data=='success'){
                        alert('删除成功！');
                        window.location.href='UserManage.jsp';
                    }
                    else if(data=='fail'){
                        alert('删除失败！请重试！');
                    }
                })
            }
            else{
                return false;
            }
        });


        ReleasedTbl = $("#UserManageTbl").dataTable({
            "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span12'i><'span12 center'p>>",
            "bPaginate": true,
            "sProcessing" : "正在读取数据，请稍后...",
            "aaData" :data,
            "aoColumns": [
                { "mData": "ID" },
                { "mData": "用户名称" },
                { "mData": "用户账号" },
                { "mData": "级别", "sClass": "center" },
                { "mData": "部门", "sClass": "center" },
                {
                    "mData": null,
                    "sClass": "center",
                    "sDefaultContent": '&nbsp;<a class="btn btn-danger" href="#"><i class="icon-edit icon-white"></i>删除</a>'
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

/*
function SearchFileByDate(){
    var sendTime = $("#sendTime").val();
    var sendComp = $("#sendComp").val();
    var type = 'date';
    $.post("SearchFileAction",{type:type,sendTime:sendTime,sendComp:sendComp},function(data){
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
}            */