<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录页面</title>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css"/>
    <script src="${pageContext.request.contextPath}/AdminLTE-3.0.1/plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/login.js"></script>
</head>

<script type="text/javascript">
    var _contextPath = "${pageContext.request.contextPath}";
    function register2() {
        window.location.href = _contextPath + "/user/register"
    }

    function retrievePwd() {
        window.location.href = _contextPath + "/user/retrievePwd"
    }

    function emptyName() {
        document.getElementById("showName").style.display = "none";
    }
    function emptyPwd() {
        document.getElementById("showPwd").style.display = "none";
    }

    function submitForm() {
        var userName = document.getElementById("username").value;
        var passWord = document.getElementById("password").value;
        if(userName == null || userName == ""){
            document.getElementById("showName").style.display = "";
            document.getElementById("showName").innerText = "账号不能为空";
            document.getElementById("showName").style.color = "red";
            return false;
        }
        if(passWord == null || passWord == ""){
            document.getElementById("showPwd").style.display = "";
            document.getElementById("showPwd").innerText="密码不能为空";
            document.getElementById("showPwd").style.color = "red";
            return false;
        }
        document.getElementById("showName").style.display = "none";
        document.getElementById("showPwd").style.display = "none";
            return true;
    }
</script>


<body>
<div id="login_frame">

    <p id="image_logo"><img src="${pageContext.request.contextPath}/image/1.jpg" style="width:90px;height:50px;"></p>
    <form id="loginForm" method="post"  onsubmit="return submitForm();" action="${pageContext.request.contextPath}/user/sgin">
        <div>
            <p>
                <label class="label_input">用户名:</label>&nbsp<input type="text" id="username" onfocus="emptyName()" name="name" class="text_field"/><span id = "showName"></span>
            </p>
            <p><label class="label_input">密&nbsp&nbsp码:</label>&nbsp<input type="password" name="psd" onfocus="emptyPwd()" id="password" class="text_field"/><span id = "showPwd"></span></p>
        </div>
        <div id="login_control">
            <input type="submit" id="btn_login" value="登录"  />
            <input type="button" id="btn_enroll" value="注册" onclick="register2();"/>
            <input type="button" id="btn_pwd" value="忘记密码" onclick="retrievePwd();"/>
        </div>
    </form>
</div>

</body>
</html>

