<%--
  Created by IntelliJ IDEA.
  User: ZHAOBING
  Date: 2019-12-16
  Time: 14:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css"/>
    <script src="${pageContext.request.contextPath}/AdminLTE-3.0.1/plugins/jquery/jquery.min.js"></script>
    <title>错误提示</title>
</head>

<script type="text/javascript">
    var _contextPath = "${pageContext.request.contextPath}";
    function retrievePwd() {
        window.location.href = _contextPath + "/user/retrievePwd";
    }
    function goLogin() {
        window.location.href = _contextPath + "/user/login";
    }
</script>
<body>
<div>
    <p>你输入的账户名或密码不正确，要找回密码吗？</p>
    <p>错误原因可能是：未区分大小写</p>
    <p>如果你的密码丢失或遗忘，可以点击下方“找回密码”按钮</p>
</div>
<div>
    <input type="button" id = "pws_button" value="找回密码" onclick="retrievePwd()">
    <input type="button" id = "cancel" onclick="goLogin()" value = "返回登录">
</div>
</body>
</html>
