$(function(){
    $.post("AllFileAction",null,function(data){

        $("#ReleasedTbl").dataTable({
            "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span12'i><'span12 center'p>>",
            "bPaginate": true,
            "sProcessing" : "���ڶ�ȡ���ݣ����Ժ�...",
            "aaData" :data,
            "aoColumns": [
                { "mData": "�����ĺ�", "sClass": "center"  },
                { "mData": "��ϵ�ĺ�", "sClass": "center"  },
                { "mData": "���ĵ�λ", "sClass": "center" },
                { "mData": "��������", "sClass": "center"  },
                { "mData": "��ͷ����", "sClass": "center"  },
                { "mData": "�ļ�����", "sClass": "center"  },
                { "mData": "��������", "sClass": "center"  },
                { "mData": "�ļ�����", "sClass": "center"  },
                { "mData": "���ı��", "sClass": "center"  },
                { "mData": "��Χ����ӡ��", "sClass": "center"  },
                { "mData": "��Χ����ͷ��", "sClass": "center"  },
                { "mData": "��������", "sClass": "center"  },
                { "mData": "ʱ��", "sClass": "center"  },
                { "mData": "������λ", "sClass": "center" },
                { "mData": "״̬", "sClass": "center"  }
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
