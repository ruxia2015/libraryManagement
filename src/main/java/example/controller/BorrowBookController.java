package example.controller;

import example.service.BorrowBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

@Controller
@RequestMapping("/borrowBook")
public class BorrowBookController {
    @Autowired
    BorrowBookService borrowBookService;
@RequestMapping("/addBorrow")
public ModelAndView modelAndView(String userName, String bookName, int bookQuantity, Date startDate, Date returnDate){
    int i = borrowBookService.borrowBook(userName, bookName, bookQuantity, startDate, returnDate);
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.addObject("i",i);
    return modelAndView;
}



}
