package example.dao;

import example.entity.BorrowBook;

import java.util.Date;
import java.util.List;

public interface BorrowBookDao {
    int borrowBook(String userName, String bookName, int bookQuantity, Date startDate, Date returnDate , int userId,int bookId);

    List<BorrowBook> borrowMessage(String userName);


    List<BorrowBook> queryAllBorrow(int id, String bookName);

    BorrowBook findBorrowById(int id);

    int updateBorrow(int id, Date date, int overdue);

    List<BorrowBook> queryAllOverdue(int id, String bookName);

    int overdueCount(Integer id);

    int borrowCount(Integer id);

    List<BorrowBook> queryAllBorrowByStartDate(int userId);
}
