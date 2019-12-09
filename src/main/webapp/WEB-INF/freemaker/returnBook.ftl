<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>还书单</title>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery/jquery.min.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/jquery.validate.min.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/additional-methods.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/localization/messages_zh.js"></script>
    function goBack() {
    window.history.back(-1);
    }
</head>
    <form>
       <table>
           <tr>
               <td>还书人：</td>
               <td>
                   <input readOnly="true"  type="text"  name="userName" value=" ${Session["user"].userName}">
               </td>
           </tr>
           <tr>
               <td>书名：</td>
               <td>
                   <input readOnly="true"  type="text"  name="bookName" value="${book.bookName}">
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
                   <input readOnly="true"  type="text" name="startDate" ">
               </td>
           </tr>
           <tr>
               <td>预计归还时间：</td>
               <td>
                   <input readOnly="true"  type="text" name="startDate" ">
               </td>
           </tr>
           <tr>
               <td>实际归还时间：</td>
               <td>
                   <input readOnly="true"  type="text" name="startDate" ">
               </td>
           </tr>
           <tr>
               <td>是否逾期：</td>
               <td>
                    <input type="radio" name="sex" value="是">
                    <input type="radio" name="sex" value="否">
               </td>
           </tr>
       </table>
        <input type="submit" value="提交">
        <input type="button" onclick="goBack()" value="返回">
    </form>

<body>

</body>
</html>