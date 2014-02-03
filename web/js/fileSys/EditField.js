function editField(){
    var key = $("#key").val();
    var value = $("#value").val();
    var id = $("#id").val();
    var type = 'update';
    var tbl = $("#add").val();
    if(key==''){
        alert('字段名不能为空...');
        return;
    }
    if(value==''){
        alert('字段值不能为空...');
        return;
    }
    $.post("SettingAction",{type:type,id:id,key:key,value:value,tbl:tbl},function(data){
        if(data=='success'){
            alert('修改成功！');
            window.location.href='Setting.jsp';
        }
        else{
            alert('修改失败！请重试...');
        }
    })
}

function delField(){
    var id = $("#id").val();
    var tbl = $("#add").val();
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
}