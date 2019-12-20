<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery/jquery.min.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/jquery.validate.min.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/additional-methods.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/localization/messages_zh.js"></script>

    <script  type="text/javascript">
        var s = 3;
        var intervalid;
        intervalid = setInterval("fun()", 1000);
        function fun() {
            if (s == 0) {
                window.location.href = "/book/books";
                clearInterval(intervalid);
            }
            document.getElementById("mes").innerHTML = s;
            s--;
        }
    </script>
</head>

<body>
<#if i ==1 >
    修改成功
<#else >
    修改成功！请稍后重试
</#if>
<p>将在 <span id="mes">3</span> 秒钟后返回图书界面！</p>
</body>
</html>