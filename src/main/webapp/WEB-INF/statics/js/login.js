$(document).ready(function () {
    var $username = $("#username");
    $username.blur(function () {
        $.ajax({
            url: _contextPath + "/user/valid",
            data: {userName: $username.val()},
            async:false,
            dataType: "json",

            success: function f(res) {//成功后不显示
                if (res != true) {
                    alert("用户名错误");
                }

            },
            error: function f1(res) {//失败后提示用户名不存在
                alert(JSON.stringify(res))
            }

        })

    })


})

//引用jQuery框架
function submitForm() {

       return true;

}






