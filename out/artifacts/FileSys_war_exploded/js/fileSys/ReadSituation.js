var ReleasedTbl;
$(function(){
    $.post("SituationInitAction",null,function(data){
        $('#ReleasedTbl').on('click', 'td .btn-success', function() {
            var para1 = $(this).closest('tr').find('td:first').html();
            var para6 = $(this).closest('tr').find('td:nth-child(6)').html();
            window.location.href='SituationDetail.jsp?id='+para1+'&tbl='+para6;
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
                { "mData": "�İ�״̬", "sClass": "center" },
                {
                    "mData": null,
                    "sClass": "center",
                    "sDefaultContent": '<a class="btn btn-success" href="#"><i class="icon-edit icon-white"></i>�鿴�İ���ϸ</a>'
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
