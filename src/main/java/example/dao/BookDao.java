package example.dao;

import example.entity.BookType;
import example.entity.Books;

import java.util.List;

public interface BookDao {
    List<BookType> queryBookType ();
    int count(String bookName);
    List<Books> queryAllBooks(String bookName);

    Books queryBook(int id);

    Books findBooksByName(String bookName);

    int updateBooksQuantity(int id);
}
