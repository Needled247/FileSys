var ReleasedTbl;
$(function(){
    $.post("ReleasedAction",null,function(data){
        $('#ReleasedTbl').on('click', 'td .btn-warning', function() {
            var para1 = $(this).closest('tr').find('td:first').html();
            var para6 = $(this).closest('tr').find('td:nth-child(6)').html();
            window.location.href='EditFile.jsp?pid='+para1+'&add='+para6;
        });

        ReleasedTbl = $("#ReleasedTbl").dataTable({
            "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span12'i><'span12 center'p>>",
            "bPaginate": true,
            "sProcessing" : "���ڶ�ȡ���ݣ����Ժ�...",
            "aaData" :data,
            "aoColumns": [
                { "mData": "ID" },
                { "mData": "��������" },
                { "mData": "�����ĺ�" },
                { "mData": "���ĵ�λ", "sClass": "center" },
                { "mData": "�ļ�����", "sClass": "center" },
                { "mData": "������λ", "sClass": "center" },
                { "mData": "״̬", "sClass": "center" },
                {
                    "mData": null,
                    "sClass": "center",
                    "sDefaultContent": '<a class="btn btn-warning" href="#"><i class="icon-edit icon-white"></i>�鿴/�༭</a>'
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
}

function initPage(){
    window.location.reload();
}