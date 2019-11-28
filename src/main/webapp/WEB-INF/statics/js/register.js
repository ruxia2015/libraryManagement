// $(document).ready(function () {
//     $("#username").blur(function () {
//         var $username = $("#username");
//         $.ajax({
//             url: _contextPath + "/user/registration",
//             data: {userName: $username.val()},
//             async: true,
//             dataType: "json",
//
//             success: function f(res) {//成功后不显示
//                 if (res != true) {
//                     $("#hint").html(该用户名已存在);
//                 }
//
//             },
//             error: function f1(res) {//失败后提示用户名不存在
//                 alert(JSON.stringify(res))
//             }
//
//         })
//
//     })
// })