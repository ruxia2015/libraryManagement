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
    var pageNo = 1;
    var userName = $("#queryUser").val();
    var obj =document.getElementById("pageSize");
    var pageSize = obj.options[obj.selectedIndex].value;
    obj.onchange = function(){
        //传入当前页数
         userName = $("#queryUser").val();
        pageNo= 1;
        pageSize = obj.options[obj.selectedIndex].value;
        refreshPage(pageNo,pageSize,userName);
    }
    refreshPage(pageNo,pageSize,userName)
    // alert();

}

//跳转
function skip() {
    var pageNo = $("#selestPageNo").val();
    var count = $("#pagesNum").text();
    pageNo = parseInt(pageNo);
    count = parseInt(count);
    if(pageNo>0&&pageNo<=count){
        goPage(pageNo);
    }
}

function goPage(pageNo){
    var userName = $("#queryUser").val();
    $("#pageNum").val(pageNo);
    //pageNum-->pageSize  仍然取下拉列表中的值
    var obj =document.getElementById("pageSize");
    var pageSize = obj.options[obj.selectedIndex].value;
    refreshPage(pageNo,pageSize,userName);

}


function refreshPage(pageNo , pageSize, userName) {
    pageNo = parseInt(pageNo);
    $.ajax({
        url: "${pageContext.request.contextPath}/user/queryAllUser",
        data:{
            "pageNo":pageNo, "pageSize":pageSize, "userName":userName
        },
        type:"post",
        dataType:"Json",
        success:function (resp) {
            $("#count").text(resp.count);
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


            var pageCount =resp.pageCount;
             var listPage = document.getElementById("dataPage");
             var htmlPage="<tr>"

             if( pageNo != 1){
                htmlPage = htmlPage + "<td><button onclick='goPage(1)'>首页</button></td>"
                htmlPage = htmlPage + "<td><button   onclick='goPage("+(pageNo-1)+")'>"+(pageNo-1)+"</button></td>"
             }
             htmlPage = htmlPage + "<td>当前页"+pageNo+"</td>"
             if( pageNo != pageCount){
                 htmlPage = htmlPage + "<td><button   onclick='goPage("+(pageNo+1)+")'>"+(pageNo+1)+"</button></td>"
                 htmlPage = htmlPage + "<td><button onclick='goPage("+pageCount+")'>尾页</button></td>"
             }



             htmlPage = htmlPage+" <td>\n" +
                 "                <label>总页数：</label><span id = \"pagesNum\"></span>\n" +
                 "            </td>";
             htmlPage = htmlPage+" <td><input type=\"text\"  placeholder=\"跳转的页数\" id = \"selestPageNo\">\n" +
                 "                        <input type=\"button\" onclick=\"skip();\" value=\"跳转\"></td>"
             htmlPage = htmlPage +  " </tr>"
             listPage.innerHTML = htmlPage;
             $("#pagesNum").text(resp.pageCount);
        }
    })
}
function queryUser() {
    var userName = $("#queryUser").val();
    var pageNo= 1;
    var obj =document.getElementById("pageSize");
    var pageSize = obj.options[obj.selectedIndex].value;
    refreshPage(pageNo,pageSize,userName);
}
</script>


<body>
    <div>

        <input type="hidden" id = "pageNum" value="1">
        <label>每页数据条数：</label>
       <select id = "pageSize" >
           <option selected = "selected">5</option>
           <option >10</option>
           <option >2</option>
           <option >100</option>
       </select>
        <label>总条数：</label><span id = "count"></span>
        <input type="text" id = "queryUser" placeholder="用户名字">
        <input type="button" onclick="queryUser()" value="查询">
        <input type="button" onclick="refreshPage()" value="刷新">
        <table>
            <thead>
                <tr>
                    <td>序号</td>
                    <td>姓名</td>
                    <td>电话</td>
                </tr>
            </thead>
            <tbody  id="dataBody">

            </tbody>



        </table>
        <table>
            <thead id="dataPage">
            </thead>
        </table>

    </div>

</body>
</html>
