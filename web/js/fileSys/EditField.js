function editField(){
    var key = $("#key").val();
    var value = $("#value").val();
    var id = $("#id").val();
    var type = 'update';
    var tbl = $("#add").val();
    if(key==''){
        alert('�ֶ�������Ϊ��...');
        return;
    }
    if(value==''){
        alert('�ֶ�ֵ����Ϊ��...');
        return;
    }
    $.post("SettingAction",{type:type,id:id,key:key,value:value,tbl:tbl},function(data){
        if(data=='success'){
            alert('�޸ĳɹ���');
            window.location.href='Setting.jsp';
        }
        else{
            alert('�޸�ʧ�ܣ�������...');
        }
    })
}

function delField(){
    var id = $("#id").val();
    var tbl = $("#add").val();
    var type='del';
    if(confirm('ȷ��Ҫɾ��������¼�𣿣�ע�⣺һ��ɾ�������ɻָ���')){
        $.post("SettingAction",{type:type,id:id,field:tbl},function(data){
            if(data=='success'){
                alert('ɾ���ɹ���');
                window.location.href='Setting.jsp';
            }
            else{
                alert('ɾ��ʧ��...');
            }
        })
    }
    else{
        return;
    }
}