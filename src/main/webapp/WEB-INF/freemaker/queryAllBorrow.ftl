<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery/jquery.min.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/jquery.validate.min.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/additional-methods.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/localization/messages_zh.js"></script>

    <link rel="stylesheet" href="${rc.contextPath}/AdminLTE-3.0.1//plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="${rc.contextPath}/AdminLTE-3.0.1//dist/css/adminlte.min.css">
</head>

<script type="text/javascript">

    function refreshPage() {
        window.location.href = "${rc.contextPath}/borrowBook/queryAllBorrow";
    }

    function submitForm() {
        var userName = document.getElementById("userName").value;
        var bookName = document.getElementById("bookName").value;
        if ((userName == null || userName == "") && (bookName == null || bookName == "")) {
            return false
        } else {
            return true;
        }
    }
</script>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>借阅列表</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="${rc.contextPath}/book/index">首页</a></li>
                            <li class="breadcrumb-item active">借阅列表</li>
                        </ol>
                    </div>
                </div>
            </div>
        </section>
        <form method="post" class="sel_btn" onsubmit="return submitForm();" action="${rc.contextPath}/borrowBook/queryAllBorrow" id = "borrowByName" >
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">
                                    <div class="input-group">
                                        <input type="text" id="userName" name="userName" placeholder="借书人姓名"
                                               value="${(userName)!""}">
                                        &nbsp; &nbsp;
                                        <input type="text" id="bookName" name="bookName" placeholder="书名"
                                               value="${(bookName)!""}">
                                        &nbsp; &nbsp;
                                        <input type="submit" class="btn btn-sm btn-info" value="查询">
                                        &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                        <input type="button" class="btn btn-sm btn-info" onclick="refreshPage()"
                                               value="刷新">
                                    </div>
                                </h3>
                            </div>
                            <div class="card-body">
                                <table border="1" cellspacing="0" class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <td width="100">序号</td>
                                        <td width="100">借书人</td>
                                        <td width="100">书名</td>
                                        <td width="100">数量</td>
                                        <td width="150">开始时间</td>
                                        <td width="150">预计返回时间</td>
                                        <td width="150">实际返回时间</td>
                                        <td width="100">操作</td>
                                    </tr>
                                    </thead>
                                    <tbody id="dataPage">
                                    <#if borrowBookList?? && (borrowBookList?size > 0) >
                                    <#list borrowBookList as borrowBook>
                                        <tr>
                                            <td>
                                                ${borrowBook_index+1}
                                            </td>
                                            <td>
                                                ${borrowBook.userName}
                                            </td>
                                            <td>
                                                ${borrowBook.bookName}
                                            </td>
                                            <td>
                                                ${borrowBook.quantity}
                                            </td>
                                            <td>
                                                ${borrowBook.startDate?string('yyyy-MM-dd')}
                                            </td>
                                            <td>
                                                ${borrowBook.returnDate?string('yyyy-MM-dd')}
                                            </td>
                                            <td>
                                                ${(borrowBook.endDate?string('yyyy-MM-dd'))!""}
                                            </td>
                                            <td>
                                                <#if borrowBook.endDate??>
                                                    <a class="btn btn-primary btn-sm disabled"  href="${rc.contextPath}/borrowBook/returnBook?id=${borrowBook.id}">
                                                    <i class="fas fa-folder">
                                                    </i>
                                                    还书
                                                    </a>
                                                    <#else >
                                                        <a class="btn btn-primary btn-sm " href="${rc.contextPath}/borrowBook/returnBook?id=${borrowBook.id}">
                                                        <i class="fas fa-folder">
                                                        </i>
                                                        还书
                                                        </a>
                                                </#if>

                                            </td>
                                        </tr>
                                    </#list>
                                    <#else >
                                        <tr>
                                            <td  colspan="10">
                                                很抱歉，未找到您要搜索的借阅信息。
                                            </td>
                                        </tr>

                                    </#if>
                                    </tbody>
                                </table>
                            </div>
                            <div class="card-footer clearfix">
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