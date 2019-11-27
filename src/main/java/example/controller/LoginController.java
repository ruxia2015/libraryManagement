package example.controller;

import com.sun.java.swing.plaf.windows.resources.windows;
import example.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/library")
public class LoginController {

    @Autowired
    private LoginService loginService;

    @RequestMapping("/login")
    public String login(){
        return "login";
    }

    //如果name或者psd为null，在哪里去验证，并且返回前端
    @RequestMapping("/sgin")
    public String  sgin(String name, String psd){

        Boolean b = loginService.findUser(name,psd);
        if(b ==false){
        //弹出提示框显示用户名或密码错误
        }
        return "index";
    }
}
