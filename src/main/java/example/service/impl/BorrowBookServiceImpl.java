package example.service.impl;

import example.dao.BorrowBookDao;
import example.entity.Borrow;
import example.service.BorrowBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class BorrowBookServiceImpl implements BorrowBookService {
    @Autowired
    private BorrowBookDao borrowBookDao;

    public int borrowBook(String userName, String bookName, int bookQuantity, Date startDate, Date returnDate, int userId,int bookId) {
        return borrowBookDao.borrowBook(userName, bookName, bookQuantity, startDate, returnDate, userId, bookId );
    }

    public List<Borrow> borrowMessage(String userName) {
        return borrowBookDao.borrowMessage(userName);
    }


    public List<Borrow> queryAllBorrow(int id, String bookName) {
        return borrowBookDao.queryAllBorrow(id, bookName);
    }
}
