function validate(){
    var userid = $.trim($("#userid").val());
    var userpass = $.trim($("#userpass").val());
    var flag = true;
    var info = $("#info");
    if((userid==null||userid=="")&&(userpass==null||userpass=="")){
        info.html("");
        info.html("�û������벻��Ϊ��...");
        flag = false;
        return false;
    }
    if(userid==null||userid==""){
        info.html("");
        info.html("�û�������Ϊ��...");
        flag = false;
        return false;
    }
    if(userpass==null||userpass==""){
        info.html("");
        info.html("���벻��Ϊ��...");
        flag = false;
        return false;
    }
    if(flag){
        $.post("checkLogin",{userid:userid,userpass:userpass},function(data){
            if(data=='fail'){
                info.html("");
                info.html("�˺�/���������������д...");
            }
            if(data=='1'){
                window.location.href='index.jsp';
            }
            if(data=='2'){
                window.location.href='/UserPage/index.jsp';
            }
            if(data=='3'){
                window.location.href='/EntryPage/index.jsp';
            }
        })
    }
}