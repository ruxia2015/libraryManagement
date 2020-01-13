package example.controller;

import com.sun.xml.internal.ws.api.message.HeaderList;
import example.entity.BookType;
import example.entity.Books;
import example.entity.Page;
import example.entity.User;
import example.service.BookService;
import example.service.BookTypeService;
import example.service.BorrowBookService;
import example.service.UserService;
import example.util.FileUploading;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.swing.*;
import java.io.*;
import java.util.*;

@Controller
@RequestMapping("/book")
public class BookInfoController {
    @Autowired
    private BookService bookService;
    @Autowired
    private BookTypeService bookTypeService;
    @Autowired
    private UserService userService;
    @Autowired
    private BorrowBookService borrowBookService;

    @RequestMapping("/index")
    public String index(Model model, @RequestParam(required = false) String queryName, @RequestParam(required = false) Integer bookTypeId , @RequestParam(required = false) Integer  id) {
        int booksCount = bookService.count(queryName, bookTypeId);
        int usersCount = userService.count(queryName);
        int overdueCount = borrowBookService.overdueCount(id);
        int borrowCount = borrowBookService.borrowCount(id);
        model.addAttribute("booksCount", booksCount);
        model.addAttribute("usersCount",usersCount);
        model.addAttribute("overdueCount",overdueCount);
        model.addAttribute("borrowCount",borrowCount);
        return "index";
    }

    @RequestMapping("/addBook")
    public ModelAndView addBook() {
        ModelAndView modelAndView = new ModelAndView("addBook");
        List<BookType> bookTypeList = bookTypeService.queryAllBookType();
        modelAndView.addObject("bookTypeList", bookTypeList);
        return modelAndView;
    }

    @RequestMapping("/addBookSucceed")
    public ModelAndView addBookSucceed(String bookIsbn, String bookName, String bookAuthor, String bookParticulars, String bookTypeName,
                                       @RequestParam("file") MultipartFile file, Double bookPrice, Integer bookTotal, Integer bookQuantity, HttpServletRequest request) throws IOException {

        ModelAndView modelAndView = new ModelAndView("addBookSucceed");
        BookType bookType = bookTypeService.queryBookTypeByName(bookTypeName);
        int bookTypeId = bookType.getId();
        String bookPicture= "image/默认.jpg";
        try {

            String newBookPicture =FileUploading.fileUpload(file, bookPicture);
            if (newBookPicture == null) {

            } else {
                bookPicture = newBookPicture;
            }
            Date date = new Date();
            int i = bookService.addBook(bookIsbn, bookName, bookAuthor, bookParticulars, bookTypeId, bookPicture,
                    bookPrice, date, bookTotal, bookQuantity);
            modelAndView.addObject("i", i);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return modelAndView;
    }

    @RequestMapping("updateBook")
    public ModelAndView updateBook(int id) {
        ModelAndView modelAndView = new ModelAndView("updateBook");
        Books books = bookService.queryBook(id);
        List<BookType> bookTypeList = bookTypeService.queryAllBookType();
        modelAndView.addObject("bookTypeList", bookTypeList);
        modelAndView.addObject("books", books);
        return modelAndView;
    }

    @RequestMapping("/updateBookSucceed")
    public ModelAndView updateBookSucceed(int id, String bookIsbn, String bookName, String bookAuthor, String bookParticulars, int bookTypeId,
                                          @RequestParam("file") MultipartFile file, String bookPicture, Double bookPrice, Integer bookTotal, Integer bookQuantity) {

        ModelAndView modelAndView = new ModelAndView("updateBookSucceed");
        try {
            String newBookPicture =FileUploading.fileUpload(file, bookPicture);
            if (newBookPicture == null) {

            } else {
                bookPicture = newBookPicture;
            }
            Date date = new Date();
            int i = bookService.updateBook(id, bookIsbn, bookName, bookAuthor, bookParticulars, bookTypeId, bookPicture,
                    bookPrice, date, bookTotal, bookQuantity);
            modelAndView.addObject("i", i);
            System.out.println(i);
            return modelAndView;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return modelAndView;
    }

    @RequestMapping("/deleteBook")
    public String show(int id) {
        int res = JOptionPane.showConfirmDialog(null, "是否删除", "是否删除", JOptionPane.YES_NO_OPTION);
        if (res == JOptionPane.YES_OPTION) {
            int i = bookService.deleteBook(id);
            return "redirect:/book/books";
        } else {
            return "redirect:/book/books";
        }
    }


    @RequestMapping("/books")
    public ModelAndView show(@RequestParam(required = false) String queryName, @RequestParam(required = false) Integer bookTypeId,
                              @RequestParam(required = false) Integer pageNo, @RequestParam(required = false) Integer pageSize) {
        if(pageNo ==null){
            pageNo = 1;
        }
        if(pageSize == null){
            pageSize =5;
        }
        Page page = new Page();
        page.setPageSize(pageSize);
        List<BookType> bookTypeList = bookTypeService.queryAllBookType();
        List<Books> booksList = bookService.queryAllBooks(queryName, bookTypeId ,pageNo, pageSize);
        int count = bookService.count(queryName, bookTypeId);
        page.setTotalNum(count);
        int pageNumCount = page.getTotalPageNum();
        ModelAndView modelAndView = new ModelAndView("books");
        modelAndView.addObject("bookTypeList", bookTypeList);
        modelAndView.addObject("booksList", booksList);
        modelAndView.addObject("count", count);
        modelAndView.addObject("queryName", queryName);
        modelAndView.addObject("bookTypeId", bookTypeId);
        modelAndView.addObject("pageNumCount",pageNumCount);
        modelAndView.addObject("pageNo",pageNo);
        modelAndView.addObject("pageSize",pageSize);
        return modelAndView;
    }

    @RequestMapping("/particulars")
    public ModelAndView particulars(int id) {
        ModelAndView modelAndView = new ModelAndView("particulars");
        Books book = bookService.queryBook(id);
        modelAndView.addObject("book", book);
        return modelAndView;
    }

    @RequestMapping("/borrowBook")
    public ModelAndView borrowBook(int id) {
        Date date = new Date();
        ModelAndView modelAndView = new ModelAndView("borrowBook");
        Books book = bookService.queryBook(id);
        modelAndView.addObject("book", book);
        modelAndView.addObject("date", date);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping("/queryBooksByIsbn")
    public List queryBooksByIsbn(String isbn,Integer limit){
        List<Books> booksList = bookService.queryBooksByIsbn(isbn,limit);
        return booksList;
    }
    @ResponseBody
    @RequestMapping("/Exists/isbn")
    public Boolean ExistsUserName(String isbn) {
/*
        返回map对象的原因：可以将错误原因推送给前端，如果只是布尔类型的，就只有一个false，这两种方式都可以。根据个人习惯以及实际的情况
        如果是找的插件去验证，就要根据插件的要求进行返回。
*/
        Books books = bookService.findBookByIsbn(isbn);
        //1、此处调用service类，根据用户名查找用户

        if (books == null) {
            return false;
        }else {
            return true;
        }
    }
}
