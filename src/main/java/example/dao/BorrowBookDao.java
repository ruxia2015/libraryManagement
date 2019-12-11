package example.dao;

import example.entity.Borrow;

import java.util.Date;
import java.util.List;

public interface BorrowBookDao {
    int borrowBook(String userName, String bookName, int bookQuantity, Date startDate, Date returnDate , int userId,int bookId);

    List<Borrow> borrowMessage(String userName);
}
