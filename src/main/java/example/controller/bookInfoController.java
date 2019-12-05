package example.controller;

import example.entity.BookType;
import example.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/book")
public class bookInfoController {
    @Autowired
    private BookService bookService;
    @RequestMapping("/books")
    public ModelAndView show(){
        List<BookType> bookTypeList = bookService.queryBookType();
       ModelAndView modelAndView = new ModelAndView("books");
       modelAndView.addObject("bookTypeList",bookTypeList);
        return modelAndView;
    }
}
