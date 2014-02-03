<%@page language="java" pageEncoding="GBK" %>
<div class="span2 main-menu-span">
    <div class="well nav-collapse sidebar-nav" id="menu">
        <ul class="nav nav-tabs nav-stacked main-menu">
            <li class="nav-header hidden-tablet">发文管理</li>
            <li><a class="ajax-link" href="index.jsp"><i class="icon-home"></i><span class="hidden-tablet"> 查看发文</span></a></li>
            <!--li><a class="ajax-link" href="UserSearchFile.jsp"><i class="icon-search"></i><span class="hidden-tablet"> 发文查询</span></a></li-->
            <li class="nav-header hidden-tablet">系统</li>
            <li><a class="ajax-link" href="ChangePass.jsp"><i class="icon-repeat"></i><span class="hidden-tablet"> 修改密码</span></a></li>
            <li><a class="ajax-link" href="../logout.jsp"><i class="icon-share-alt"></i><span class="hidden-tablet"> 注销登录</span></a></li>
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