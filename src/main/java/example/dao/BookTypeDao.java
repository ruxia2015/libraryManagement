package example.dao;

import example.entity.BookType;
import java.util.List;

public interface BookTypeDao {
    List<BookType> queryAllBookType();
    BookType queryBookTypeByName(String bookTypeName);
}
