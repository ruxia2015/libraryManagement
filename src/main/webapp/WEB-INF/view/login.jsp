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

<script>
    var _contextPath = "${pageContext.request.contextPath}";//js文件中无法使用jsp中的该对象，故在此处定一个变量，以便login.js文件引用
    //错误信息提示，error由后台返回
    <c:if test="${not empty error}">
    alert("${error}")
    </c:if>
</script>
<script type="text/javascript">
    function register2() {
        window.location.href = _contextPath + "/user/register"
    }

    function selectUsers2() {
        window.location.href = _contextPath + "/user/selectUsers"
    }
</script>


<body>
<div id="login_frame">

    <p id="image_logo"><img src="${pageContext.request.contextPath}/image/1.jpg" style="width:90px;height:50px;"></p>
    <form id="loginForm" method="post"  onsubmit="return submitForm();" action="${pageContext.request.contextPath}/user/sgin">
        <div>
            <p><label class="label_input">用户名:</label>&nbsp<input type="text" id="username" name="name" class="text_field" required/></p>
            <p><label class="label_input">密&nbsp&nbsp码:</label>&nbsp<input type="password" name="psd" id="password" class="text_field"/></p>
        </div>
        <div id="login_control">
            <input type="submit" id="btn_login" value="登录"  />
            <input type="button" id="btn_enroll" value="注册" onclick="register2();"/>
            <a id="forget_pwd" href="forget_pwd.html">忘记密码？</a>
        </div>
        <div>
            <input type="button" id="selectUsers" value="读者查询" onclick="selectUsers2()"/>
        </div>
    </form>
</div>

</body>
</html>

