<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>借阅信息</title>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery/jquery.min.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/jquery.validate.min.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/additional-methods.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/localization/messages_zh.js"></script>

    <script type="text/javascript">
        function goBack() {
            window.history.back(-1);
        }
    </script>
    <style>
        .div_head{
            margin:0 auto;
            width:100px;
        }
        .div_table{
            margin:0 auto;
            width:800px;
        }
    </style>
</head>

<body>
<div class="div_head">
    <h2 >借阅信息</h2>
</div>

<div class="div_table">
    <table  border="1" cellspacing="0" >
        <tr>
            <td  width="100px">序号</td>
            <td  width="100px">借书人</td>
            <td  width="100px">书名</td>
            <td  width="150px">开始时间</td>
            <td  width="150px">预计返回时间</td>
            <td  width="150px">实际返回时间</td>
        </tr>
        <tr>
            <#list borrowList as list>
                <tr>
                    <td>${list_index+1}</td>
                    <td>${list.userName}</td>
                    <td>${list.bookName}</td>
                    <td>${(list.startDate?string('yyyy-MM-dd '))!""}</td>
                    <td>${(list.returnDate?string('yyyy-MM-dd '))!""}</td>
                    <td>${(list.endDate?string('yyyy-MM-dd '))!"空"}</td>
                </tr>
            </#list>
        </tr>
    </table>

</div>
<div >
    <input type="button" onclick="goBack()" value="返回" >
</div>

</body>
</html>