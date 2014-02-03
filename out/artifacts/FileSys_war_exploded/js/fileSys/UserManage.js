var ReleasedTbl;
$(function(){

    $.post("UserManageAction",null,function(data){
        $('#UserManageTbl').on('click', 'td .btn-danger', function() {
            var para1 = $(this).closest('tr').find('td:first').html();
            var para3 = $(this).closest('tr').find('td:nth-child(3)').html();
            if(confirm('ȷ��Ҫɾ������û���')){
                $.post("DelUserAction",{id:para1},function(data){
                    if(data=='success'){
                        alert('ɾ���ɹ���');
                        window.location.href='UserManage.jsp';
                    }
                    else if(data=='fail'){
                        alert('ɾ��ʧ�ܣ������ԣ�');
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
            "sProcessing" : "���ڶ�ȡ���ݣ����Ժ�...",
            "aaData" :data,
            "aoColumns": [
                { "mData": "ID" },
                { "mData": "�û�����" },
                { "mData": "�û��˺�" },
                { "mData": "����", "sClass": "center" },
                { "mData": "����", "sClass": "center" },
                {
                    "mData": null,
                    "sClass": "center",
                    "sDefaultContent": '&nbsp;<a class="btn btn-danger" href="#"><i class="icon-edit icon-white"></i>ɾ��</a>'
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