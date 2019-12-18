<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>添加书籍</title>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery/jquery.min.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/jquery.validate.min.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/additional-methods.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/localization/messages_zh.js"></script>
    <script type="text/javascript">
        function bookIsbn1() {
            var bookIsbn = document.getElementById("bookIsbn").value;
            var pattern = /^[A-Za-z0-9-]+$/;
            if (!pattern.test(bookIsbn)) {
                $("#hint").html("数字、字母、-");
                $("#hint").css({
                   display:"",
                    "color":"red"
                });
                document.getElementById("bookIsbn").value="";
                return false;
            }
            $("#hint").css({
                display: "none"
            });
            return true;
        }
        function bookName1() {
            var bookName= document.getElementById("bookName").value;
            var pattern = /^[^ ]{1,20}$/;
            if (!pattern.test(bookName)) {
                $("#showBookName").html("不能包含特殊字符（空格）");
                $("#showBookName").css({
                    display:"",
                    "color":"red"
                });
                return false;
            }
            $("#showBookName").css({
                display: "none"
            });
            return true;
        }
        function bookAuthor1() {
            var bookAuthor= document.getElementById("bookAuthor").value;
            var pattern =  /^[^ ]{1,20}$/;
            if (!pattern.test(bookAuthor)) {
                $("#showBookAuthor").html("不能包含特殊字符（空格）");
                $("#showBookAuthor").css({
                    display:"",
                    "color":"red"
                });
                return false;
            }
            $("#showBookAuthor").css({
                display: "none"
            });
            return true;
        }

        function bookParticulars1() {
            var bookParticulars= document.getElementById("bookParticulars").value;
            var pattern =  /^[^ ]{1,20}$/;
            if (!pattern.test(bookParticulars)) {
                $("#showBookParticulars").html("不能包含特殊字符（空格）");
                $("#showBookParticulars").css({
                    display:"",
                    "color":"red"
                });
                return false;
            }
            $("#showBookParticulars").css({
                display: "none"
            });
            return true;

        }

        function bookPrice1() {
            var bookPrice = document.getElementById("bookPrice").value;
            var patten = /^([1-9][0-9]*)+(\.[0-9]{1,2})?$/;
            if(!patten.test(bookPrice)){
                $("#showBookPrice").html("最多2位小数的数字");
                $("#showBookPrice").css({
                    display:"",
                    "color":"red"
                });
                document.getElementById("bookPrice").value="";
                return false;
            }
            $("#showBookPrice").css({
                display: "none"
            });
            return true;
        }
        function bookTotal1() {
            var bookTotal = document.getElementById("bookTotal").value;
            var patten = /^([1-9][0-9]*){1,20}$/;
            if(!patten.test(bookTotal)){
                $("#showBookTotal").html("请输入非0的数字");
                $("#showBookTotal").css({
                    display:"",
                    "color":"red"
                });
                document.getElementById("bookTotal").value="";
                return false;
            }
            $("#showBookTotal").css({
                display: "none"
            });
            return true;
        }
        function bookQuantity1() {
            var bookTotal = document.getElementById("bookTotal").value;
            var bookQuantity = document.getElementById("bookQuantity").value;
            var patten = /^\d+$/;
            if(!patten.test(bookQuantity)){
                $("#showBookQuantity").html("请输入数字");
                $("#showBookQuantity").css({
                    display:"",
                    "color":"red"
                });
                return false;
            }
            if (bookQuantity>bookTotal){
                $("#showBookQuantity").html("不能大于总数");
                $("#showBookQuantity").css({
                    display:"",
                    "color":"red"
                });
                return false;
            }
            $("#showBookQuantity").css({
                display: "none"
            });
            return true;
        }

        function submitForm() {
            if(!bookIsbn1()){
                return false;
            }
            if(!bookName1()){
                return false;
            }
            if(!bookAuthor1()){
                return false;
            }
            if(!bookParticulars1){
                return false;
            }
            if(!bookPrice1()){
                return false;
            }

            if(!bookTotal1()){
                return false;
            }
            if(!bookQuantity1()){
                return false;
            }
            if(!bookName1()){
                return false;
            }
            if(!bookAuthor1()){
                return false;
            }
            return true;
        }

    </script>
    <style>
        .div_head{
            margin:0 auto;
            width:100px;

        }
        .div_table{
            margin:0 auto;
            width:300px;
        }
    </style>
</head>

<body>
<div class="div_head">
    <h2>新增书籍</h2>
</div>
<div class="div_table">
    <form action="${rc.contextPath}/book/addBookSucceed" onsubmit="return submitForm();" method="post" enctype="multipart/form-data">
        <table>
            <tr>
                <td width="100px"> 国际编码：</td>
                <td width="300px">
                    <input type="text" onblur="bookIsbn1()" id = "bookIsbn" name="bookIsbn" placeholder="数字">
                    <span id = "hint"></span>
                </td>
            </tr>
            <tr>
                <td>书&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
                <td>
                    <input type="text" id = "bookName" onblur="bookName1();" name="bookName">
                    <span id = "showBookName"></span>
                </td>
            </tr>
            <tr>
                <td>作&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;者：</td>
                <td>
                    <input type="text" id = "bookAuthor" onblur="bookAuthor1();" name="bookAuthor">
                    <span id = "showBookAuthor"></span>
                </td>
            </tr>
            <tr>
                <td>图书详情：</td>
                <td>
                    <textarea name="bookParticulars" id = "bookParticulars" onblur="bookParticulars1()"></textarea>
                    <span id = "showBookParticulars"></span>
                </td>
            </tr>
            <tr>
                <td>图书封面：</td>
                <td>
                    <input type="file" name="file">
                </td>
            </tr>
            <tr>
                <td> 图书类别：</td>
                <td>
                    <select name="bookTypeName">
                        <#list bookTypeList as list>
                            <option  value="${list.bookTypeName}">${list.bookTypeName}</option>
                        </#list>
                    </select>
                </td>
            </tr>
            <tr>
                <td>图书价格：</td>
                <td>
                    <input type="text" name="bookPrice" id = "bookPrice" onblur="bookPrice1()" placeholder="数字">
                    <span id ="showBookPrice"></span>
                </td>
            </tr>
            <tr>
                <td>图书总量：</td>
                <td>
                    <input type="text" name="bookTotal" id = "bookTotal" onblur="bookTotal1()" placeholder="数字">
                    <span id = "showBookTotal"></span>
                </td>
            </tr>
            <tr>
                <td>  可借数量：</td>
                <td>
                    <input type="text" name="bookQuantity" id = "bookQuantity" onblur="bookQuantity1()" placeholder="数字">
                    <span  id ="showBookQuantity"></span>
                </td>
            </tr>
        </table>
        <p></p>
        <p></p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="submit" value="提交">&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="${rc.contextPath}/book/books">返回首页</a>
    </form>
</div>

</body>
</html>