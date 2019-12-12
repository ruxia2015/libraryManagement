<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>添加书籍</title>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery/jquery.min.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/jquery.validate.min.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/additional-methods.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/localization/messages_zh.js"></script>
    <script type="text/javascript">

    </script>
    <style>
        .div_head{
            margin:0 auto;
            width:100px;
        }
        .div_table{
            margin:0 auto;
            width:300px;
        }
    </style>
</head>

<body>
<div class="div_head">
    <h2>新增书籍</h2>
</div>
<div class=" div_table">
    <form action="${rc.contextPath}/book/addBookSucceed" method="post" enctype="multipart/form-data">
        <table>
            <tr>
                <td width="100px"> 国际编码：</td>
                <td width="100px"><input type="text" name="bookIsbn" placeholder="数字"></td>
            </tr>
            <tr>
                <td>书&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
                <td><input type="text" name="bookName"></td>
            </tr>
            <tr>
                <td>作&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;者：</td>
                <td><input type="text" name="bookAuthor"></td>
            </tr>
            <tr>
                <td>图书详情：</td>
                <td><textarea name="bookParticulars"></textarea></td>
            </tr>
            <tr>
                <td>图书封面：</td>
                <td>
                    <input type="file" name="file">
                </td>
            </tr>
            <tr>
                <td> 图书类别：</td>
                <td>
                    <select name="bookType">
                        <#list bookTypeList as list>
                            <option  value="${list.bookTypeName}">${list.bookTypeName}</option>
                        </#list>
                    </select>
                </td>
            </tr>
            <tr>
                <td>图书价格：</td>
                <td><input type="text" name="bookPrice" placeholder="数字"></td>
            </tr>
            <tr>
                <td>图书总量：</td>
                <td><input type="text" name="bookTotal" placeholder="数字"></td>
            </tr>
            <tr>
                <td>  可借数量：</td>
                <td><input type="text" name="bookQuantity" placeholder="数字"></td>
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