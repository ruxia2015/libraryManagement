package example.service.impl;

import example.dao.BookTypeDao;
import example.entity.BookType;
import example.service.BookTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookTypeServiceImpl implements BookTypeService {
    @Autowired
    private BookTypeDao bookTypeDao;
    public List<BookType> queryAllBookType() {
        return bookTypeDao.queryAllBookType();
    }

    public BookType queryBookTypeByName(String bookTypeName) {
        return bookTypeDao.queryBookTypeByName(bookTypeName);
    }
}
