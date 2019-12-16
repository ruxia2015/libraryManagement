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
    <script src="${pageContext.request.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/additional-methods.js"></script>
    <script src="${pageContext.request.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/localization/messages_zh.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/register.js"></script>
</head>
<script type="text/javascript" >
    $(function(){
        $("#registerForm").validate({
            rules:{
                psd:{
                    required:true,
                    pwdLength:true

                },
                psd2:{
                    equalTo: "#password"
                },
                name:{
                    required:true,
                    remote:"${pageContext.request.contextPath}/user/notExists/userName"
                   /* <!-- 这种写法相当于
                     传入的data {
                      name: function() {  当前对象的name
                                return $(this).val();  当前对象的值
                            }
                     -->*/
                    <%--remote:{--%>
                        <%--url: "${pageContext.request.contextPath}/user/notExists/userName",     //后台处理程序--%>
                        <%--type: "post",               //数据发送方式--%>
                        <%--dataType: "json",           //接受数据格式--%>
                        <%--data: {                     //要传递的数据--%>
                            <%--userName: function() {--%>
                                <%--return $("#username").val();--%>
                            <%--}--%>
                        <%--}--%>
                    <%--}--%>
                },
                phone:"required"
            },
            messages:{
                psd:{
                    required:"密码不能为空"
                },
                psd2:"密码不一致，请重输",
                name:{
                    required:"用户名不能为空",
                    remote:"用户名已存在，请重输！"
                },
                phone: "电话号码不能为空"
            },

        })
        $.validator.addMethod("pwdLength",function (value,element) {
            var tal = /^[a-zA-Z0-9-.!@#$%^&*()+?><]{4,20}$/;
            return this.optional(element) || (tal.test(value));
        },"密码为4到20位");

    })
    function goBack() {
        window.history.back(-1)
    }

</script>
<body >
<div id="register">

    <form id="registerForm" method="post" action="${pageContext.request.contextPath}/user/registerMethod">
        <div>
            <p>
                <label class="label_input">用户名:</label>&nbsp
                <input type="text" placeholder="用户名" id="username" name="name" class="text_field"  />
                <span id = "hint"></span>
            </p>
            <p><label class="label_input">密&nbsp&nbsp码:</label>&nbsp<input type="password"  placeholder="4-20位密码" name="psd" id="password" class="text_field" required/></p>
            <p><label class="label_input">再一次密码:</label>&nbsp<input  placeholder="确认密码" type="password" name="psd2" id="password2" class="text_field" /></p>
            <p><label class="label_input">电话:</label>&nbsp<input type="text"  placeholder="电话号码" name="phone" id="phone" class="text_field"/></p>
        </div>
        <div id="register_control";>
            <input type="submit" id="btn_register" value="注册" />
            <input type="button" id="btn_return" value="返回"  onclick="goBack();"/>
        </div>
    </form>
</div>

</body>
</html>
