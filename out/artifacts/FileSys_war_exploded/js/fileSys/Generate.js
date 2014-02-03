var ReleasedTbl;
function initTbl(){
    $.post("GenerateAction",null,function(data){

        ReleasedTbl = $("#ReleasedTbl").dataTable({
            "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span12'i><'span12 center'p>>",
            "bPaginate": true,
            "sScrollX": "100%",
            "sScrollXInner": "500%",
            "bScrollCollapse": true,
            "sProcessing" : "���ڶ�ȡ���ݣ����Ժ�...",
            "aaData" :data,
            "aoColumns": [
                { "mData": "���ĵ�λ" },
                { "mData": "���ı��" },
                { "mData": "��������" },
                { "mData": "�����ĺ�" },
                { "mData": "�ļ�����", "sClass": "center" },
                { "mData": "����", "sClass": "center" },
                { "mData": "��ͷ����", "sClass": "center" },
                {
                    "mData": null,
                    "sClass": "center",
                    "sDefaultContent": '<input type="checkbox" name="fileCheck">'
                }
            ],
            "bDestroy" : true,
            "sPaginationType": "bootstrap",
            "bAutoWith": true,
            "bSort": true,
            "bLengthChange": false,
            "bStateSave": true,
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
}

function exportExcel(){
    var cadd1 = $("#cadd1").text();
    var cadd2 = $("#cadd2").text();
    var cadd3 = $("#cadd3").text();
    var cadd4 = $("#cadd4").text();
    var cnum1 = $("#cnum1").text();
    var cnum2 = $("#cnum2").text();
    var cnum3 = $("#cnum3").text();
    var cnum4 = $("#cnum4").text();
    var quantity1 = $("#quantity1").text();
    var quantity2 = $("#quantity2").text();
    var quantity3 = $("#quantity3").text();
    var quantity4 = $("#quantity4").text();
    var snum1 = $("#snum1").text();
    var snum2 = $("#snum2").text();
    var snum3 = $("#snum3").text();
    var snum4 = $("#snum4").text();
    var title1 = $("#title1").text();
    var title2 = $("#title2").text();
    var title3 = $("#title3").text();
    var title4 = $("#title4").text();
    var adv1 = $("#adv1").text();
    var adv2 = $("#adv2").text();
    var adv3 = $("#adv3").text();
    var rh1 = $("#rh1").val();
    var rh2 = $("#rh2").val();
    var rh3 = $("#rh3").val();
    var rh4 = $("#rh4").val();
    var sendtime = $("#sendTime").val();
    //POST����JSP�����ļ��������ļ�������ͨ��ר�õ�����jsp��������ļ���
    $.post("exportTemplate.jsp",{sendtime:sendtime,
        cadd1:cadd1,cadd2:cadd2,cadd3:cadd3,cadd4:cadd4
        ,cnum1:cnum1,cnum2:cnum2,cnum3:cnum3,cnum4:cnum4,
        quantity1:quantity1,quantity2:quantity2,quantity3:quantity3,quantity4:quantity4,
        snum1:snum1,snum2:snum2,snum3:snum3,snum4:snum4,
        title1:title1,title2:title2,title3:title3,title4:title4,adv1:adv1,adv2:adv2,adv3:adv3,
        rh1:rh1,rh2:rh2,rh3:rh3,rh4:rh4},function(data){
        window.open('download.jsp?filename='+data);
    });
}

function getFileName(){
    try{
        var checkArr = $("input[name=\"fileCheck\"]");
        var strCheck = "";
        var strDate = "";
        var mark = 1;
        var cadd = "";
        var snum = "";
        var cnum = "";
        var quantity = "";
        var rhquantity = "";
        $("#myModal").modal('hide');
        $(checkArr).each(function(){
            if(this.checked == true){
                strCheck = $(this).parents("tr").find('td:nth-child(5)').html();
                strDate = $(this).parents("tr").find('td:nth-child(3)').html();
                cadd = $(this).parents("tr").find('td:nth-child(1)').html();
                snum = $(this).parents("tr").find('td:nth-child(2)').html();
                cnum = $(this).parents("tr").find('td:nth-child(4)').html();
                quantity = $(this).parents("tr").find('td:nth-child(6)').html();
                rhquantity = $(this).parents("tr").find('td:nth-child(7)').html();
                $("#sw"+mark).val(strCheck);
                $("#hsw"+mark).val(strDate);
                $("#cadd"+mark).text(cadd);
                $("#cnum"+mark).text(cnum);
                $("#quantity"+mark).text(parseInt(quantity)+parseInt(rhquantity));
                $("#snum"+mark).text(snum);
                $("#title"+mark).text(strCheck);
                $("#rh"+mark).val(rhquantity);
                mark++;
            }
        });
        var swname1 = $("#sw1").val();
        var swname2 = $("#sw2").val();
        var swname3 = $("#sw3").val();
        var swname4 = $("#sw4").val();
        var hsw1 = $("#hsw1").val();
        var hsw2 = $("#hsw2").val();
        var hsw3 = $("#hsw3").val();
        var hsw4 = $("#hsw4").val();
        $.post("GenerateReceiptAction",{swname1:swname1,swname2:swname2,swname3:swname3,swname4:swname4,
            hsw1:hsw1,hsw2:hsw2,hsw3:hsw3,hsw4:hsw4},function(data){
            $("#advice").val(data);
            $("#adv3").text(data);
            $("#date").text($("#sendTime").val());
        })
    }
    catch (ex){
        return "";
    }
}

$('#btn_print').click(function(e){
    e.preventDefault();
    if($("#sendTime").val()==''){
        alert('�������ڲ���Ϊ��...');
        return ;
    }
    if($("#sw1").val()==''){
        alert('��ѡ������...');
        return;
    }
    $('#printModal').modal('show');
});

