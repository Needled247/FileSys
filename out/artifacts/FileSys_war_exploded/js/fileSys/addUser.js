function addUser(){
    var username = $("#username").val();
    var userid = $("#userid").val();
    var apartment = $("#apartment").val();
    var level = $("#level").val();
    $.post("AddUserAction",{userid:userid,username:username,apartment:apartment,level:level},function(data){
        if(data=='success'){
            alert('Ìí¼Ó³É¹¦£¡');
            window.location.href='UserManage.jsp';
        }
    })
}