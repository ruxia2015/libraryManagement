<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZHAOBING
  Date: 2019-11-29
  Time: 11:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>读者信息表</title>
    <script src="${pageContext.request.contextPath}/AdminLTE-3.0.1/plugins/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/additional-methods.js"></script>
    <script src="${pageContext.request.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/localization/messages_zh.js"></script>
</head>
<script type="text/javascript">

window.onload = function () {
    alert();
    var pageNo = 1;
    var pageNum = 10;
    $.ajax({
        url: "${pageContext.request.contextPath}/user/selectAllUserList",
        data:{
            "pageNo":pageNo,"pageNum":pageNum
        },
        type:"post",
        contentType: 'application/json;charset=utf-8',
        dataType:"Json",
        success:function (resp) {
            console.log(resp);
            var list = document.getElementById("dataBody");
            var html="";
            var index = 0;
            for(;index< resp.list.length; index++){
                html = html +  "<tr><td>"+(index+1)+"</td><td>"+resp.list[index].userName+"</td><td>"+resp.list[index].phone+"</td></tr>";
            }
            console.log(index);
            console.log(html);
            list.innerHTML = html;

            var listPage = document.getElementById("dataPage");
            var htmlPage="<tr>"
            if( pageIndex != 1){
                htmlPage = htmlPage + "<td onclick='demo("+(1)+")'>首页</td>"
                htmlPage = htmlPage + "<td onclick='demo("+(pageIndex-1)+")'>"+(pageIndex-1)+"</td>"
            }
            htmlPage = htmlPage + "<td>当前页</td>"
            if( pageIndex != pageCount){
                htmlPage = htmlPage + "<td onclick='demo("+(pageIndex+1)+")'>"+(pageIndex+1)+"</td>"
            }
            htmlPage = htmlPage +  " </tr>"
            listPage.innerHTML = htmlPage;
        }
    })
}
</script>


<body>
    <div>
        <div id="box">当前每页数据：</div>
        <div id="down">
            <ul class="pageNum">
                <li>5</li>
                <li>10</li>
                <li>20</li>
                <li>50</li>
                <li>100</li>
            </ul>
        </div>
        <table>
            <thead>
                <tr>
                    <td>序号</td>
                    <td>姓名</td>
                    <td>电话</td>
                </tr>
            </thead>
            <tbody  id="dataBody">

                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>

            </tbody>


        </table>
        <table>
            <thead id="dataPage">
                <tr>
                    <td >1</td>
                    <td >2</td>
                    <td >3</td>
                </tr>
            </thead>
        </table>

    </div>

</body>
</html>
