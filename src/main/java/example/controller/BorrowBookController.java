package example.controller;

import example.entity.Books;
import example.entity.User;
import example.service.BookService;
import example.service.BorrowBookService;
import example.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/borrowBook")
public class BorrowBookController {
    @Autowired
    private BorrowBookService borrowBookService;
    @Autowired
    private BookService bookService;
    @Autowired
    private LoginService loginService;
    private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//@RequestMapping("/addBorrow")
//public ModelAndView modelAndView(String userName, String bookName, int bookQuantity, Date startDate, Date returnDate){
//    int i = borrowBookService.borrowBook(userName, bookName, bookQuantity, startDate, returnDate);
//    ModelAndView modelAndView = new ModelAndView("borrowBook");
//    modelAndView.addObject("i",i);
//    return modelAndView;
//}
    @RequestMapping("/addBorrow")
    public ModelAndView showBorrow(int id){
        Date date = new Date();
        Books book = bookService.queryBook(id);
        ModelAndView modelAndView = new ModelAndView("borrowBook");
        modelAndView.addObject("book", book);
        modelAndView.addObject("date",date);
        return modelAndView;
    }
    @RequestMapping("/succeedBorrow")
    public ModelAndView succeedBorrow(String userName, String bookName, String quantity, String startDate, String returnDate){
    try {
        Integer quantity1 = Integer.parseInt(quantity);
        Date startDate1 = sdf.parse(startDate);
        Date returnDate1 = sdf.parse(returnDate);
        User user = loginService.findUserByName2(userName);
        int userId = user.getId();
        Books books = bookService.findBooksByName(bookName);
        int bookId = books.getId();
        ModelAndView modelAndView = new ModelAndView("succeedBorrow");
        int i = borrowBookService.borrowBook(userName, bookName, quantity1, startDate1, returnDate1, userId, bookId);
        modelAndView.addObject("books",books);
        modelAndView.addObject("i",i);
        return modelAndView;
    }catch (Exception e){
        e.printStackTrace();
        return null;
    }
    }
}
