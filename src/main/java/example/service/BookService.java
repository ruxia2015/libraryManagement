package example.service;

import example.entity.BookType;
import example.entity.Books;
import org.springframework.stereotype.Service;

import java.awt.print.Book;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public interface BookService {
    int count(String queryName, Integer bookTypeId);
    List<Books> queryAllBooks(String queryName, Integer bookTypeId, Integer pageNo, Integer pageSize);

    Books queryBook(int id);

    Books findBooksByName(String bookName);

    int updateBooksQuantity(int id, Integer quantity);

    int addBook(String bookIsbn, String bookName, String bookAuthor, String bookParticulars,  int bookTypeId, String bookPicture, Double bookPrice, Date date, int bookTotal, int bookQuantity);


    int updateBook(int id, String bookIsbn, String bookName, String bookAuthor, String bookParticulars,  int bookTypeId, String bookPicture, Double bookPrice, Date date, Integer bookTotal, Integer bookQuantity);

    int deleteBook(int id);


    int addBooksQuantity(int bookId, int quantity);

    Books findBookByIsbn(String isbn);

    List<Books> queryAllBookList();

    List<Books> queryBooksByIsbn(String isbn, Integer limit);
}
