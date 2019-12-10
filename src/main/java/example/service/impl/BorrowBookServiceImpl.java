package example.service.impl;

import example.dao.BorrowBookDao;
import example.service.BorrowBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class BorrowBookServiceImpl implements BorrowBookService {
    @Autowired
    private BorrowBookDao borrowBookDao;

    public int borrowBook(String userName, String bookName, int bookQuantity, Date startDate, Date returnDate, int userId,int booksId) {
        return borrowBookDao.borrowBook(userName, bookName, bookQuantity, startDate, returnDate, userId, booksId );
    }
}
