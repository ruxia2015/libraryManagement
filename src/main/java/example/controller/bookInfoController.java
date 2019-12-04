package example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/book")
public class bookInfoController {
    @RequestMapping("/books")
    public ModelAndView show(){
       ModelAndView modelAndView = new ModelAndView("books");
       modelAndView.addObject("name","老铁");
        return modelAndView;
    }
}
