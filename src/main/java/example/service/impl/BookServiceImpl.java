package example.service.impl;

import example.dao.BookDao;
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

    public int count(String queryName,Integer bookTypeId){
        return bookDao.count(queryName,bookTypeId);
    }

    public List<Books> queryAllBooks(String queryName,Integer bookTypeId,Integer pageNo, Integer pageSize) {
        return bookDao.queryAllBooks(queryName, bookTypeId, pageNo, pageSize);
    }

    public Books queryBook(int id) {
        return bookDao.queryBook(id);
    }

    public Books findBooksByName(String bookName) {
        return bookDao.findBooksByName(bookName);
    }

    public int updateBooksQuantity(int id,Integer quantity) {
        return bookDao.updateBooksQuantity(id, quantity);
    }

    public int addBook(String bookIsbn, String bookName, String bookAuthor, String bookParticulars, int bookTypeId, String bookPicture,  Double bookPrice, Date date, int bookTotal, int bookQuantity) {
        return bookDao.addBook(bookIsbn, bookName, bookAuthor, bookParticulars, bookTypeId, bookPicture,
                bookPrice, date,  bookTotal,  bookQuantity);
    }

    public int updateBook(int id ,String bookIsbn, String bookName, String bookAuthor, String bookParticulars,  int bookTypeId, String bookPicture, Double bookPrice, Date date, Integer bookTotal, Integer bookQuantity) {
        return bookDao.updateBook(id, bookIsbn, bookName, bookAuthor, bookParticulars,  bookTypeId, bookPicture,
                bookPrice, date,  bookTotal,  bookQuantity);
    }

    public int deleteBook(int id) {
        return bookDao.deleteBook(id);
    }

    public int addBooksQuantity(int bookId, int quantity) {
        return bookDao.addBooksQuantity(bookId, quantity);
    }


}
