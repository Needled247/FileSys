function validate(){
    var userid = $.trim($("#userid").val());
    var userpass = $.trim($("#userpass").val());
    var flag = true;
    var info = $("#info");
    if((userid==null||userid=="")&&(userpass==null||userpass=="")){
        info.html("");
        info.html("用户名密码不能为空...");
        flag = false;
        return false;
    }
    if(userid==null||userid==""){
        info.html("");
        info.html("用户名不能为空...");
        flag = false;
        return false;
    }
    if(userpass==null||userpass==""){
        info.html("");
        info.html("密码不能为空...");
        flag = false;
        return false;
    }
    if(flag){
        $.post("checkLogin",{userid:userid,userpass:userpass},function(data){
            if(data=='fail'){
                info.html("");
                info.html("账号/密码错误，请重新填写...");
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