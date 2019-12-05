package example.service;

import example.entity.BookType;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface BookService {
    List<BookType> queryBookType();
}
