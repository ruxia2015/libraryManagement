<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>图书详情</title>
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
<div>
    <img src="${rc.contextPath}/image/骆驼祥子.jpg">
    <textarea >${book.booksParticulars}</textarea>
</div>
<div>
   <input type="button" onclick="goBack()" value="返回">
</div>
</body>
</html>