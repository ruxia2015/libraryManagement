<%--
  Created by IntelliJ IDEA.
  User: ZHAOBING
  Date: 2019-12-16
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>找回密码</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css"/>
    <script src="${pageContext.request.contextPath}/AdminLTE-3.0.1/plugins/jquery/jquery.min.js"></script>
</head>
<script type="text/javascript">
    var _contextPath = "${pageContext.request.contextPath}";
    function goLogin() {
        window.location.href = _contextPath + "/user/login";
    }
</script>
<body>
<form id="registerForm" method="post"  action="${pageContext.request.contextPath}/user/retrievePassword">
    <div>
          请输入账号：<input type="text" id = "userName" name="userName" placeholder="登录账号" required="required"/>
        请输入手机号：<input type="text" id = "phone" name="phone" placeholder="手机号" required="required"/>
    </div>
    <div>
        <input type="submit" id = "verity"  value = "验证">
        <input type="button" onclick="goLogin()" value="返回登录界面">
    </div>
    </form>
</body>
</html>
