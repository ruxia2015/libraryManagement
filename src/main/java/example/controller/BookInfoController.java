package example.controller;

import example.entity.BookType;
import example.entity.Books;
import example.service.BookService;
import example.service.BookTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/book")
public class BookInfoController {
    @Autowired
    private BookService bookService;
    @Autowired
    private BookTypeService bookTypeService;

    @RequestMapping("/index")
    public String index(){
        return "index";
    }

    @RequestMapping("/addBook")
    public ModelAndView addBook (){
        ModelAndView modelAndView = new ModelAndView("addBook");
        List<BookType> bookTypeList = bookTypeService.queryAllBookType();
        modelAndView.addObject("bookTypeList",bookTypeList);
        return modelAndView;
    }

        @RequestMapping("/addBookSucceed")
        public ModelAndView addBookSucceed(Integer bookIsbn, String bookName, String bookAuthor,
                                           String bookParticulars, String bookPicture, String bookType,  Double bookPrice ,Integer bookTotal, Integer bookQuantity){

            ModelAndView modelAndView = new ModelAndView("addBookSucceed");
            Date date = new Date();
            int i = bookService.addBook(bookIsbn, bookName, bookAuthor, bookParticulars, bookPicture, bookType,
                    bookPrice, date,  bookTotal,  bookQuantity  );
            modelAndView.addObject("i",i);
            return modelAndView;
        }



    @RequestMapping("/books")
    public ModelAndView show(String bookName){
        List<BookType> bookTypeList =bookTypeService.queryAllBookType();
        List<Books> booksList = bookService.queryAllBooks(bookName);
        int count = bookService.count( bookName);
        ModelAndView modelAndView = new ModelAndView("books");
        modelAndView.addObject("bookTypeList",bookTypeList);
        modelAndView.addObject("booksList",booksList);
        modelAndView.addObject("count",count);
        return modelAndView;
    }

    @RequestMapping("/particulars")
    public ModelAndView particulars(int id){
        ModelAndView modelAndView = new ModelAndView("particulars");
        Books book = bookService.queryBook(id);
        modelAndView.addObject("book",book);
        return modelAndView;
    }
    @RequestMapping("/borrowBook")
    public ModelAndView borrowBook(int id){
        Date date = new Date();
        ModelAndView modelAndView = new ModelAndView("borrowBook");
        Books book = bookService.queryBook(id);
        modelAndView.addObject("book",book);
        modelAndView.addObject("date",date);
        return modelAndView;
    }
    @RequestMapping("/returnBook")
    public ModelAndView returnBook(int id){
        Date date = new Date();
        ModelAndView modelAndView = new ModelAndView("returnBook");
        Books book = bookService.queryBook(id);
        modelAndView.addObject("book",book);
        modelAndView.addObject("date",date);
        return modelAndView;
    }

}
