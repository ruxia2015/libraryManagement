<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>还书单</title>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery/jquery.min.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/jquery.validate.min.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/additional-methods.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/localization/messages_zh.js"></script>
    <script type="text/javascript">
        function goBack() {
            window.history.back(-1);
        }
    </script>
</head>
<h2>还书单</h2>
    <form action="/borrowBook/returnBookSucceed" onsubmit="return submitForm();" method="post">
        <input type="hidden"  name="id" value="${borrowBook.id}">
       <table>
           <tr>
               <td>还书人：</td>
               <td>
                   <input readOnly="true"  type="text"  name="userName" value=" ${borrowBook.userName}">
               </td>
           </tr>
           <tr>
               <td>书名：</td>
               <td>
                   <input readOnly="true"  type="text"  name="bookName" value="${borrowBook.bookName}">
               </td>
           </tr>
           <tr>
               <td>数量：</td>
               <td>
                   <input readOnly="true"  type="text" name="quantity" value="1">
               </td>
           </tr>
           <tr>
               <td>开始时间：</td>
               <td>
                   <input readOnly="true"  type="text" name="startDate"  value="${borrowBook.startDate?string('yyyy-MM-dd')}">
               </td>
           </tr>
           <tr>
               <td>预计归还时间：</td>
               <td>
                   <input readOnly="true"  type="text" name="returnDate"  value="${borrowBook.returnDate?string('yyyy-MM-dd')}">
               </td>
           </tr>
           <tr>
               <td>实际归还时间：</td>
               <td>
                   <input readOnly="true"  type="text" name="endDate"  value="${date?string('yyyy-MM-dd')}">
               </td>
           </tr>
           <#if  date?date gt borrowBook.returnDate?date >
           <tr>
               <td>是否逾期：</td>
               <td> <input type="text" readOnly="true" name="sex" value="是"></td>
               <td>逾期天数：</td>
               <td> <input type="text" readOnly="true" name="sex" value="${days}"></td>
           </tr>
           <#else >
               <tr>
                   <td>是否逾期：</td>
                   <td><input  type="text" readOnly="true" name="sex" value="否"></td>
                </tr>
           </#if>
       </table>
        <input type="submit" value="提交">
        <input type="button" onclick="goBack()" value="返回">
    </form>

<body>

</body>
</html>