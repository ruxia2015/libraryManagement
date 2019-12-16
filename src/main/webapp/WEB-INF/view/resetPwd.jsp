<%--
  Created by IntelliJ IDEA.
  User: ZHAOBING
  Date: 2019-12-16
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>重置密码</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css"/>
    <script src="${pageContext.request.contextPath}/AdminLTE-3.0.1/plugins/jquery/jquery.min.js"></script>
</head>
<script type="text/javascript">
    var _contextPath = "${pageContext.request.contextPath}";
    function goLogin() {
        window.location.href = _contextPath + "/user/login";
    }
    function pwd11() {
        var pwd1 = document.getElementById("pwd1").value;
        var patten = /^[a-zA-Z0-9_]\w{3,21}$/;
        if(!patten.test(pwd1)){
            document.getElementById("showPwd1").innerText = "4-20位由字母、数字和下划线组成";
            document.getElementById("pwd1").innerText = "";
            return false;
        }
        document.getElementById("showPwd1").style.display = "none";
        return true;
    }
    function pwd22() {
        var pwd1 = document.getElementById("pwd1").value;
        var pwd2 = document.getElementById("pwd2").value;
        if(pwd2 == pwd1 ){
            document.getElementById("showPwd2").style.display = "none";
            return true;
        }else {
            document.getElementById("showPwd2").innerText = "两次密码不一样！";
            document.getElementById("pwd2").innerText = "";
            return false;
        }
    }

    function submitForm() {
        if(!pwd11()){
            return false;
        }
        if(!pwd22()){
            return false;
        }
        return  true;
    }

</script>
<body>
<form id="resetPwd" method="post" onsubmit=" return submitForm();" action="${pageContext.request.contextPath}/user/resetSucceed">
    <div>
        <input type="text"  style="display:none" name = "userId" value="${user.id}">
        新密码：<input type="password" id = "pwd1" onblur="pwd11()" name="pwd" >
    <span id ="showPwd1"></span>
        </br>
        确认密码：<input type="password" id = "pwd2" onblur="pwd22()" ><span id ="showPwd2"></span>
    </div>
    <div>
        <input type="submit" value="提交">
        <input type="button" onclick="goLogin()" value="返回登录界面">
    </div>
</form>
</body>
</html>
