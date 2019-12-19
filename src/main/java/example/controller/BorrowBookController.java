package example.controller;

import example.entity.Books;
import example.entity.Borrow;
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
import java.util.List;

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
    public ModelAndView succeedBorrow(String userName, String bookName, String quantity, String startDate, String returnDate) {
        try {
            Integer quantity1 = Integer.parseInt(quantity);
            Date startDate1 = sdf.parse(startDate);
            Date returnDate1 = sdf.parse(returnDate);
            User user = loginService.findUserByName(userName);
            int userId = user.getId();
            Books books = bookService.findBooksByName(bookName);
            int bookId = books.getId();
            ModelAndView modelAndView = new ModelAndView("succeedBorrow");
            int i = borrowBookService.borrowBook(userName, bookName, quantity1, startDate1, returnDate1, userId, bookId);
            int y = bookService.updateBooksQuantity(bookId);
            modelAndView.addObject("books", books);
            modelAndView.addObject("i", i);
            modelAndView.addObject("y", y);
            return modelAndView;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
        @RequestMapping("/borrowMessage")
        public ModelAndView borrowMessage(String userName){
            List<Borrow> borrowList = borrowBookService.borrowMessage(userName);
            ModelAndView modelAndView = new ModelAndView("borrowMessage");
            modelAndView.addObject("borrowList",borrowList);
            return modelAndView;
        }


        //通过名字查询对应的借阅信息
    @RequestMapping("/queryAllBorrow")
    public ModelAndView queryAllBorrow(String userName, String bookName){
        int id = 0;
        if(userName == null || userName.equals("")){

        }else {
            User user =loginService.findUserByName(userName);
            id = user.getId();
        }
        List<Borrow> borrowList = borrowBookService.queryAllBorrow(id, bookName);
        ModelAndView modelAndView = new ModelAndView("queryAllBorrow");
        modelAndView.addObject("borrowList",borrowList);
        modelAndView.addObject("userName",userName);
        modelAndView.addObject("bookName",bookName);
        return modelAndView;
    }

    }


