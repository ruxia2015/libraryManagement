package example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("")
public class IndexController {

    @RequestMapping({"/","/index","/home/index"})
    public String index(){
        return "index";
    }

    @RequestMapping("toList")
    public String toList(){

        return "list";
    }

    @RequestMapping("listData")
    public String listData(){

        return "listData";
    }

}
