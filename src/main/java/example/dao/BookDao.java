package example.dao;

import example.entity.BookType;

import java.util.List;

public interface BookDao {
    List<BookType> queryBookType ();
}
