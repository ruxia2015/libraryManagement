<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>图书信息</title>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery/jquery.min.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/jquery.validate.min.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/additional-methods.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/localization/messages_zh.js"></script>


    <link rel="stylesheet" href="${rc.contextPath}/AdminLTE-3.0.1/plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${rc.contextPath}/AdminLTE-3.0.1//dist/css/adminlte.min.css">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

    <script TYPE="text/javascript">
        $(document).ready(function () {
            $("#bookTypeId").change(function () {
               $("#bookForm").submit();
            })
            $("#pageSizeSelect").change(function () {
                $("#bookForm").submit();
            })
        })

        function returnBook(id) {
            window.location.href = "${rc.contextPath}/book/returnBook?id="+id;
        }
    </script>
</head>
<body class="hold-transition sidebar-mini">

<div class="wrapper">
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>图书列表</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">首页</a></li>
                            <li class="breadcrumb-item active">图书列表</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
        <form id="bookForm" class="sel_btn" action="${rc.contextPath}/book/books" method="get">
            <input type="hidden" value="0" name="pageNo">
            <section class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">
                                        <div class="input-group">
                                            <a href="${rc.contextPath}/book/addBook" class="btn btn btn-default">新增书本</a>
                                            &nbsp; &nbsp; &nbsp; &nbsp;
                                            <label class="col-form-label">图书分类</label>
                                            &nbsp; &nbsp;
                                            <select name="bookTypeId" id ="bookTypeId" class="form-control">
                                                <option value="">全部</option>
                                                <#list bookTypeList as bookType>
                                                    <option value="${bookType.id}"
                                                <#if bookTypeId?? && bookType.id ==bookTypeId>selected</#if> >${bookType.bookTypeName}</option>
                                                </#list>
                                            </select>
                                            &nbsp; &nbsp;
                                            <input type="text" class="form-control" name="queryName" id = "queryName" placeholder="书名|作者">
                                            &nbsp; &nbsp;
                                            <input type="submit" id="queryBtn" class="btn btn-sm btn-info" value="查询">
                                        </div>
                                    </h3>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>序号</th>
                                            <th>国际编码</th>
                                            <th>图书名称</th>
                                            <th>作者</th>
                                            <th>图书分类</th>
                                            <th>图书价格</th>
                                            <th>图书总量</th>
                                            <th>可借数量</th>
                                            <th>详情</th>
                                            <th>操作</th>

                                        </tr>
                                        </thead>
                                        <tbody id="dataPage">
                                        <#list  booksList as bookList>
                                            <tr>
                                            <td>
                                            ${bookList_index+1}
                                            </td>
                                            <td>${bookList.bookIsbn}</td>
                                            <td>${bookList.bookName}</td>
                                            <td>${bookList.bookAuthor!""}</td>
                                            <td>${bookList.bookTypeName}</td>
                                            <td>${bookList.bookPrice}元</td>
                                            <td>${bookList.bookTotal}</td>
                                            <td>${bookList.bookQuantity}</td>
                                            <td>
                                        <a href="${rc.contextPath}/book/particulars?id=${bookList.id}" >图书详情</a>
                                            </td>

                                            <td>
                                            <#if bookList.bookQuantity == 0 >
                                                <a class="btn btn-primary btn-sm disabled" href="${rc.contextPath}/borrowBook/addBorrow?id=${bookList.id}"">
                                                <i class="fas fa-folder">
                                                </i>
                                                借阅
                                                </a>
                                            <#elseif bookList.bookQuantity gte 0>
                                                <a class="btn btn-primary btn-sm " href="${rc.contextPath}/borrowBook/addBorrow?id=${bookList.id}"">
                                                <i class="fas fa-folder">
                                                </i>
                                                借阅
                                                </a>
                                            </#if>

                                        <a
                                        class="btn btn-info btn-sm" href="${rc.contextPath}/book/updateBook?id=${bookList.id}">
                                                <i class="fas fa-pencil-alt">
                                                </i>
                                                编辑
                                            </a>
                                        <a
                                        class="btn btn-danger btn-sm" href="${rc.contextPath}/book/delectBook?id=${bookList.id}">
                                            <i class="fas fa-trash">
                                            </i>
                                            删除
                                            </a>

                                            </td>
                                            </tr>
                                        </#list>

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
                                                    id="count">${count}</span></li>

                                    </ul>

                                    <ul class="pagination pagination-sm m-0 float-right" id="pageNumber">
                                        <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
                                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                        <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                                        <li class="page-item">&nbsp;&nbsp;&nbsp;总页数&nbsp;&nbsp;<span
                                                    id="pageNumCount">${pageNumCount}</span></li>
                                    </ul>

                                </div>
                            </div>
                            <!-- /.card -->


                            <!-- /.card -->
                        </div>
                        <!-- /.col -->
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->

                </div><!-- /.container-fluid -->
            </section>
        </form>
    </div>
</div>


</body>
</html>