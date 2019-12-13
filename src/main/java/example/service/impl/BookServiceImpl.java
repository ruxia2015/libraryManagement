package example.service.impl;

import example.dao.BookDao;
import example.entity.BookType;
import example.entity.Books;
import example.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class BookServiceImpl implements BookService {
    @Autowired
    private BookDao bookDao;

    public int count(String bookName){
        return bookDao.count(bookName);
    }

    public List<Books> queryAllBooks(String bookName) {
        return bookDao.queryAllBooks(bookName);
    }

    public Books queryBook(int id) {
        return bookDao.queryBook(id);
    }

    public Books findBooksByName(String bookName) {
        return bookDao.findBooksByName(bookName);
    }

    public int updateBooksQuantity(int id) {
        return bookDao.updateBooksQuantity(id);
    }

    public int addBook(int bookIsbn, String bookName, String bookAuthor, String bookParticulars, String bookType, String bookPicture,  Double bookPrice, Date date, int bookTotal, int bookQuantity) {
        return bookDao.addBook(bookIsbn, bookName, bookAuthor, bookParticulars, bookType, bookPicture,
                bookPrice, date,  bookTotal,  bookQuantity);
    }

    public int updateBook(int id ,Integer bookIsbn, String bookName, String bookAuthor, String bookParticulars, String bookType, String bookPicture, Double bookPrice, Date date, Integer bookTotal, Integer bookQuantity) {
        return bookDao.updateBook(id, bookIsbn, bookName, bookAuthor, bookParticulars, bookType, bookPicture,
                bookPrice, date,  bookTotal,  bookQuantity);
    }

    public int deleteBook(int id) {
        return bookDao.deleteBook(id);
    }
}
