<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery/jquery.min.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/jquery.validate.min.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/additional-methods.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/localization/messages_zh.js"></script>
    <script type="text/javascript">

    </script>
    <title>修改书籍</title>
</head>

<body>
<div class="div_head">
    <h2>修改书籍</h2>
</div>
<div class=" div_table">
    <form action="${rc.contextPath}/book/updateBookSucceed" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${books.id}">
        <table>
            <tr>
                <td width="100px"> 国际编码：</td>
                <td width="100px"><input type="text" name="bookIsbn" placeholder="数字" value="${books.bookIsbn}"></td>
            </tr>
            <tr>
                <td>书&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
                <td><input type="text" name="bookName" value="${books.bookName}"></td>
            </tr>
            <tr>
                <td>作&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;者：</td>
                <td><input type="text" name="bookAuthor" value="${books.bookAuthor}"></td>
            </tr>
            <tr>
                <td>图书详情：</td>
                <td><textarea name="bookParticulars">${books.bookParticulars}</textarea></td>
            </tr>
            <tr>
                <td>图书封面：</td>
                <td>
                    <input type="file" name="file" value="${books.bookPicture}">
<#--                    <img width="100px" height="200px" src="${rc.contextPath}/${book.bookPicture}"!"">-->
                </td>
            </tr>
            <tr>
                <td> 图书类别：</td>
                <td>
                    <select name="bookType">
                        <#list bookTypeList as list>
                            <option  value="${list.bookTypeName}">${list.bookTypeName}</option>
                        </#list>
                        <option selected="selected">${books.bookType}</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>图书价格：</td>
                <td><input type="text" name="bookPrice" placeholder="数字" value="${books.bookPrice}"></td>
            </tr>
            <tr>
                <td>图书总量：</td>
                <td><input type="text" name="bookTotal" placeholder="数字" value="${books.bookTotal}"></td>
            </tr>
            <tr>
                <td>  可借数量：</td>
                <td><input type="text" name="bookQuantity" placeholder="数字" value="${books.bookQuantity}" ></td>
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