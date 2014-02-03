var i = 0;
function editFile(){
    var btn_save =  $("#btn_save");
    i++;
    var sendtime='',xnum='',tnum='',caddress='',quantity='',rhquantity='',filename='',funame='',filetype='',snum='',copyrange='',
        grantrange='',cfiletype='',copyquantity='',isinvalid='',recquantity='';
    if(i%2==0){
        sendtime = $("#input1").val();
        xnum = $("#input2").val();
        tnum = $("#input3").val();
        caddress = $("#input4").val();
        quantity = $("#input5").val();
        rhquantity = $("#input6").val();
        filename = $("#input7").val();
        funame = $("#input8").val();
        filetype = $("#input9").val();
        snum = $("#input10").val();
        copyrange = $("#input11").val();
        grantrange = $("#input12").val();
        cfiletype = $("#input13").val();
        copyquantity = $("#input14").val();
        isinvalid = $("#input15").val();
        recquantity = $("#input16").val();
        var pid = $("#pid").val();
        var tbl = $("#add").val()
        $.post("EditFileAction",
        {sendtime:sendtime,xnum:xnum,tnum:tnum,caddress:caddress,quantity:quantity,rhquantity:rhquantity,
            filename:filename,funame:funame,filetype:filetype,snum:snum,copyrange:copyrange,grantrange:grantrange,
            cfiletype:cfiletype,copyquantity:copyquantity,isinvalid:isinvalid,recquantity:recquantity,pid:pid,tbl:tbl},
        function(data){
            if(data=='success'){
                alert('修改成功！');
                window.location.href='SearchFile.jsp';
            }
            else{
                alert('修改失败！请重试');
            }
        });
        $("tbody tr").each(function(){
            var td = $(this).find('td:nth-child(2)');
            var temp = td.find('input').val();
            td.html("");
            td.html(temp);
        });
        //点保存的时候，走这
        btn_save.html("");
        btn_save.html("<i class=\"icon-ok icon-white\"></i>编辑");
    }
    else{
        var mark = 1;
        $("tbody tr").each(function(){
            var td = $(this).find('td:nth-child(2)');
            var temp = td.html();
            td.html("");
            td.html("<input type='text' value='"+temp+"' id='input"+mark+"'>");
            mark++;
        });
        btn_save.html("");
        btn_save.html("<i class=\"icon-ok icon-white\"></i>保存");
    }
}


function saveFile(){
    var sendtime='',xnum1='',xnum2='',tnum1='',tnum2='',tnum3='',caddress='',quantity='',rhquantity='',filename='',funame='',filetype='',snum='',copyrange='',
        grantrange='',cfiletype='',copyquantity='',isinvalid='',recquantity='',attr='';
    sendtime = $("#sendTime").val();
    xnum1 = $("#xnum1").val();
    xnum2 = $("#xnum2").val();
    tnum1 = $("#tnum1").val();
    tnum2 = $("#tnum2").val();
    tnum3 = $("#tnum3").val();
    caddress = $("#caddress").val();
    quantity = $("#quantity").val();
    rhquantity = $("#rhquantity").val();
    filename = $("#filename").val();
    funame = $("#funame").val();
    filetype = $("#filetype").val();
    snum = $("#snum").val();
    copyrange = $("#copyrange").val();
    if(copyrange!=null){
        copyrange = copyrange.join(",");
    }
    else{
        copyrange = "";
    }
    grantrange = $("#grantrange").val();
    if(grantrange!=null){
        grantrange = grantrange.join(",");
    }
    else{
        grantrange = "";
    }
    cfiletype = $("#ctype").val();
    copyquantity = $("#copyquantity").val();
    isinvalid = $("#isinvalid").val();
    recquantity = $("#recquantity").val();
    attr = $("#attr").val();
    var pid = $("#pid").val();
    var tbl = $("#add").val();
    var type = 'editFile';
    $.post("EditFileAction",
        {sendtime:sendtime,xnum1:xnum1,xnum2:xnum2,tnum1:tnum1,tnum2:tnum2,tnum3:tnum3,caddress:caddress,quantity:quantity,rhquantity:rhquantity,
            filename:filename,funame:funame,filetype:filetype,snum:snum,copyrange:copyrange,grantrange:grantrange,
            cfiletype:cfiletype,copyquantity:copyquantity,isinvalid:isinvalid,recquantity:recquantity,pid:pid,tbl:tbl,type:type,attr:attr},
        function(data){
            if(data=='success'){
                alert('修改成功！');
                window.location.href='SearchFile.jsp';
            }
            else{
                alert('修改失败！请重试');
            }
        });
}

function delFile(){
    if(confirm('确定要删除此文件？')){
        var pid = $("#pid").val();
        var tbl = $("#add").val();
        var type = 'delFile';
        $.post("EditFileAction",{pid:pid,tbl:tbl,type:type},function(data){
            if(data=='success'){
                alert('删除成功！');
                window.location.href='SearchFile.jsp';
            }
            else{
                alert('删除失败！请重试');
            }
        })
    }
    else{
        return false;
    }

}