<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery/jquery.min.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/jquery.validate.min.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/additional-methods.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/localization/messages_zh.js"></script>
    <script type="text/javascript">
        function pwd1() {
            var pwd = document.getElementById("pwd").value;
            var pattern = /^[A-Za-z0-9-]+$/;
            if (!pattern.test(pwd)) {
                $("#showPwd").html("数字、字母、-");
                $("#showPwd").css({
                    display:"",
                    "color":"red"
                });
                document.getElementById("pwd").value="";
                return false;
            }
            $("#showPwd").css({
                display: "none"
            });
            return true;
        }
        function phone1() {
            var phone = document.getElementById("phone").value;
            var pattern = / ^(13[0-9]|14[5|7]|15[0|1|2|3|4|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
            if (!pattern.test(phone)) {
                $("#showPhone").html("格式错误");
                $("#showPhone").css({
                    display:"",
                    "color":"red"
                });
                return false;
            }
            $("#showPhone").css({
                display: "none"
            });
            return true;

        }

        function submitForm2() {
            alert("11");
            if(!pwd1()){
                return false;
            }
            if(!phone1()){
                return false;
            }
            return true;
        }

    </script>
    <title>修改个人信息</title>
</head>

<body>
<div class="div_head">
    <h2>修改个人信息</h2>
</div>
<div class=" div_table">
    <form action="${rc.contextPath}/user/updateUserSucceed" onsubmit="return submitForm2();" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${user.id}">
        <table>
            <tr>
                <td width="100px"> 密码：</td>
                <td width="100px">
                    <input type="text" name="pwd" id ="pwd"  value="${user.userPassword}">
                    <span id = "showPwd"></span>
                </td>
            </tr>
            <tr>
                <td>电话：</td>
                <td>
                    <input type="text" name="phone" id="phone" value="${(user.phone)!""}">
                    <span id = "showPhone"></span>
                </td>
            </tr>
        </table>
        <p></p>
        <p></p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="submit" value="提交">&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="${rc.contextPath}/user/queryAllUser">返回首页</a>
    </form>
</div>
</body>
</html>