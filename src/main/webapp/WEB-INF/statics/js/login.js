//引用jQuery框架
function submitForm() {
    var username = $("#username");
    var password = $("#password");

    //利用ajax验证用户名是否已拥有
    $("username").blur(function () {
        $.ajax({
                 url:"LoginController",
                 data:$("#username"),
                dataTable:JSON,

                success:function f() {//成功后不显示

                },
                error:function f1() {//失败后提示用户名不存在

                }

        }

        )
        
    })


    function login() {

        //根据用户名和密码跳转到LoginController登录方法

    }
    
}

function enroll() {
    //跳转到注册页面
}




