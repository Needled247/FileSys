function changePass(){
    var oldpass = $("#oldpass").val();
    var newpass1 = $("#newpass1").val();
    var newpass2 = $("#newpass2").val();
    var uid = $("#uid").val();
    var alertBlock = $("#alert");
    if(oldpass==''){
        $("#alert_block").show();
        alertBlock.html("");
        alertBlock.html("�����벻��Ϊ�գ�");
        return;
    }
    if(newpass1.length<5||newpass1.length>12){
        $("#alert_block").show();
        alertBlock.html("");
        alertBlock.html("�����볤��Ϊ5-12λ");
        return;
    }
    if(newpass2.length<5||newpass2.length>12){
        $("#alert_block").show();
        alertBlock.html("");
        alertBlock.html("�����볤��Ϊ5-12λ");
        return;
    }
    if(newpass1==''){
        $("#alert_block").show();
        alertBlock.html("");
        alertBlock.html("�����벻��Ϊ�գ�");
        return;
    }
    if(newpass2==''){
        $("#alert_block").show();
        alertBlock.html("");
        alertBlock.html("ȷ�����벻��Ϊ�գ�");
        return;
    }
    if(newpass1!=newpass2){
        $("#alert_block").show();
        alertBlock.html("");
        alertBlock.html("�������������벻һ�£�");
        return;
    }

    $.post("ChangePassAction",{oldpass:oldpass,newpass1:newpass1,newpass2:newpass2,uid:uid},function(data){
        if(data=='success'){
            alert("�޸ĳɹ���");
            window.location.href='index.jsp';
        }
        else if(data=='ck_err'){
            $("#alert_block").show();
            alertBlock.html("");
            alertBlock.html("���������");
        }
        else if(data=='error'){
            alert('�޸�ʧ�ܣ�������');
        }
    })
}