<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery/jquery.min.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/jquery.validate.min.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/additional-methods.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/localization/messages_zh.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#updateBookForm").validate({
                // debug:true,
                rules:{
                    bookIsbn:{
                        required:true
                    },
                    bookName:{
                        required:true
                    },
                    bookAuthor:{
                        required:true
                    },
                    bookParticulars:{
                        required:true
                    },
                    bookPrice:{
                        price:true
                    },
                    bookTotal:{
                        total:true
                    },
                    bookQuantity:{
                        range:[0,document.getElementById("bookTotal").value]
                    }

                },
                messages:{
                    bookIsbn:{
                        required:"不能为空"
                    },
                    bookName:{
                        required:"不能为空"
                    },
                    bookAuthor:{
                        required:"不能为空"
                    },
                    bookParticulars:{
                        required:"不能为空"
                    },
                    bookPrice:{
                        price:"请输入最多2位小数的数字"
                    },
                    bookTotal:{
                        total:"请输入非0的数字"
                    },
                    bookQuantity:{
                        range:"不能大于总数"
                    }
                },
            })
        $.validator.addMethod("price",function (value,element) {
            var tal =  /^([1-9][0-9]*)+(\.[0-9]{1,2})?$/;
            return this.optional(element) || (tal.test(value));
        },"最多2位小数的数字");
        $.validator.addMethod("total",function (value,element) {
            var tal = /^([1-9][0-9]*){1,20}$/;
            return this.optional(element) || (tal.test(value));
        },"非0的数字");
        })
    </script>
    <title>修改书籍</title>
</head>

<body>
<div class="div_head">
    <h2>修改书籍</h2>
</div>
<div class=" div_table">
    <form  id="updateBookForm"  action="${rc.contextPath}/book/updateBookSucceed" method="post"  enctype="multipart/form-data">
        <input type="hidden" name="id" value="${books.id}">
        <table>
            <tr>
                <td width="100px"> 国际编码：</td>
                <td width="100px"><input type="text" name="bookIsbn" placeholder="数字" value="${books.bookIsbn}" required></td>
            </tr>
            <tr>
                <td>书&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
                <td><input type="text" name="bookName" value="${books.bookName}" required></td>
            </tr>
            <tr>
                <td>作&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;者：</td>
                <td><input type="text" name="bookAuthor" value="${(books.bookAuthor)!""}" required></td>
            </tr>
            <tr>
                <td>图书详情：</td>
                <td><textarea name="bookParticulars" required>${books.bookParticulars}</textarea></td>
            </tr>
            <tr>
                <td>图书封面：</td>
                <td>
                    <input type="hidden" name="bookPicture" value="${(books.bookPicture)!""}">
                    <input type="file" name="file" value="${(books.bookPicture)!""}">
                    <#if books.bookPicture??>
                        <img width="100" height="200" src="${(rc.contextPath)+"/"+(books.bookPicture)!""}">
                    </#if>
                </td>
            </tr>
            <tr>
                <td> 图书类别：</td>
                <td>
                    <select name="bookTypeId">
                        <#list bookTypeList as bookType>
                            <#if  books.bookTypeName == bookType.bookTypeName >
                                <option selected="selected" value="${bookType.id}">${bookType.bookTypeName}</option>
                           </#if>
                        <option  value="${bookType.id}">${bookType.bookTypeName}</option>
                        </#list>
                    </select>
                </td>
            </tr>
            <tr>
                <td>图书价格：</td>
                <td><input type="text" name="bookPrice" placeholder="数字" value="${books.bookPrice?c}"></td>
            </tr>
            <tr>
                <td>图书总量：</td>
                <td><input type="text" id="bookTotal" name="bookTotal" placeholder="数字" value="${books.bookTotal?c}"></td>
            </tr>
            <tr>
                <td>  可借数量：</td>
                <td><input type="text" name="bookQuantity" placeholder="数字" value="${books.bookQuantity?c}" ></td>
            </tr>
        </table>
        <p></p>
        <p></p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="submit" value="提交">&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="${rc.contextPath}/book/books">返回首页</a>
    </form>
</div>
</body>
</html>