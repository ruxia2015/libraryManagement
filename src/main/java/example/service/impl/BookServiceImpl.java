package example.service.impl;

import example.dao.BookDao;
import example.entity.BookType;
import example.entity.Books;
import example.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookServiceImpl implements BookService {
    @Autowired
    private BookDao bookDao;
    public List<BookType> queryBookType() {
        return bookDao.queryBookType();
    }
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
}
