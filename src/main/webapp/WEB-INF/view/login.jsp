<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>读者登录页面</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE-3.0.1/plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- icheck bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE-3.0.1/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE-3.0.1/dist/css/adminlte.min.css">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css"/>
    <script src="${pageContext.request.contextPath}/AdminLTE-3.0.1/plugins/jquery/jquery.min.js"></script>
</head>

<script type="text/javascript">
    var _contextPath = "${pageContext.request.contextPath}";
    // function register2() {
    //     window.location.href = _contextPath + "/user/register"
    // }
    //
    // function retrievePwd() {
    //     window.location.href = _contextPath + "/user/retrievePwd"
    // }
    // function goAdminLogin() {
    //     window.location.href = _contextPath + "/librarian/login"
    // }

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
        var userName = document.getElementById("userName").value;
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
            setCookie();
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


<body class="hold-transition login-page" οnlοad="getCookie();">
<div class="login-box">
    <div class="login-logo">
        <p id="image_logo"><img src="${pageContext.request.contextPath}/image/1.jpg" style="width:90px;height:50px;"></p>
        <a href="../../index2.html"><b>图书馆</b></a>
    </div>
    <!-- /.login-logo -->
    <div class="card">
        <div class="card-body login-card-body">
<%--            <p class="login-box-msg">管理员登录</p>--%>
<%--                <div>--%>
<%--                </div>--%>
<%--                <div id="login_control">--%>
<%--                    <input type="submit" id="btn_login" value="登录"  />--%>
<%--                    <input type="button" id="btn_enroll" value="注册" onclick="register2();"/>--%>
<%--                    <input type="button" id="btn_pwd" value="忘记密码" onclick="retrievePwd();"/>--%>
<%--                    <input type="button" id="btn_admin" value="管理员登录" onclick="goAdminLogin();"/>--%>
<%--                </div>--%>

            <form id="loginForm" method="post"  onsubmit="return submitForm();" action="${pageContext.request.contextPath}/user/sgin">
                <div class="input-group mb-3">
                    <input type="text" id="userName" name="name" onfocus="emptyName()"  class="form-control" placeholder="用户名">
                    <span id ="showName"></span>
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-envelope"></span>
                        </div>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <input type="password" name="psd" onfocus="emptyPwd()" id="password" class="form-control" placeholder="密码">
                    <span id = "showPwd"></span>
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span  class="fas fa-lock"></span>
                        </div>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <p>
                        <label class="label_input">验证码:</label>&nbsp;<input type="text" name="code" onfocus="showNo()" id= "code" style="width: 80px;" />
                        <img id="imgObj" alt="验证码" src="${pageContext.request.contextPath}/code/getCode">
                        <a href="#" onclick="changeImg()">换一张</a><br/>
                        <span id= "showCode" ></span>
                    </p>
                </div>

                <div class="row">
                    <div class="col-8">
                        <div class="icheck-primary">
                            <input type="checkbox" id="remember" name="jizhu">
                            <label for="remember">
                                记住密码
                            </label>
                        </div>
                    </div>
                    <!-- /.col -->
                    <div class="col-4">
                        <button type="submit" class="btn btn-primary btn-block">登录</button>
                    </div>
                    <!-- /.col -->
                </div>
            </form>
                <p class="mb-1">
                    <a href="${pageContext.request.contextPath}/user/retrievePwd">忘记密码</a>
                </p>
                <p class="mb-0">
                    <a href="${pageContext.request.contextPath}/user/register" class="text-center">注册</a>
                </p>

            <div class="social-auth-links text-center mb-3">
                <p>- OR -</p>
                <a href="${pageContext.request.contextPath}/librarian/login" class="btn btn-block btn-primary">
                    <i class="fab fa-facebook mr-2"></i> 管理员登录
                </a>
<%--                <a href="#" class="btn btn-block btn-danger">--%>
<%--                    <i class="fab fa-google-plus mr-2"></i> 忘记密码--%>
<%--                </a>--%>
            </div>
            <!-- /.social-auth-links -->


        </div>
        <!-- /.login-card-body -->
    </div>
</div>
<script type="text/javascript">
    //设置cookie  
    function setCookie(){
        var loginCode = $("#userName").val(); //获取用户名信息    
        var pwd = $("#password").val(); //获取登陆密码信息    
        var checked = $("input[type='checkbox']").is(':checked');//获取“是否记住密码”复选框  
        //console.log("setCookie方法是否记住密码："+checked);
        if(checked){ //判断是否选中了“记住密码”复选框    
            //设置cookie过期时间
            var date = new Date();
            date.setTime(date.getTime()+60*1000);//只能这么写，60表示60秒钟
            //console.log("cookie过期时间："+date);
            $.cookie("login_code",loginCode,{ expires: date, path: '/' });//调用jquery.cookie.js中的方法设置cookie中的用户名    
            $.cookie("pwd",$.base64.encode(pwd),{ expires: date, path: '/' });//调用jquery.cookie.js中的方法设置cookie中的登陆密码，并使用base64（jquery.base64.js）进行加密
        }else{
            $.cookie("login_code", null);
            $.cookie("pwd", null);
        }
    }

    //清除所有cookie函数
    function clearAllCookie() {
        var date=new Date();
        date.setTime(date.getTime()-10000);
        var keys=document.cookie.match(/[^ =;]+(?=\=)/g);
        console.log("需要删除的cookie名字："+keys);
        if (keys) {
            for (var i =  keys.length; i--;)
                document.cookie=keys[i]+"=0; expire="+date.toGMTString()+"; path=/";
        }
    }
    //获取cookie    
    function getCookie(){
        var loginCode = $.cookie("login_code"); //获取cookie中的用户名    
        var pwd =  $.cookie("pwd"); //获取cookie中的登陆密码  
        console.log("获取cookie:账户："+loginCode);
        console.log("获取cookie:密码："+pwd);
        if (!loginCode||loginCode==0) {
            console.log("账户："+!loginCode);
            //alert("请输出内容！");
        }else{
            $("#userName").val(loginCode);
        }
        if(!pwd||pwd==0){
            console.log("密码："+!pwd);
        }else{
            //密码存在的话把密码填充到密码文本框    
            //console.log("密码解密后："+$.base64.decode(pwd));
            $("#password").val($.base64.decode(pwd));
            //密码存在的话把“记住用户名和密码”复选框勾选住    
            $("[name='jizhu']").attr("checked","true");
        }

    } 

</script>

</body>
</html>

