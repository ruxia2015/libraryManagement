package example.service;



import example.entity.Borrow;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public interface BorrowBookService {

    int borrowBook(String userName, String bookName, int bookQuantity, Date startDate, Date returnDate, int userId,int bookId);

    List<Borrow> borrowMessage(String userName);

    List<Borrow> queryAllBorrow(int id, String bookName);
}
