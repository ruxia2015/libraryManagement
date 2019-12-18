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

<body>
<table>
    <tr>
        <td>序号</td>
        <td>借书人</td>
        <td>书名</td>
        <td>开始时间：</td>
        <td>预计返回时间：</td>
    </tr>
    <tr>
        <#list userList as list>
            <td>
                ${list_index+1}
            </td>
            <td>
                ${list.userName}
            </td>
            <td>
                ${list.borrowList[list_index].bookName}
            </td>
            <td>
                ${list.borrowList[list_index].startDate?string('yyyy-MM-dd')}
            </td>
            <td>
                ${list.borrowList[list_index].returnDate?string('yyyy-MM-dd')}
            </td>
        </#list>
    </tr>
</table>
</body>
</html>