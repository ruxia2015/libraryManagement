<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery/jquery.min.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/jquery.validate.min.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/additional-methods.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/localization/messages_zh.js"></script>
    <title></title>
    <script  type="text/javascript">
        var s = 3;
        var intervalid;
        intervalid = setInterval("fun()", 1000);
        function fun() {
            if (s == 0) {
                window.location.href = "${rc.contextPath}/user/workbench/a";
                clearInterval(intervalid);
            }
            document.getElementById("mes").innerHTML = s;
            s--;
        }
        </script>
</head>
<body>
    <#if i ==1  && y ==1 >
        还书成功
        <p>将在 <span id="mes">3</span> 秒钟后返回借阅信息界面！</p>
        <#else >
        还书失败！ 请稍后重试
         <p>将在 <span id="mes">2</span> 秒钟后返回借阅信息界面！</p>
    </#if>

</body>
</html>