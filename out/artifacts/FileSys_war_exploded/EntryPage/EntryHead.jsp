<%@page language="java" pageEncoding="GBK" %>
<div class="navbar">
    <div class="navbar-inner">
        <div class="container-fluid">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <a class="brand" href="#" style="width: 20%"><span>�ļ��İ����ϵͳ</span></a>


            <!-- user dropdown starts -->
            <div class="btn-group pull-right" >
                <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="icon-user"></i><span class="hidden-phone"><%=session.getAttribute("uname")%></span>
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="../logout.jsp">ע��</a></li>
                </ul>
            </div>
            <!-- user dropdown ends -->
            <div class="top-nav nav-collapse">
                <ul class="nav">
                    <li>
                    </li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </div>
</div>