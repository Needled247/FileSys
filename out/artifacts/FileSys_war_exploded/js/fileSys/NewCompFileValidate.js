function createNewFile(){
    var sendTimeErr = $("#sendTimeErr");sendTimeErr.html("");
    var xnumErr = $("#xnumErr");xnumErr.html("");
    var tnumErr = $("#tnumErr");tnumErr.html("");
    var caddressErr = $("#caddressErr");caddressErr.html("");
    var quantityErr = $("#quantityErr");quantityErr.html("");
    var rhquantityErr = $("#rhquantityErr");rhquantityErr.html("");
    var filenameErr = $("#filenameErr");filenameErr.html("");
    var funameErr = $("#funameErr");funameErr.html("");
    var filetypeErr = $("#filetypeErr");filetypeErr.html("");
    var snumErr = $("#snumErr");snumErr.html("");
    var copyrangeErr = $("#copyrangeErr");copyrangeErr.html("");
    var grantrangeErr = $("#grantrangeErr");grantrangeErr.html("");
    var ctypeErr = $("#ctypeErr");ctypeErr.html("");
    var sendTime = $("#sendTime").val();
    if(sendTime==null||sendTime==''){
        sendTimeErr.html('�������ڲ���Ϊ��...');
        window.location.href='#sendTime';
        return;
    }
    var caddress = $("#caddress").val();
    if(caddress=='-1'){
        caddressErr.html('���ĵ�λ����Ϊ��...');
        window.location.href = '#caddress';
        return;
    }
    var quantity = $("#quantity").val();
    if(quantity==null||quantity==''){
        quantityErr.html('��������Ϊ��...');
        window.location.href = '#quantity';
        return;
    }
    var rhquantity = $("#rhquantity").val();
    var filename = $("#filename").val();
    if(filename==null||filename==''){
        filenameErr.html('�ļ����Ʋ���Ϊ��...');
        window.location.href = '#filename';
        return;
    }
    var funame = $("#funame").val();
    if(funame==null||funame==''){
        funame = '';
    }
    var filetype = $("#filetype").val();
    if(filetype==null||filetype==''){
        filetypeErr.html('�ļ����Ͳ���Ϊ��...');
        window.location.href = '#filetype';
        return;
    }
    var snum = $("#snum").val();
    if(snum==null||snum==''){
        snumErr.html('���ĺŲ���Ϊ��...');
        window.location.href = '#snum';
        return;
    }
    var copyrange = $("#copyrange").val();
    var grantrange = $("#grantrange").val();
    var ctype = $("#ctype").val();
    if(ctype=='-1'){
        ctypeErr.html('�������Ͳ���Ϊ��...');
        window.location.href = '#ctype';
        return;
    }
    $("#newFileForm").submit();
}

function getLatestSnum(){
    var fileType = $("#filetype").val();
    $.post("SnumAction",{fileType:fileType},function(data){
        $("#snum").val(data);
    });
}