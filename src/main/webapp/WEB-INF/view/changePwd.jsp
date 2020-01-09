<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: ZHAOBING
  Date: 2019-12-16
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>重置密码</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/register.css"/>
    <script src="${pageContext.request.contextPath}/AdminLTE-3.0.1/plugins/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/additional-methods.js"></script>
    <script src="${pageContext.request.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/localization/messages_zh.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/register.js"></script>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE-3.0.1/plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Tempusdominus Bbootstrap 4 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE-3.0.1/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE-3.0.1/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- JQVMap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE-3.0.1/plugins/jqvmap/jqvmap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE-3.0.1/dist/css/adminlte.min.css">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE-3.0.1/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE-3.0.1/plugins/daterangepicker/daterangepicker.css">
    <!-- summernote -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE-3.0.1/plugins/summernote/summernote-bs4.css">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css"/>
    <script src="${pageContext.request.contextPath}/AdminLTE-3.0.1/plugins/jquery/jquery.min.js"></script>
</head>
<script type="text/javascript">
    var _contextPath = "${pageContext.request.contextPath}";
    function goBack() {
        window.location.href = _contextPath + "/book/index";
    }
    function pwd11() {
        var pwd1 = document.getElementById("pwd1").value;
        var patten = /^[a-zA-Z0-9_]\w{3,21}$/;
        if(!patten.test(pwd1)){
            document.getElementById("showPwd1").innerText = "4-20位由字母、数字和下划线组成";
            document.getElementById("pwd1").innerText = "";
            return false;
        }
        document.getElementById("showPwd1").style.display = "none";
        return true;
    }
    function pwd22() {
        var pwd1 = document.getElementById("pwd1").value;
        var pwd2 = document.getElementById("pwd2").value;
        if(pwd2 == pwd1 ){
            document.getElementById("showPwd2").style.display = "none";
            return true;
        }else {
            document.getElementById("showPwd2").innerText = "两次密码不一样！";
            document.getElementById("pwd2").innerText = "";
            return false;
        }
    }

    function submitForm() {
        if(!pwd11()){
            return false;
        }
        if(!pwd22()){
            return false;
        }
        return  true;
    }

</script>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
    <jsp:include page="include/head.jsp"/>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->


    <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <!-- Brand Logo -->
        <a href="index3.html" class="brand-link">
            <img src="${pageContext.request.contextPath}/AdminLTE-3.0.1/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
                 style="opacity: .8">
            <span class="brand-text font-weight-light">AdminLTE 3</span>
        </a>

        <!-- Sidebar -->
        <div class="sidebar">
            <!-- Sidebar user panel (optional) -->
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <div class="image">
                    <img src="${pageContext.request.contextPath}/AdminLTE-3.0.1/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
                </div>
                <div class="info">
                    <a href="#" class="d-block">Alexander Pierce</a>
                </div>
            </div>

            <!-- Sidebar Menu -->
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                    <!-- Add icons to the links using the .nav-icon class
                         with font-awesome or any other icon font library -->
                    <li class="nav-item has-treeview menu-open">
                        <a href="#" class="nav-link active">
                            <i class="nav-icon fas fa-tachometer-alt"></i>
                            <p>
                                首页
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/book/index" class="nav-link ">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>首页</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/librarian/changePwd" class="nav-link active">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>修改密码</p>
                                </a>
                            </li>

                        </ul>
                    </li>
                </ul>
            </nav>
            <!-- /.sidebar-menu -->
        </div>
        <!-- /.sidebar -->
    </aside>


    <div class="content-wrapper">
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <form id="resetPwd" method="post" onsubmit=" return submitForm();" action="${pageContext.request.contextPath}/librarian/changePwdSucceed">
                            <div>
                                <input type="text"  style="display:none" name = "id" value="${librarian.id}">
                                新密码：<input type="password" id = "pwd1" onblur="pwd11()" name="pwd" >
                                <span id ="showPwd1"></span>
                                </br>
                                确认密码：<input type="password" id = "pwd2" onblur="pwd22()" ><span id ="showPwd2"></span>
                            </div>
                            <div>
                                <input type="submit" value="提交">
                                <input type="button" onclick="goBack()" value="返回首页">
                            </div>
                        </form>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <%--                            <li class="breadcrumb-item user">${sessionScope.user.etUserName} </li>--%>
                            <li class="breadcrumb-item"><a href="#">首页</a></li>
                            <li class="breadcrumb-item ">工作台</li>
                        </ol>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
    </div>
</div>

</body>
</html>
