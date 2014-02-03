<%@page language="java" pageEncoding="GBK" %>
<div class="span2 main-menu-span">
    <div class="well nav-collapse sidebar-nav" id="menu">
        <ul class="nav nav-tabs nav-stacked main-menu">
            <li class="nav-header hidden-tablet">发文管理</li>
            <li><a class="ajax-link" href="index.jsp"><i class="icon-home"></i><span class="hidden-tablet"> 首页</span></a></li>
            <li><a class="ajax-link" href="NewPlantFile.jsp"><i class="icon-envelope"></i><span class="hidden-tablet"> 发布文件（厂发）</span></a></li>
            <li><a class="ajax-link" href="NewCompFile.jsp"><i class="icon-share"></i><span class="hidden-tablet"> 发布文件（分公司）</span></a></li>
            <li><a class="ajax-link" href="SearchFile.jsp"><i class="icon-search"></i><span class="hidden-tablet"> 发文查询</span></a></li>
            <li><a class="ajax-link" href="GrantSituation.jsp"><i class=" icon-th-list"></i><span class="hidden-tablet"> 分发情况查询</span></a></li>
            <li><a class="ajax-link" href="ReadSituation.jsp"><i class="icon-eye-open"></i><span class="hidden-tablet"> 阅办情况查询 </span></a></li>
            <li><a class="ajax-link" href="Generate.jsp"><i class=" icon-print"></i><span class="hidden-tablet"> 生成阅办单</span></a></li>
            <li><a class="ajax-link" href="allFile.jsp" target="_blank"><i class=" icon-file"></i><span class="hidden-tablet"> 查看全部文件</span></a></li>
            <li class="nav-header hidden-tablet">用户管理</li>
            <li><a class="ajax-link" href="AddUser.jsp"><i class="icon-plus"></i><span class="hidden-tablet"> 添加用户</span></a></li>
            <li><a class="ajax-link" href="UserManage.jsp"><i class="icon-user"></i><span class="hidden-tablet"> 管理用户</span></a></li>
            <li class="nav-header hidden-tablet">系统</li>
            <li><a class="ajax-link" href="Setting.jsp"><i class="icon-edit"></i><span class="hidden-tablet"> 设置字段</span></a></li>
            <li><a class="ajax-link" href="ChangePass.jsp"><i class="icon-repeat"></i><span class="hidden-tablet"> 修改密码</span></a></li>
            <li><a class="ajax-link" href="logout.jsp"><i class="icon-share-alt"></i><span class="hidden-tablet"> 注销登录</span></a></li>
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