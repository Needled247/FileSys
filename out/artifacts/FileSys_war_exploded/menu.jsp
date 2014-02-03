<%@page language="java" pageEncoding="GBK" %>
<div class="span2 main-menu-span">
    <div class="well nav-collapse sidebar-nav" id="menu">
        <ul class="nav nav-tabs nav-stacked main-menu">
            <li class="nav-header hidden-tablet">���Ĺ���</li>
            <li><a class="ajax-link" href="index.jsp"><i class="icon-home"></i><span class="hidden-tablet"> ��ҳ</span></a></li>
            <li><a class="ajax-link" href="NewPlantFile.jsp"><i class="icon-envelope"></i><span class="hidden-tablet"> �����ļ���������</span></a></li>
            <li><a class="ajax-link" href="NewCompFile.jsp"><i class="icon-share"></i><span class="hidden-tablet"> �����ļ����ֹ�˾��</span></a></li>
            <li><a class="ajax-link" href="SearchFile.jsp"><i class="icon-search"></i><span class="hidden-tablet"> ���Ĳ�ѯ</span></a></li>
            <li><a class="ajax-link" href="GrantSituation.jsp"><i class=" icon-th-list"></i><span class="hidden-tablet"> �ַ������ѯ</span></a></li>
            <li><a class="ajax-link" href="ReadSituation.jsp"><i class="icon-eye-open"></i><span class="hidden-tablet"> �İ������ѯ </span></a></li>
            <li><a class="ajax-link" href="Generate.jsp"><i class=" icon-print"></i><span class="hidden-tablet"> �����İ쵥</span></a></li>
            <li><a class="ajax-link" href="allFile.jsp" target="_blank"><i class=" icon-file"></i><span class="hidden-tablet"> �鿴ȫ���ļ�</span></a></li>
            <li class="nav-header hidden-tablet">�û�����</li>
            <li><a class="ajax-link" href="AddUser.jsp"><i class="icon-plus"></i><span class="hidden-tablet"> ����û�</span></a></li>
            <li><a class="ajax-link" href="UserManage.jsp"><i class="icon-user"></i><span class="hidden-tablet"> �����û�</span></a></li>
            <li class="nav-header hidden-tablet">ϵͳ</li>
            <li><a class="ajax-link" href="Setting.jsp"><i class="icon-edit"></i><span class="hidden-tablet"> �����ֶ�</span></a></li>
            <li><a class="ajax-link" href="ChangePass.jsp"><i class="icon-repeat"></i><span class="hidden-tablet"> �޸�����</span></a></li>
            <li><a class="ajax-link" href="logout.jsp"><i class="icon-share-alt"></i><span class="hidden-tablet"> ע����¼</span></a></li>
        </ul>
    </div><!--/.well -->
</div>

<!--======================js=========================-->
<script src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
    $('#menu').find('a').each(function(){
        if (this.href == document.location.href || document.location.href.search(this.href) >= 0) {
            $(this).addClass('active'); // this.className = 'active';
        }
    });
</script>