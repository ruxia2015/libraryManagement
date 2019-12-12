<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>图书详情</title>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery/jquery.min.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/jquery.validate.min.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/additional-methods.js"></script>
    <script src="${rc.contextPath}/AdminLTE-3.0.1/plugins/jquery-validation/localization/messages_zh.js"></script>
    <script type="text/javascript">
        function goBack() {
            window.history.back(-1);
        }
    </script>
    <style type="text/css">
        #div1{
            width:  800px;
            height: 1000px;
            border: #000 solid 0px;
            margin: 50px auto;
            /* overflow: hidden; */
        }
        #div1 img{
            cursor: pointer;
            transition: all 0.6s;
        }
        #div1 img:hover{
            transform: scale(1.4);
        }

    </style>
</head>
<body>
<div id="div1">
    <img width="100px" height="200px" src="${rc.contextPath}/${book.bookPicture}">

</div>
<div>
    <textarea >${book.bookParticulars}</textarea>
</div>
<div>
   <input type="button" onclick="goBack()" value="返回">
</div>
</body>
</html>