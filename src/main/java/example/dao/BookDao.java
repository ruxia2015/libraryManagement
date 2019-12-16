package example.dao;

import example.entity.Books;

import java.util.Date;
import java.util.List;

public interface BookDao {

    int count(String bookName,Integer bookTypeId);
    List<Books> queryAllBooks(String bookName,Integer bookTypeId);

    Books queryBook(int id);

    Books findBooksByName(String bookName);

    int updateBooksQuantity(int id);

    int addBook(int bookIsbn, String bookName, String bookAuthor, String bookParticulars,  String bookType,String bookPicture, Double bookPrice, Date date, int bookTotal, int bookQuantity);

    int updateBook(int id , Integer bookIsbn, String bookName, String bookAuthor, String bookParticulars, String bookType, String bookPicture, Double bookPrice, Date date, Integer bookTotal, Integer bookQuantity);

    int deleteBook(int id);
}
