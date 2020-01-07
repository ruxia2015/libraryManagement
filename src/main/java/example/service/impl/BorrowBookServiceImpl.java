package example.service.impl;

import example.dao.BorrowBookDao;
import example.entity.BorrowBook;
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

    public List<BorrowBook> borrowMessage(String userName) {
        return borrowBookDao.borrowMessage(userName);
    }


    public List<BorrowBook> queryAllBorrow(int id, String bookName) {
        return borrowBookDao.queryAllBorrow(id, bookName);
    }

    public BorrowBook findBorrowById(int id) {
        return borrowBookDao.findBorrowById(id);
    }

    public int updateBorrow(int id, Date date, int overdue) {
        return borrowBookDao.updateBorrow(id,date,  overdue);
    }

    public List<BorrowBook> queryAllOverdue(int id, String bookName) {
        return borrowBookDao.queryAllOverdue(id, bookName);
    }

    public int overdueCount(Integer id) {
        return borrowBookDao.overdueCount(id);
    }

    public int borrowCount(Integer id) {
        return borrowBookDao.borrowCount(id);
    }

    public List<BorrowBook> queryAllBorrowByStartDate(int userId) {
        return borrowBookDao.queryAllBorrowByStartDate(userId);
    }
}
