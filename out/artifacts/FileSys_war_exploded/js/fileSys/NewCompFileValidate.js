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
        sendTimeErr.html('收文日期不能为空...');
        window.location.href='#sendTime';
        return;
    }
    var caddress = $("#caddress").val();
    if(caddress=='-1'){
        caddressErr.html('来文单位不能为空...');
        window.location.href = '#caddress';
        return;
    }
    var quantity = $("#quantity").val();
    if(quantity==null||quantity==''){
        quantityErr.html('件数不能为空...');
        window.location.href = '#quantity';
        return;
    }
    var rhquantity = $("#rhquantity").val();
    var filename = $("#filename").val();
    if(filename==null||filename==''){
        filenameErr.html('文件名称不可为空...');
        window.location.href = '#filename';
        return;
    }
    var funame = $("#funame").val();
    if(funame==null||funame==''){
        funame = '';
    }
    var filetype = $("#filetype").val();
    if(filetype==null||filetype==''){
        filetypeErr.html('文件类型不可为空...');
        window.location.href = '#filetype';
        return;
    }
    var snum = $("#snum").val();
    if(snum==null||snum==''){
        snumErr.html('收文号不可为空...');
        window.location.href = '#snum';
        return;
    }
    var copyrange = $("#copyrange").val();
    var grantrange = $("#grantrange").val();
    var ctype = $("#ctype").val();
    if(ctype=='-1'){
        ctypeErr.html('来文类型不可为空...');
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