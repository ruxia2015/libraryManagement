package example.service.impl;

import example.dao.BookDao;
import example.entity.BookType;
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
}
