package example.service;



import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public interface BorrowBookService {

    int borrowBook(String userName, String bookName, int bookQuantity, Date startDate, Date returnDate);
}
