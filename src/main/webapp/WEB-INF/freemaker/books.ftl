<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
</head>
<body>
<div id="div">
    <input type="hidden" value="1" name="pageno">
    <h1 style="text-align: center;">书库</h1>
    <label>图书分类</label>
        <select name="book_Type" onmousedown="if(this.options.length>3){this.size=6}" onblur="this.size=0" onchange="this.size=0">
            <option value="0">全部</option>
            <#list bookTypeList as typeList>
                <option value="${typeList.id}" >${typeList.bookTypeName}</option>
            </#list>
        </select>

    <input type="text" id = "condition" placeholder="书名|作者|国际编号">
    <input type="button" onclick="queruCondition()" value="查询">
        <div style="margin: 0px auto; width: 580px;">
            <table>
                <tr>
                    <td>图书编号</td>
                    <td>图书分类</td>
                    <td>图书封面</td>
                    <td>图书名称</td>
                    <td>作者</td>
                    <td>图书价格</td>
                    <td>图书总量</td>
                    <td>可借数量</td>
                    <td>详情</td>
                    <td>操作</td>
                </tr>
            </table>
        </div>
    </div>

</body>
</html>