<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>图书信息</title>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery/jquery.min.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/jquery.validate.min.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/additional-methods.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/localization/messages_zh.js"></script>

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

        function goPage(pageNo){
            var userName = $("#queryUser").val();
            $("#pageNum").val(pageNo);
            //pageNum-->pageSize  仍然取下拉列表中的值
            var obj =document.getElementById("pageSize");
            var pageSize = obj.options[obj.selectedIndex].value;
            refreshPage(pageNo,pageSize,userName);
        }

        function refreshBookPage(pageNo , pageSize, bookName) {
            var list = document.getElementById("dataBody");
            var html="";
            var index = 0;


            list.innerHTML = html;

        var listPage = document.getElementById("dataPage");
        var htmlPage="<tr>"

        if( pageNo != 1){
            htmlPage = htmlPage + "<td><button onclick='goPage(1)'>首页</button></td>"
            htmlPage = htmlPage + "<td><button   onclick='goPage("+(pageNo-1)+")'>"+(pageNo-1)+"</button></td>"
        }
        htmlPage = htmlPage + "<td>当前页"+pageNo+"</td>"
        if( pageNo != pageCount){
            htmlPage = htmlPage + "<td><button   onclick='goPage("+(pageNo+1)+")'>"+(pageNo+1)+"</button></td>"
            htmlPage = htmlPage + "<td><button onclick='goPage("+pageCount+")'>尾页</button></td>"
        }



        htmlPage = htmlPage+" <td>\n" +
            "                <label>总页数：</label><span id = \"pagesNum\"></span>\n" +
            "            </td>";
        htmlPage = htmlPage+" <td><input type=\"text\"  placeholder=\"跳转的页数\" id = \"selestPageNo\">\n" +
            "                        <input type=\"button\" onclick=\"skip();\" value=\"跳转\"></td>"
        htmlPage = htmlPage +  " </tr>"
        listPage.innerHTML = htmlPage;
        $("#pagesNum").text(resp.pageCount);

        }
        <#--function borrowBook() {-->
        <#--     window.location.href("${rc.contextPath}/book/borrowBook?id=${bookList.id}")-->
        <#--   -->
        <#--}-->

        function returnBook(id) {
            window.location.href = "${rc.contextPath}/book/returnBook?id="id;
        }
    </script>
</head>
<body>
<h2></h2>
<div id="div">
    <input type="hidden" value="1" name="pageno">
    <h1 style="text-align: center;">书库</h1>
    <form  id="bookForm" class="sel_btn" action="${rc.contextPath}/book/books" method="post">
        <label>图书分类</label>
            <select name="book_Type" onmousedown="if(this.options.length>3){this.size=6}" onblur="this.size=0" >
                <option value="0">全部</option>
                <#list bookTypeList as typeList>
                    <option value="${typeList.id}" >${typeList.bookTypeName}</option>
                </#list>
            </select>
        <input type="hidden" id = "pageNo" value="1">
        <label>每页数据条数：</label>
        <select id = "pageSize" >
            <option selected = "selected">5</option>
            <option >10</option>
            <option >2</option>
            <option >100</option>
        </select>
        <label>总条数：</label><span id = "count">${count}</span>
        <input type="text" id = "condition" placeholder="书名|作者">
        <input type="button" onclick="queruCondition()" value="查询">
    </form>
        <div style="margin: 0px auto; width: 700px;">
            <table border="1" cellspacing="0" cellpadding="0">
                <tr>
                    <td>序号</td>
                    <td>国际编码</td>
                    <td>图书名称</td>
                    <td>作者</td>
                    <td>图书分类</td>
                    <td>图书价格</td>
                    <td>图书总量</td>
                    <td>可借数量</td>
                    <td>详情</td>
                    <td>操作</td>
                </tr>
                <#list  booksList as bookList>
                    <tr>
                        <td>
                            ${bookList_index+1}
                        </td>
                        <td>${bookList.isbn}</td>
                        <td>${bookList.bookName}</td>
                        <td>${bookList.bookAuthor!""}</td>
                        <td>${bookList.bookType}</td>
                        <td>${bookList.bookPrice}元</td>
                        <td>${bookList.bookTotal}</td>
                        <td>${bookList.bookQuantity}</td>
                        <td>
                           <a href="${rc.contextPath}/book/particulars?id=${bookList.id}" >图书详情</a>
                        </td>
                        <#if bookList.bookQuantity == 0 >
                            <td>
                                <a href ="javascript:return false" style="opacity: 0.2">借阅</a>
                            </td>
                        <#elseif bookList.bookQuantity gte 0>
                            <td>
                                <a href="${rc.contextPath}/borrowBook/addBorrow?id=${bookList.id}" >借阅</a>
                            </td>
<#--                        </#if>-->
<#--                        <#if bookList.bookQuantity == bookList.bookTotal>-->
<#--                            <td>-->
<#--                                <input type="button" disabled="disabled" id = "returnBook" onclick="returnBook(${bookList.id})" value="还书">-->
<#--                            </td>-->
<#--                        <#elseif bookList.bookQuantity lt bookList.bookTotal>-->
<#--                            <td>-->
<#--                                <input type="button" id = "returnBook" onclick="returnBook(${bookList.id})" value="还书">-->
<#--                            </td>-->
                        </#if>

                    </tr>
                </#list>

            </table>
            <table>
                <thead id="dataPage">
                </thead>
            </table>

        </div>
            <a href="${rc.contextPath}/book/index" >返回首页</a>
            <a href="${rc.contextPath}/book/addBook" >新增书籍</a>
    </div>

</body>
</html>