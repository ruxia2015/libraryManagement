package example.service;



import example.entity.BorrowBook;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public interface BorrowBookService {

    int borrowBook(String userName, String bookName, int bookQuantity, Date startDate, Date returnDate, int userId,int bookId);

    List<BorrowBook> borrowMessage(String userName);

    List<BorrowBook> queryAllBorrow(int id, String bookName);

    BorrowBook findBorrowById(int id);

    int updateBorrow(int id, Date date ,int overdue);
}
