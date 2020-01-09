package example.controller;

import example.entity.Librarian;
import example.service.LibrarianService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/home")
public class IndexController {
    @Autowired
    private LibrarianService librarianService;

    @RequestMapping("/index")
    public String index(){
        return "index";
    }

    @RequestMapping("toList")
    public String toList(ModelAndView modelAndView){
        List<Librarian> list = librarianService.queryLibrarianList();
        modelAndView.addObject("list",list);
        return "list";
    }

    @RequestMapping("listData")
    public String listData(){
        return "listData";
    }

}
