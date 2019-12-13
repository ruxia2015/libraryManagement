package example.controller;

import example.entity.BookType;
import example.entity.Books;
import example.service.BookService;
import example.service.BookTypeService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.swing.*;
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
//            String path = BookInfoController.class.getResource("/").getPath();
////            System.out.println(path);
//            String newPath = StringUtils.substringBeforeLast(path, "c");
//            String outPutPath = newPath+"statics/image/"+file.getOriginalFilename();
////            System.out.println(outPutPath);
//            File fileNew = new File(outPutPath);
//            File fileParent = fileNew.getParentFile();
//            if(!fileParent.exists()){
//                fileParent.mkdirs();
//            }
//            try {
//                //获取输出流
//                OutputStream os=new FileOutputStream(outPutPath);
//                //获取输入流 CommonsMultipartFile 中可以直接得到文件的流
//               InputStream is=file.getInputStream();
//                int temp;
//                //一个一个字节的读取并写入
//                while((temp=is.read())!=(-1))
//                {
//                    os.write(temp);
//                }
//                os.flush();
//                os.close();
//                is.close();
//            } catch (FileNotFoundException e) {
//                e.printStackTrace();
//            }
            try{
                String bookPicture = "image/默认.jpg";
                String  newBookPicture = new UtilityController().fileUpload(file,bookPicture);
                if(newBookPicture == null){

                }else {
                    bookPicture = newBookPicture ;
                }
                    Date date = new Date();
                    int i = bookService.addBook(bookIsbn, bookName, bookAuthor, bookParticulars, bookType, bookPicture,
                            bookPrice, date,  bookTotal,  bookQuantity  );
                    modelAndView.addObject("i",i);

            }catch (Exception e){
                e.printStackTrace();
            }
            return modelAndView;
        }

        @RequestMapping("updateBook")
        public ModelAndView updateBook(int id){
        ModelAndView modelAndView = new ModelAndView("updateBook");
        Books books = bookService.queryBook(id);
        List<BookType> bookTypeList = bookTypeService.queryAllBookType();
        modelAndView.addObject("bookTypeList",bookTypeList);
        modelAndView.addObject("books",books);
        return modelAndView;
        }

        @RequestMapping("/updateBookSucceed")
        public ModelAndView updateBookSucceed(int id, Integer bookIsbn, String bookName, String bookAuthor, String bookParticulars, String bookType,
                                              @RequestParam("file") MultipartFile file, String bookPicture,   Double bookPrice , Integer bookTotal, Integer bookQuantity){

            ModelAndView modelAndView = new ModelAndView("updateBookSucceed");

            try{
                    String  newBookPicture = new UtilityController().fileUpload(file,bookPicture);
                    if(newBookPicture == null){

                    }else {
                         bookPicture = newBookPicture ;
                    }
                    Date date = new Date();
                    int i = bookService.updateBook(id, bookIsbn, bookName, bookAuthor, bookParticulars, bookType, bookPicture,
                            bookPrice, date,  bookTotal,  bookQuantity  );
                    modelAndView.addObject("i",i);
                    System.out.println(i);
                    return modelAndView;
            }catch (Exception e){
                e.printStackTrace();
            }
            return modelAndView;
        }

        @RequestMapping("/deleteBook")
        public String  show(int id){
            int res= JOptionPane.showConfirmDialog(null, "是否删除", "是否删除", JOptionPane.YES_NO_OPTION);
            if(res == JOptionPane.YES_OPTION){
                int i = bookService.deleteBook(id);
                return "redirect:/book/books";
            }else {
                return "redirect:/book/books";
            }
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
