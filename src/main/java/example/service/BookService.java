package example.service;

import example.entity.BookType;
import example.entity.Books;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface BookService {
    List<BookType> queryBookType();
    int count(String bookName);
    List<Books> queryAllBooks(String bookName);

    Books queryBook(int id);
}
