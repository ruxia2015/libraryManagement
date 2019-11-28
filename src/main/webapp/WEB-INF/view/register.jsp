<%--
  Created by IntelliJ IDEA.
  User: ZHAOBING
  Date: 2019-11-27
  Time: 10:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/register.css"/>
    <script src="${pageContext.request.contextPath}/AdminLTE-3.0.1/plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/register.js"></script>
</head>
<script type="text/javascript" >
    function getbake() {
        window.history.back(-1)
    }

</script>
<body>
<div id="register">

    <form id="registerForm" method="post"  onsubmit="return submitForm();" action="${pageContext.request.contextPath}/user/registerMethod">
        <div>
            <p>
                <label class="label_input">用户名:</label>&nbsp<input type="text" placeholder="用户名" id="username" name="name" class="text_field" required/>
                <span id = "hint"></span>
            </p>
            <p><label class="label_input">密&nbsp&nbsp码:</label>&nbsp<input type="password"  placeholder="密码" name="psd" id="password" class="text_field"/></p>
            <p><label class="label_input">再一次密码:</label>&nbsp<input  placeholder="确认密码" type="password" name="psd2" id="password" class="text_field"/></p>
            <p><label class="label_input">电话:</label>&nbsp<input type="text"  placeholder="电话号码" name="phone" id="phone" class="text_field"/></p>
        </div>
        <div id="register_control";>
            <input type="submit" id="btn_register" value="注册" />
            <input type="button" id="btn_return" value="返回"  onclick="getbake();"/>
        </div>
    </form>
</div>

</body>
</html>
