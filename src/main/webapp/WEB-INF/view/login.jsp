<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录页面</title>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css"/>
    <script src="${pageContext.request.contextPath}/AdminLTE-3.0.1/plugins/jquery/jquery.min.js"></script>
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

    function verifyCode() {
        var fal = false;
        var code = document.getElementById("code").value;

        $.ajax({
            url:"${pageContext.request.contextPath}/code/checkCode",
            async:false,
            dataType:"json",
            data:{"code":code},
            success:function (req) {
                if(req == 1){
                    document.getElementById("showCode").innerText="";
                    fal =  true;
                }else if(req == 2){
                    document.getElementById("code").value="";
                    document.getElementById("showCode").innerText="验证错误";
                    fal =  false;
                }else {
                    document.getElementById("code").value="";
                    document.getElementById("showCode").innerText="验证码为空";
                    fal =  false;
                }

            }

        })
        return fal;
    }

    function showNo() {
        document.getElementById("showCode").innerText="";
    }
    
    function submitForm() {
        if(!verifyCode()){
            return false;
        }
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
    function changeImg() {
        var imgSrc = $("#imgObj");
        var src = imgSrc.attr("src");
        imgSrc.attr("src", chgUrl(src));
    }

    // 时间戳
    // 为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳
    function chgUrl(url) {
        var timestamp = (new Date()).valueOf();
        // alert(timestamp);
        // url = url.substring(0, 100);
        var i = url.indexOf("?");
        if(i>0){
            url = url.substring(0, url.indexOf("?"));
        }
        if ((url.indexOf("&") >= 0)) {
            url = url + "×tamp=" + timestamp;
        } else {
            url = url + "?timestamp=" + timestamp;
        }
        return url;
    }

</script>


<body>
<div id="login_frame">
    <p id="image_logo"><img src="${pageContext.request.contextPath}/image/1.jpg" style="width:90px;height:50px;"></p>
    <form id="loginForm" method="post"  onsubmit="return submitForm();" action="${pageContext.request.contextPath}/user/sgin">
        <div>
            <p>
<%--                class="text_field"--%>
                <label class="label_input">用户名:</label>&nbsp;<input type="text" id="username" onfocus="emptyName()" name="name" /><span id = "showName"></span>
            </p>
            <p>
                <label class="label_input">密&nbsp&nbsp码:</label>&nbsp;<input type="password" name="psd" onfocus="emptyPwd()" id="password" /><span id = "showPwd"></span>
            </p>
            <p>
                <label class="label_input">验证码:</label>&nbsp;<input type="text" name="code" onfocus="showNo()" id= "code" style="width: 80px;" />
                <img id="imgObj" alt="验证码" src="${pageContext.request.contextPath}/code/getCode">
                <a href="#" onclick="changeImg()">换一张</a><br/>
                <span id= "showCode" ></span>
            </p>
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

