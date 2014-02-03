var ReleasedTbl;
$(function(){
    $('#ReleasedTbl').on('click', 'td .btn-warning', function() {
        var id = $(this).closest('tr').find('td:first').html();
        var tbl = $("#tbl").val();
        window.location.href='EditField.jsp?id='+id+'&add='+tbl;
    });

    $('#ReleasedTbl').on('click', 'td .btn-danger', function() {
        var id = $(this).closest('tr').find('td:first').html();
        var tbl = $("#tbl").val();
        var type='del';
        if(confirm('确定要删除这条记录吗？（注意：一旦删除，不可恢复）')){
            $.post("SettingAction",{type:type,id:id,field:tbl},function(data){
                if(data=='success'){
                    alert('删除成功！');
                    window.location.href='Setting.jsp';
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

    var field = $("#Field").val();
    var type = 'search';
    $.post("SettingAction",{type:type,field:field},function(data){
        $("#tbl").val(field);
        ReleasedTbl = $("#ReleasedTbl").dataTable({
            "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span12'i><'span12 center'p>>",
            "bPaginate": true,
            "sProcessing" : "正在读取数据，请稍后...",
            "aaData" :data,
            "aoColumns": [
                { "mData": "ID" },
                { "mData": "字段" },
                {
                    "mData": null,
                    "sClass": "center",
                    "sDefaultContent": '<a class="btn btn-warning" href="#"><i class="icon-edit icon-white"></i>修改</a>&nbsp;&nbsp;<a class="btn btn-danger" href="#"><i class="icon-edit icon-white"></i>删除</a>'
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



function record(){
    var field = $("#Field").val();
    $("#tbl").val(field);
    var type = 'search';
    $.post("SettingAction",{type:type,field:field},function(data){
        ReleasedTbl.fnClearTable();
        ReleasedTbl.fnAddData(data);
        ReleasedTbl.fnDraw(data);
    })
}

function AddField(){
    var tbl = $("#Field").val();
    var key = $("#key").val();
    var value = $("#value").val();
    var type = 'add';
    if(key==''){
        alert('字段名不能为空...');
        return;
    }
    if(value==''){
        alert('字段值不能为空...');
        return;
    }
    $.post("SettingAction",{type:type,tbl:tbl,key:key,value:value},function(data){
        if(data=='success'){
            alert('添加成功！');
            $("#myModal").modal('hide');
        }
        else{
            alert('操作失败...请重试');
        }
    })
}
