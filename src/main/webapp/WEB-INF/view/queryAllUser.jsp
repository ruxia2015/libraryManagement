<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: ZHAOBING
  Date: 2019-12-19
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>读者列表</title>
    <script src="${pageContext.request.contextPath}/AdminLTE-3.0.1/plugins/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/additional-methods.js"></script>
    <script src="${pageContext.request.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/localization/messages_zh.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE-3.0.1/plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE-3.0.1//dist/css/adminlte.min.css">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>

<script type="text/javascript">
    $(document).ready(function () {
        $("#pageSizeSelect").change(function () {
            $("#bookForm").submit();
        })
        $("#pageSizeSelect").val(${page.pageSize});
        $("#pageNo").val(1);
    })

    function goPage(pageNo) {
        $("#pageNo").val(pageNo);
        $("#bookForm").submit();
    }

    function refreshPage() {
        $("#pageNo").val(1);
        $("#pageSizeSelect").val(5);
        $("#queryUserName").val("");
        $("#bookForm").submit();
    }
    function skipPage1() {
        var skipPage = document.getElementById("skipPage").value;
        var patten = /^([1-9][0-9]*){1,20}$/;
        if(!patten.test(skipPage)){
            document.getElementById("skipPage").value="";
            return false;
        }else if(skipPage > ${pageCount}){

            return false;
        }
        return true;
    }

    function skipPageNo(){
        var skipPage =document.getElementById("skipPage").value;
        if(!skipPage1()){
            document.getElementById("skipPage").value="";
        }else {
            goPage(skipPage);
        }
    }
</script>

<body class="hold-transition sidebar-mini">

<div class="wrapper">
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>读者列表</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/book/index">首页</a></li>
                            <li class="breadcrumb-item active">读者列表</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
        <form id="bookForm" class="sel_btn" action="${pageContext.request.contextPath}/user/queryAllUser" method="post">
            <section class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">
                                        <div class="input-group">
                                            <a href="${pageContext.request.contextPath}/librarian/addUser" class="btn btn btn-default">新增用户</a>
                                            &nbsp; &nbsp; &nbsp; &nbsp;

                                        <input type="text" class="form-control" name="userName" id = "userName" placeholder="用户名" value="${userName}">
                                        &nbsp; &nbsp;
                                        <input type="submit" id="queryBtn" class="btn btn-sm btn-info" value="查询">
                                        &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                                        <input type="button" id="refreshing" class="btn btn-sm btn-info" onclick="refreshPage()" value="刷新">
                                </div>
                                </h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th>序号</th>
                                        <th>用户名</th>
                                        <th>电话</th>
                                        <th>创建时间</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id="dataPage">
                                        <c:if test="${!empty page.list}">
                                            <c:forEach items="${page.list}" var = "user" varStatus="u">
                                                <tr>

                                                    <td>${u.count}</td>
                                                    <td>${user.userName}</td>
                                                    <td>${user.phone}</td>
                                                    <td>
                                                        <fmt:formatDate value = "${user.createDate}" type = "date"/>
                                                    </td>
                                                    <td>
                                                    <a class="btn btn-info btn-sm" href="${pageContext.request.contextPath}/user/updateUser?id=${user.id}">
                                                        <i class="fas fa-pencil-alt">
                                                        </i>
                                                        编辑
                                                    </a>
                                                    <a class="btn btn-danger btn-sm" href="${pageContext.request.contextPath}/user/deleteUser?id=${user.id}">
                                                        <i class="fas fa-trash">
                                                        </i>
                                                        删除
                                                    </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${empty page.list}">
                                            <tr>
                                                <td  colspan="10">
                                                    很抱歉，未找到您要搜索的用户。
                                                </td>
                                            </tr>
                                        </c:if>
                                    </tbody>
                                </tbody>
                                </table>
                            </div>
                            <!-- /.card-body -->
                            <div class="card-footer clearfix">
                                <ul class="pagination pagination-sm m-0 float-left">
                                    <li class="page-item">
                                        每页数据条数： &nbsp;
                                        <select id="pageSizeSelect" name = "pageSize">
                                            <option selected="selected">5</option>
                                            <option>10</option>
                                            <option>2</option>
                                            <option>100</option>
                                        </select></li>
                                    <li class="page-item">&nbsp;&nbsp;&nbsp;总条数&nbsp;&nbsp;<span
                                            id="count">${page.totalNum}</span></li>
                                </ul>

                                <input type="hidden" value="1" name="pageNo" id="pageNo">
                                <ul class="pagination pagination-sm m-0 float-right" >

                                    <c:choose>
                                        <c:when test="${pageCount == 1}">
                                            <li class="page-item"><a class="page-link" style="background-color: #C0C0C0" class="page-link" onclick="goPage(${page.pageNo})">${page.pageNo}</a></li>
                                        </c:when>
                                        <c:when test="${page.pageNo == 1}">
                                            <li class="page-item"><input type="button" style="background-color: #C0C0C0" class="page-link" onclick="goPage(${page.pageNo})" value="${page.pageNo}"></li>
                                            <li class="page-item"><input type="button" class="page-link" onclick="goPage(${page.pageNo+1})" value="${page.pageNo+1}"></li>
                                            <li class="page-item"><input type="button" class="page-link" onclick="goPage(${pageCount})" value="尾页"></li>
                                        </c:when>
                                        <c:when test="${page.pageNo lt pageCount}">
                                            <li class="page-item"><input type="button" class="page-link" onclick="goPage(1)" value="首页"></li>
                                            <li class="page-item"><input type="button" class="page-link" onclick="goPage(${page.pageNo-1})" value="${page.pageNo-1}"></li>
                                            <li class="page-item"><input type="button" style="background-color: #C0C0C0" class="page-link" onclick="goPage(${page.pageNo})" value="${page.pageNo}"></li>
                                            <li class="page-item"><input type="button" class="page-link" onclick="goPage(${page.pageNo+1})" value="${page.pageNo+1}"></li>
                                            <li class="page-item"><input type="button" class="page-link" onclick="goPage(${pageCount})" value="尾页"></li>
                                        </c:when>
                                        <c:when test="${page.pageNo  ==  pageCount}">
                                            <li class="page-item"><input type="button" class="page-link" onclick="goPage(1)" value="首页"></li>
                                            <li class="page-item"><input type="button" class="page-link" onclick="goPage(${page.pageNo-1})" value="${page.pageNo-1}"></li>
                                            <li class="page-item"><input type="button" style="background-color: #C0C0C0" class="page-link" onclick="goPage(${page.pageNo})" value="${page.pageNo}"></li>
                                        </c:when>
                                    </c:choose>
                                <li>
                                    <input type="text" id="skipPage" onblur="skipPage1()" placeholder="有效的页码数">
                                </li>
                                <li>
                                    <input type="button" id="skipButton" class="btn btn-sm btn-info" onclick="skipPageNo()" value="跳转">
                                </li>
                                <li class="page-item">&nbsp;&nbsp;&nbsp;总页数&nbsp;&nbsp;<span
                                        id="pageNumCount">${pageCount}</span>
                                </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
    </div>
    </section>
    </form>
</div>
</div>

</body>

</html>
