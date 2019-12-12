package example.service;

import example.entity.BookType;
import example.entity.Books;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public interface BookService {
    int count(String bookName);
    List<Books> queryAllBooks(String bookName);

    Books queryBook(int id);

    Books findBooksByName(String bookName);

    int updateBooksQuantity(int id);

    int addBook(int bookIsbn, String bookName, String bookAuthor, String bookParticulars,  String bookType, String bookPicture, Double bookPrice, Date date, int bookTotal, int bookQuantity);
}
