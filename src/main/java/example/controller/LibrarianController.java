package example.controller;

import example.entity.Books;
import example.entity.Librarian;
import example.entity.User;
import example.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("/librarian")
public class LibrarianController {
    @Autowired
    private LibrarianService librarianService;
    @Autowired
    private UserService userService;
    @Autowired
    private PersonalService personalService;
    @Autowired
    private BorrowBookService borrowBookService;
    @Autowired
    private BookService bookService;
    private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    //管理员登录界面
    @RequestMapping("/login")
    public String login(){
        return "adminLogin";
    }

    @RequestMapping("/sgin")
    public String  sgin(String name, String psd, HttpServletRequest request){

        Boolean b = librarianService.Login(name,psd,request);
        if(b ==false){
            return "adminLoginError";//TODO 跳转到登录页面视图[jsp页面] ,在JSP页面中将错误信息显示出来就可以
        }
        return "redirect:/book/index"; //此处不建议写跳转到视图，如果这个视图页面需要传入一些值，就需要再写一遍，建议使用转发（redirect），跳转到对应的请求地址
    }

    @RequestMapping("/addUser")
    public String addUser(){
        return "addUser";
    }

    @RequestMapping("/addUserMethod")
    public String addUserMethod(@RequestParam(required = false)String name, @RequestParam(required = false)String psd, @RequestParam(required = false)String phone, ModelMap response){
        Date date  = new Date();
        Boolean b = userService.addUser(name, psd,phone,date );
        if(b ==false){
            //弹出提示框显示用户名或密码错误
            response.put("error","新增失败，请重试！");
            return "register";
        }
        //弹出一个确认框，点击确认后，在跳转
        User user = userService.findUserByName(name);
        int userId = user.getId();
        int i = personalService.addPersonal(userId);

        JOptionPane.showMessageDialog(null,"新增成功!");
        return "addUser";
    }

    @RequestMapping("/changePwd")
    public String changePwd(Model model, HttpServletRequest request){
        HttpSession session=request.getSession();
        Librarian librarian=(Librarian) session.getAttribute("librarian");
        model.addAttribute("librarian",librarian);
        return "changePwd";
    }

    @RequestMapping("/changePwdSucceed")
    public String changePwdSucceed( int id,String pwd){
        int i = librarianService.changePwd(pwd, id);
        if(i == 1){
            JOptionPane.showMessageDialog(null, "修改密码成功,请重新登录","成功",JOptionPane.ERROR_MESSAGE);
            return "redirect:/librarian/login";
        }else {
            JOptionPane.showMessageDialog(null, "修改密码失败，请稍后重试！","成功",JOptionPane.ERROR_MESSAGE);
            return "redirect:/book/index";
        }
    }
    @RequestMapping("/borrowBooks")
    public ModelAndView borrowBooks() {
        ModelAndView modelAndView =new ModelAndView("librarian/borrowBooks");
        Date date = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.MONTH,1);
        Date  monthDate = calendar.getTime();

        Calendar calendar2 = Calendar.getInstance();
        calendar2.setTime(date);
        calendar2.add(Calendar.DATE,7);

        Date  weekDate = calendar2.getTime();
        List<Books> booksList = bookService.queryAllBookList();
        List isbnList = new ArrayList();
        for(Books books:booksList){
            isbnList.add(books.getBookIsbn());
        }
        modelAndView.addObject("isbnList",isbnList);
        modelAndView.addObject("date",date);
        modelAndView.addObject("monthDate",monthDate);
        modelAndView.addObject("weekDate",weekDate);
        return modelAndView;
    }

    @RequestMapping("/succeedBorrow")
    public ModelAndView succeedBorrow(String userName, String isbn ,Integer quantity, String startDate, String returnDate){
        ModelAndView modelAndView = new ModelAndView("librarian/succeedBorrow");
        try {
            Date startDate1 = sdf.parse(startDate);
            Date returnDate1 = sdf.parse(returnDate);
            User user = userService.findUserByName(userName);
            int userId = user.getId();
            Books books = bookService.findBookByIsbn(isbn);
            int bookId = books.getId();
            String bookName = books.getBookName();
            Integer i = borrowBookService.borrowBook(userName, bookName, quantity, startDate1, returnDate1, userId, bookId);
            Integer y = bookService.updateBooksQuantity(bookId, quantity);
            modelAndView.addObject("i",i);
            modelAndView.addObject("y",y);
            return modelAndView;
        }catch (Exception e){
            e.printStackTrace();
            return modelAndView;
        }
    }
}
