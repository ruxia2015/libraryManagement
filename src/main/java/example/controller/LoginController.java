package example.controller;

import example.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class LoginController {

    @Autowired
    private LoginService loginService;

    @RequestMapping("")
    public String login(){
        return "login";
    }

    @RequestMapping("/sgin")
    public Boolean sgin(String name, String psd){

        return true;
    }
}
