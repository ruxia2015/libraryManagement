
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>借书单</title>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery/jquery.min.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/jquery.validate.min.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/additional-methods.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/localization/messages_zh.js"></script>
    <script src="${rc.contextPath}/js/autocomplete/jquery.autocomplete.js"></script>

    <script type="text/javascript">
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
            var bookQuantity =parseInt(document.getElementById("bookQuantity").value) ;

            if(quantity != bookQuantity){
                document.getElementById("quantity").value = (quantity+1);
            }
        }

        var url = $("#url_").val();
        // 实时的更新列表中的条目信息
        $("#isbn").autocomplete(url, {
            max : 8, // 列表里的条目数
            minChars : 0, // 自动完成激活之前填入的最小字符
            width : 200, // 提示的宽度，溢出隐藏
            matchContains : true, // 包含匹配，就是data参数里的数据，是否只要包含文本框里的数据就显示
            autoFill : false, // 自动填充
            cacheLength : 0, // 清除缓存
            extraParams : {
                searchStr : function() {
                    return $("#isbn").val();
                }
            },
            parse : function(data) {
                var json = eval("("+data+")"); //一般返回的都是字符串，需要对其对象化
                if (json.success) {
                    var parsed = [];
                    var rows = json.nameList;
                    for (var i = 0; i < rows.length; i++) {
                        var name = rows[i].split("|"); // 使用Jquery中的autoComplete插件实现自动匹配功能时，直接使用它来解析json对象时，会出现一个错误提示，
                        //因为它默认使用"/n"拆分行、"|"拆分字段。如果需要使用它来解析json对象，则需要自己实现其parse方法。
                        parsed[parsed.length] = {
                            data : name, //下拉框显示数据格式
                            value : name, //选定后实际数据格式
                            result : name //选定后输入框显示数据格式
                        };
                    }
                    return parsed;
                }
            }
        }).result(function(event, item, data) { // 回调函数

            // data->相当于 value的值
        });
    </script>
</head>
<body>
<h2>借书单</h2>
<form action="${rc.contextPath}/librarian/succeedBorrow">
    <table>
        <tr>
            <td>借书人：</td>
            <td>
                <input   type="text"  id="userName" name="userName" >
            </td>
        </tr>
        <tr>
            <td>ISBN：</td>
            <td >
                <input  type="text" name="isbn" id="isbn">
                <input type="hidden" id="url_" value='<c:url value="${rc.contextPath}/book/queryBooksByName"/>'/>
            </td>
        </tr>
        <tr>
            <td>数量：</td>
            <td>
                <input type="hidden" id = "bookQuantity" >
                <input type="button" onclick="reduceNum()" value="-">
                <input readOnly="true" style="width: 20px;"  type="text"  name="quantity" id ="quantity" value="1">
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
</html>