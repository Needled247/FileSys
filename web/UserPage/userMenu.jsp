<%@page language="java" pageEncoding="GBK" %>
<div class="span2 main-menu-span">
    <div class="well nav-collapse sidebar-nav" id="menu">
        <ul class="nav nav-tabs nav-stacked main-menu">
            <li class="nav-header hidden-tablet">���Ĺ���</li>
            <li><a class="ajax-link" href="index.jsp"><i class="icon-home"></i><span class="hidden-tablet"> �鿴����</span></a></li>
            <!--li><a class="ajax-link" href="UserSearchFile.jsp"><i class="icon-search"></i><span class="hidden-tablet"> ���Ĳ�ѯ</span></a></li-->
            <li class="nav-header hidden-tablet">ϵͳ</li>
            <li><a class="ajax-link" href="ChangePass.jsp"><i class="icon-repeat"></i><span class="hidden-tablet"> �޸�����</span></a></li>
            <li><a class="ajax-link" href="../logout.jsp"><i class="icon-share-alt"></i><span class="hidden-tablet"> ע����¼</span></a></li>
        </ul>
    </div><!--/.well -->
</div>

<!--======================js=========================-->
<script src="../js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
    $('#menu').find('a').each(function(){
        if (this.href == document.location.href || document.location.href.search(this.href) >= 0) {
            $(this).addClass('active'); // this.className = 'active';
        }
    });
</script>