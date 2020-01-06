package example.controller;

import example.service.PersonalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/personal")
public class PersonalController {
    @Autowired
    private PersonalService personalService;
    @RequestMapping("updatePersonal")
    public String updatePersonal(int userId,@RequestParam(required = false)String nickname,@RequestParam(required = false)Integer age
    ,@RequestParam(required = false)String sex,@RequestParam(required = false)String address){
        int i = personalService.updatePersonal(userId,nickname,age,sex,address);
        return "redirect:/user/workbench/personal";
    }
}
