<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录页面</title>

    <link rel="stylesheet" type="text/css" href="login.css"/>
    <script type="text/javascript" src="login.js"></script>
</head>

<body>
<div id="login_frame">

    <p id="image_logo"><img src="../image/1.jpg" style="width:90px;height:50px;"></p>
    <form method="post" >
        <div>
            <p><label class="label_input">用户名:</label>&nbsp<input type="text" id="username" class="text_field"/></p>
            <p><label class="label_input">密&nbsp&nbsp&nbsp码:</label>&nbsp<input type="text" id="password" class="text_field"/></p>
        </div>
        <div id="login_control">
            <input type="button" id="btn_login" value="登录" οnclick="login();"/>&nbsp&nbsp&nbsp&nbsp
            <a id="forget_pwd" href="forget_pwd.html">忘记密码？</a>
        </div>
    </form>
</div>

</body>
</html>

