package example.controller;

import example.entity.BookType;
import example.entity.Books;
import example.service.BookService;
import example.service.BookTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
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
        public ModelAndView addBookSucceed(Integer bookIsbn, String bookName, String bookAuthor, String bookParticulars, String bookType,
                                           @RequestParam("file") MultipartFile file,  Double bookPrice , Integer bookTotal, Integer bookQuantity, HttpServletRequest request)throws IOException {

            ModelAndView modelAndView = new ModelAndView("addBookSucceed");
            //先创建一个文件目录，若该目录不存在，则新建该目录
            //String path = request.getContextPath();
            String path = BookInfoController.class.getResource("/").getPath();
            System.out.println(path);
            String outPutPath = path+"statics/image/"+file.getOriginalFilename();
            System.out.println(outPutPath);
            File fileNew = new File(outPutPath);
            File fileParent = fileNew.getParentFile();
            if(!fileParent.exists()){
                fileParent.mkdirs();
            }
            try {
                //获取输出流
                OutputStream os=new FileOutputStream(outPutPath);
                //获取输入流 CommonsMultipartFile 中可以直接得到文件的流
               InputStream is=file.getInputStream();
                int temp;
                //一个一个字节的读取并写入
                while((temp=is.read())!=(-1))
                {
                    os.write(temp);
                }
                os.flush();
                os.close();
                is.close();
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            }

            String bookPicture = "image/"+file.getOriginalFilename();;
            Date date = new Date();
            int i = bookService.addBook(bookIsbn, bookName, bookAuthor, bookParticulars, bookType, bookPicture,
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
