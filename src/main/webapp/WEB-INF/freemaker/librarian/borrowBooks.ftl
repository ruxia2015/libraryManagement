
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>借书单</title>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery/jquery.min.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/jquery.validate.min.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/additional-methods.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/localization/messages_zh.js"></script>
    <script src="${rc.contextPath}/js/autocomplete/jquery.autocomplete.js"></script>
    <link rel="stylesheet"  href="${rc.contextPath}/js/autocomplete/jquery.autocomplete.css"/>

    <script type="text/javascript">
        $(document).ready(function() {
            $("#borrowForm").validate({
                rules: {
                    userName: {
                        required: true,
                        remote: "${rc.contextPath}/user/Exists/userName"
                    },
                    isbn: {
                        required: true,
                        remote: "${rc.contextPath}/book/Exists/isbn"
                    },
                    quantityS:{
                        min:1
                    },
                },
                messages:{
                    userName:{
                        required:"借书人不能为空",
                        remote:"该借书人不存在"
                    },
                    isbn:{
                        required:"isbn不能为空",
                        remote:"该isbn不存在"
                    },
                    quantityS:{
                        min:"抱歉，此书暂无库存"
                    }
                },
            });
        });

        function goBack() {
            window.history.back(-1);
        }

        function reduceNum(){
            var quantity =parseInt(document.getElementById("quantity").value) ;
            if(quantity>1){
                document.getElementById("quantity").value =(quantity-1);
            }

        }

        function addNum(){
            var quantity =parseInt(document.getElementById("quantity").value) ;
            var quantityS =parseInt(document.getElementById("quantityS").value) ;

            if(quantity != quantityS){
                document.getElementById("quantity").value = (quantity+1);
            }
        }

    </script>
</head>
<body>
<h2>借书单</h2>
<form id="borrowForm" action="${rc.contextPath}/librarian/succeedBorrow" method="post" >
    <table>
        <tr>
            <td>借书人：</td>
            <td>
                <input   type="text"  id="userName" name="userName"/>
                <input type="hidden" id="userUrl" value="${rc.contextPath}/user/queryUserByName"/>

            </td>
        </tr>
        <tr>
            <td>ISBN：</td>
            <td >
                <input  type="text"  id="isbn" name="isbn"/>
                <input type="hidden" id="url_" value="${rc.contextPath}/book/queryBooksByIsbn"/>
            </td>
        </tr>
        <tr>
            <td>可借数量</td>
            <td>
                <input readonly id="quantityS" name="quantityS">
            </td>
        </tr>
        <tr>
            <td>数量：</td>
            <td>
                <input type="button" onclick="reduceNum()" value="-">
                <input  style="width: 20px;"  type="text"  name="quantity" id ="quantity" value="1">
                <input type="button" onclick="addNum()" value="+">
            </td>
        </tr>
        <tr>
            <td>开始时间：</td>
            <td>
                <input readOnly="true"  type="text" name="startDate" value="${date?string('yyyy-MM-dd')}">
            </td>
        </tr>
        <tr>
            <td>归还时间：</td>
            <td>
                <select name="returnDate">
                    <option selected="selected" value="${weekDate?string('yyyy-MM-dd')}">${weekDate?string('yyyy-MM-dd')}</option>
                    <option value="${monthDate?string('yyyy-MM-dd')}">${monthDate?string('yyyy-MM-dd')}</option>
                </select>
            </td>
        </tr>
    </table>
    <input type="submit" value="提交">
    <input type="button" onclick="goBack()" value="返回">
</form>
</body>
<script type="text/javascript">
    var url = $("#url_").val();
    var userUrl = $("#userUrl").val();



    $("#userName").autocomplete(userUrl, {
        max : 8, // 列表里的条目数
        minChars : 0, // 自动完成激活之前填入的最小字符
        width : 200, // 提示的宽度，溢出隐藏
        matchContains : true, // 包含匹配，就是data参数里的数据，是否只要包含文本框里的数据就显示
        autoFill : false, // 自动填充
        cacheLength : 0, // 清除缓存
        dataType: 'json',
        extraParams : {
            userName : function() {
                return $("#userName").val();
            },
            limit:8
        },
        parse: function(data) {
            // alert(data);
            var rows = [];
            if(data == null || data == null){
                return rows;
            }
            for(var i=0; i<data.length; i++){
                rows[rows.length] = {
                    data:data[i].userName,       //下拉框显示数据格式
                    value:data[i],   //选定后实际数据格式
                    result:data[i].userName,  //选定后输入框显示数据格式
                };
            }
            return rows;
        },
        formatItem : function(row, i, total) {
            return row;
        },
        // formatMatch : function(row, i, total) {
        //     return row.data;
        // },
        // formatResult : function(row) {
        //     return row.result;
        // }
    }).result(function(event, item,data) { // 回调函数
        $("#userName").val(data.userName);
        // alert(JSON.stringify(data.bookIsbn))
        // data->相当于 value的值
    });

    // 实时的更新列表中的条目信息
    $("#isbn").autocomplete(url, {
        max : 8, // 列表里的条目数
        minChars : 0, // 自动完成激活之前填入的最小字符
        width : 200, // 提示的宽度，溢出隐藏
        matchContains : true, // 包含匹配，就是data参数里的数据，是否只要包含文本框里的数据就显示
        autoFill : false, // 自动填充
        cacheLength : 0, // 清除缓存
        dataType: 'json',
        extraParams : {
            isbn : function() {
                return $("#isbn").val();
            },
            limit:8
        },
        parse: function(data) {
            // alert(data);
            var rows = [];
            if(data == null || data == null){
                return rows;
            }
            for(var i=0; i<data.length; i++){
                rows[rows.length] = {
                    data:data[i].bookIsbn+"  "+data[i].bookName,       //下拉框显示数据格式
                    value:data[i],   //选定后实际数据格式
                    result:data[i].bookIsbn+"  "+data[i].bookName,  //选定后输入框显示数据格式
                };
            }
            return rows;
        },
        formatItem : function(row, i, total) {
            return "<span style='background-color: red' >"+row+"</span>";
        },
        // formatMatch : function(row, i, total) {
        //     return row.data;
        // },
        // formatResult : function(row) {
        //     return row.result;
        // }
    }).result(function(event, item,data) { // 回调函数
        $("#isbn").val(data.bookIsbn);
        $("#quantityS").val(data.bookQuantity)
        // alert(JSON.stringify(data.bookIsbn))
        // data->相当于 value的值
    });

</script>
</html>