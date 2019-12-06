<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>借书单</title>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery/jquery.min.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/jquery.validate.min.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/additional-methods.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/localization/messages_zh.js"></script>
    function goBack() {
    window.history.back(-1);
    }
</head>
    <form action="${rc.contextPath}/borrowBook/addBorrow">
       <table>
           <tr>
               <td>借书人：</td>
<#--               <td>${sessionScope.user.getUserName()}</td>-->
           </tr>
           <tr>
               <td>书名：</td>
               <td >${book.bookName}</td>
           </tr>
           <tr>
               <td>数量：</td>
               <td>1</td>
           </tr>
           <tr>
               <td>开始时间：</td>
               <td>${date}</td>
           </tr>
           <tr>
               <td>归还时间：</td>
               <td>
                   <input type="date" id = "returnDate">
               </td>
           </tr>
       </table>
        <input type="submit" value="提交">
        <input type="button" onclick="goBack()" value="返回">
    </form>

<body>

</body>
</html>