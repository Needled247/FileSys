var i = 0;
function editTable(){
    i++;
    if(i%2==0){
        $("#btn_print").removeAttr("disabled");
        $("tbody tr").each(function(){
            var td = $(this).find('td:nth-child(5)');
            var span = td.find('span:nth-child(1)');
            var temp = span.find('input').val();
            span.html("");
            span.html(temp);
        });
        $("#btn_edit").val("±à¼­");
    }
    else{
        $("#btn_print").attr("disabled","true");
        $("tbody tr").each(function(){
            var td = $(this).find('td:nth-child(5)');
            var span = td.find('span:nth-child(1)');
            var temp = span.html();
            span.html("");
            span.html("<input type='text' value='"+temp+"' style='height:30px;'>");
        });
        $("#btn_edit").val("±£´æ");
    }

}

function printTbl(){
    $("#toPrint").jqprint({ operaSupport: true });
}