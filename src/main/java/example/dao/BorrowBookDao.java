package example.dao;

import java.util.Date;

public interface BorrowBookDao {
    int borrowBook(String userName, String bookName, int bookQuantity, Date startDate, Date returnDate);
}
