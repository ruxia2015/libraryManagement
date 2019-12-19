package example.controller;

import example.entity.Page;
import example.entity.User;
import example.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.swing.*;
import java.util.*;

@Controller
@RequestMapping("/user")
public class LoginController extends HttpServlet {

    @Autowired
    private LoginService loginService;

    //用户登录
    @RequestMapping("/login")
    public String login(){
        return "login";
    }

    //用户注册
    @RequestMapping("/register")
    public String register(){
        return "register";
    }

    //根据用户名查找用户
    @RequestMapping("/queryAllUser")
    public String queryAllUser(@RequestParam(required = false) String userName, Model model,@RequestParam(required = false) Integer pageNo, @RequestParam(required = false) Integer pageSize){
        int id = 0 ;
        if(pageNo ==null){
            pageNo = 1;
        }
        if(pageSize == null){
            pageSize =5;
        }
        User user = loginService.findUserByName(userName);
        if(user != null){
            id = user.getId();
        }

        List<User> userList = loginService.queryAllUser(id, pageNo, pageSize);
        int count = loginService.count(userName);
        Page page = new Page(pageNo,pageSize,count,userList);
        int pageCount = page.getTotalPageNum();
        model.addAttribute("page",page);
        model.addAttribute("pageCount",pageCount);
        model.addAttribute("userName",userName);
        return "queryAllUser";
    }

    @RequestMapping("/retrievePwd")
    public String retrievePwd(){
        return "retrievePwd";
    }

    //找回密码
    @RequestMapping("retrievePassword")
    public String retrievePassword(String userName, String phone, Model model){

        User user = loginService.findUserByName(userName);
        if(user == null){
            JOptionPane.showMessageDialog(null, "该账号不存在","数据错误",JOptionPane.ERROR_MESSAGE);
            return "retrievePwd";
        }
        if(user.getPhone().equals(phone)){
            model.addAttribute("user", user);
            return "resetPwd";
        }else{
            JOptionPane.showMessageDialog(null, "手机号或用户名错误","数据错误",JOptionPane.ERROR_MESSAGE);
            return "retrievePwd";
        }
    }

    //重置密码
    @RequestMapping("/resetSucceed")
    public String resetSucceed(int userId, String pwd){
        int i = loginService.resetPwd(pwd, userId);
        if(i == 1){
            JOptionPane.showMessageDialog(null, "修改密码成功","成功",JOptionPane.ERROR_MESSAGE);
            return "login";
        }else {
            JOptionPane.showMessageDialog(null, "修改密码失败，请稍后重试！","成功",JOptionPane.ERROR_MESSAGE);
            return "resetPwd";
        }

    }

    //如果name或者psd为null，在哪里去验证，并且返回前端
    @RequestMapping("/sgin")
    public String  sgin(String name, String psd, HttpServletRequest request){

        Boolean b = loginService.userLogin(name,psd,request);

        if(b ==false){
            return "loginError";//TODO 跳转到登录页面视图[jsp页面] ,在JSP页面中将错误信息显示出来就可以
        }
        return "index"; //此处不建议写跳转到视图，如果这个视图页面需要传入一些值，就需要再写一遍，建议使用转发（redirect），跳转到对应的请求地址
    }



    @ResponseBody
    @RequestMapping("/valid")
    public Boolean validateName(String userName) {
/*
        返回map对象的原因：可以将错误原因推送给前端，如果只是布尔类型的，就只有一个false，这两种方式都可以。根据个人习惯以及实际的情况
        如果是找的插件去验证，就要根据插件的要求进行返回。
*/
        User user = loginService.findUserByName(userName);
        //1、此处调用service类，根据用户名查找用户

        if (user == null) {
            return false;
        }
        return true;

    }

    @ResponseBody
    @RequestMapping("/notExists/userName")
    public Boolean notExistsUserName(String name) {
/*
        返回map对象的原因：可以将错误原因推送给前端，如果只是布尔类型的，就只有一个false，这两种方式都可以。根据个人习惯以及实际的情况
        如果是找的插件去验证，就要根据插件的要求进行返回。
*/
        User user = loginService.findUserByName(name);
        //1、此处调用service类，根据用户名查找用户

        if (user == null) {
            return true;
        }else {
            return false;
        }
    }



    @ResponseBody
    @RequestMapping("/registration")
    public Boolean registration(String userName){
        if(userName == null || userName.trim().equals("")){  //用户没输入
            return false;
        }
        User user = loginService.findUserByName(userName);
        //1、此处调用service类，根据用户名查找用户
        if (user == null) {  //用户名可用
            return true;
        }
        return false;//用户已存在
    }

@RequestMapping("/registerMethod")
    public String  registerMethod(String name, String psd, String phone, Date createDate, ModelMap response){
        Date date  = new Date();
        Boolean b = loginService.addUser(name, psd,phone,date );
    if(b ==false){
        //弹出提示框显示用户名或密码错误
        response.put("error","注册失败，请重试！");

        return "register";
    }
    //弹出一个确认框，点击确认后，在跳转
    JOptionPane.showMessageDialog(null,"注册成功!");
    return "login";
}
}


