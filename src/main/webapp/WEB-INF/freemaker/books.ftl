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

        // window.onload = function () {
        //     var pageNo = 1;
        //     var bookName = $("#condition").val();
        //     var obj =document.getElementById("pageSize");
        //     var pageSize = obj.options[obj.selectedIndex].value;
        //     obj.onchange = function(){
        //         //传入当前页数
        //         bookName = $("#condition").val();
        //         pageNo= 1;
        //         pageSize = obj.options[obj.selectedIndex].value;
        //         refreshPage(pageNo,pageSize,bookName);
        //     }
        //     refreshPage(pageNo,pageSize,bookName)
        //
        // }


        $(document).ready(function () {
            $("#pageSizeSelect").change(function () {
               $("#bookForm").submit();
            })
        })

        // function goPage(pageNo) {
        //     var userName = $("#condition").val();
        //     $("#pageNum").val(pageNo);
        //     //pageNum-->pageSize  仍然取下拉列表中的值
        //     var obj = document.getElementById("pageSize");
        //     var pageSize = obj.options[obj.selectedIndex].value;
        //     refreshPage(pageNo, pageSize, userName);
        // }
        //
        // function refreshBookPage(pageNo, pageSize, bookName) {
        //     var list = document.getElementById("dataBody");
        //     var html = "";
        //     var index = 0;
        //
        //
        //     list.innerHTML = html;
        //
        //     var listPage = document.getElementById("dataPage");
        //     var htmlPage = "<tr>"
        //
        //     if (pageNo != 1) {
        //         htmlPage = htmlPage + "<td><button onclick='goPage(1)'>首页</button></td>"
        //         htmlPage = htmlPage + "<td><button   onclick='goPage(" + (pageNo - 1) + ")'>" + (pageNo - 1) + "</button></td>"
        //     }
        //     htmlPage = htmlPage + "<td>当前页" + pageNo + "</td>"
        //     if (pageNo != pageCount) {
        //         htmlPage = htmlPage + "<td><button   onclick='goPage(" + (pageNo + 1) + ")'>" + (pageNo + 1) + "</button></td>"
        //         htmlPage = htmlPage + "<td><button onclick='goPage(" + pageCount + ")'>尾页</button></td>"
        //     }
        //
        //
        //     htmlPage = htmlPage + " <td>\n" +
        //         "                <label>总页数：</label><span id = \"pagesNum\"></span>\n" +
        //         "            </td>";
        //     htmlPage = htmlPage + " <td><input type=\"text\"  placeholder=\"跳转的页数\" id = \"selestPageNo\">\n" +
        //         "                        <input type=\"button\" onclick=\"skip();\" value=\"跳转\"></td>"
        //     htmlPage = htmlPage + " </tr>"
        //     listPage.innerHTML = htmlPage;
        //     $("#pagesNum").text(resp.pageCount);
        //
        // }

        <#--function borrowBook() {-->
        <#--     window.location.href("${rc.contextPath}/book/borrowBook?id=${bookList.id}")-->
        <#--   -->
        <#--}-->

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
            <input type="hidden" value="1" name="pageno">
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
                                            <select name="bookTypeId" class="form-control">
                                                <option value="">全部</option>
                                                <#list bookTypeList as bookType>
                                                    <option value="${bookType.id}"
                                                <#if bookTypeId?? && bookType.id ==bookTypeId>selected</#if> >${bookType.bookTypeName}</option>
                                                </#list>
                                            </select>
                                            &nbsp; &nbsp;
                                            <input type="text" class="form-control" name="bookName" value="${bookName}"
                                                   placeholder="书名|作者">
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
                                            <td>${bookList.bookType}</td>
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
                                            <select id="pageSizeSelect" >
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

<#--<div id="div">-->
<#--<input type="hidden" value="1" name="pageno">-->
<#--<h1 style="text-align: center;">书库</h1>-->
<#--&lt;#&ndash;<form id="bookForm" class="sel_btn" action="${rc.contextPath}/book/books" method="post">&ndash;&gt;-->
<#--<label>图书分类</label>-->
<#--<select name="book_Type" onmousedown="if(this.options.length>3){this.size=6}" onblur="this.size=0">-->
<#--<option value="0">全部</option>-->
<#--<#list bookTypeList as typeList>-->
<#--<option value="${typeList.id}" >${typeList.bookTypeName}</option>-->
<#--</#list>-->
<#--</select>-->
<#--<input type="hidden" id="pageNo" value="1">-->
<#--<label>每页数据条数：</label>-->
<#--<select id="pageSize">-->
<#--<option selected="selected">5</option>-->
<#--<option>10</option>-->
<#--<option>2</option>-->
<#--<option>100</option>-->
<#--</select>-->
<#--<label>总条数：</label><span id="count">${count}</span>-->
<#--<input type="text" id="condition" placeholder="书名|作者">-->
<#--<input type="button" onclick="queruCondition()" value="查询">-->
<#--&lt;#&ndash;</form>&ndash;&gt;-->
<#--<div style="margin: 0px auto; width: 1500px;">-->
<#--<table border="1" cellspacing="0" cellpadding="0">-->
<#--<tr>-->
<#--<td>序号</td>-->
<#--<td>国际编码</td>-->
<#--<td>图书名称</td>-->
<#--<td>作者</td>-->
<#--<td>图书分类</td>-->
<#--<td>图书价格</td>-->
<#--<td>图书总量</td>-->
<#--<td>可借数量</td>-->
<#--<td>详情</td>-->
<#--<td width="200px">操作</td>-->
<#--</tr>-->


<#--</table>-->
<#--<table>-->
<#--<thead id="dataPage">-->
<#--</thead>-->
<#--</table>-->

<#--</div>-->
<#--<a href="${rc.contextPath}/book/index">返回首页</a>-->

<#--</div>-->
<#--<div>-->
<#--<a href="${rc.contextPath}/book/addBook">新增书籍</a>-->

<#--</div>-->

</body>
</html>