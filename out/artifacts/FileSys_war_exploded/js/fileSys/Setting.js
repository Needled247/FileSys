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
    });

    var field = $("#Field").val();
    var type = 'search';
    $.post("SettingAction",{type:type,field:field},function(data){
        $("#tbl").val(field);
        ReleasedTbl = $("#ReleasedTbl").dataTable({
            "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span12'i><'span12 center'p>>",
            "bPaginate": true,
            "sProcessing" : "���ڶ�ȡ���ݣ����Ժ�...",
            "aaData" :data,
            "aoColumns": [
                { "mData": "ID" },
                { "mData": "�ֶ�" },
                {
                    "mData": null,
                    "sClass": "center",
                    "sDefaultContent": '<a class="btn btn-warning" href="#"><i class="icon-edit icon-white"></i>�޸�</a>&nbsp;&nbsp;<a class="btn btn-danger" href="#"><i class="icon-edit icon-white"></i>ɾ��</a>'
                }
            ],
            "bDestroy" : true,
            "sPaginationType": "bootstrap",
            "bAutoWith": true,
            "bSort": true,
            "bLengthChange": false,
            "bStateSave": false,
            "oLanguage": {
                "sInfo": "��ǰ��ʾ _START_ �� _END_ ������ _TOTAL_ ����¼",
                "sInfoFiltered": "���ݱ��й�Ϊ _MAX_ ����¼",
                "sSearch": "����",
                "sZeroRecords": "�Բ��𣬲�ѯ����������ݣ�",
                "sEmptyTable": "���������ݴ��ڣ�",
                "oPaginate": {
                    "sFirst": "��ҳ",
                    "sPrevious": "��һҳ",
                    "sNext": "��һҳ",
                    "sLast": "ĩҳ"
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
        alert('�ֶ�������Ϊ��...');
        return;
    }
    if(value==''){
        alert('�ֶ�ֵ����Ϊ��...');
        return;
    }
    $.post("SettingAction",{type:type,tbl:tbl,key:key,value:value},function(data){
        if(data=='success'){
            alert('��ӳɹ���');
            $("#myModal").modal('hide');
        }
        else{
            alert('����ʧ��...������');
        }
    })
}
