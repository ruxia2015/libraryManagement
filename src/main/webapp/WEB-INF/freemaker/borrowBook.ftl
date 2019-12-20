
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>借书单</title>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery/jquery.min.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/jquery.validate.min.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/additional-methods.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/localization/messages_zh.js"></script>

    <script type="text/javascript">
        function goBack() {
            window.history.back(-1);
        }
    </script>
</head>
<body>
<h2>借书单</h2>
<form action="${rc.contextPath}/borrowBook/succeedBorrow">
    <table>
        <tr>
            <td>借书人：</td>
            <td>
                <input readOnly="true"  type="text"  name="userName" value="${Session["user"].userName}">
            </td>
        </tr>
        <tr>
            <td>书名：</td>
            <td >
                <input readOnly="true"  type="text"  name="bookName" value="${book.bookName}">
            </td>
        </tr>
        <tr>
            <td>数量：</td>
            <td>
                <input readOnly="true"  type="text" name="quantity" value="1">
            </td>
        </tr>
        <tr>
            <td>开始时间：</td>
            <td>
                <input readOnly="true"  type="text" name="startDate" value="${date?string('yyyy-MM-dd')}">
            </td>
        </tr>
        <tr>
            <td>归还时间：</td>
            <td>
                <select name="returnDate">
                    <option selected="selected" value="${weekDate?string('yyyy-MM-dd')}">${weekDate?string('yyyy-MM-dd')}</option>
                    <option value="${monthDate?string('yyyy-MM-dd')}">${monthDate?string('yyyy-MM-dd')}</option>
                </select>
            </td>
        </tr>
    </table>
    <input type="submit" value="提交">
    <input type="button" onclick="goBack()" value="返回">
</form>
</body>
</html>