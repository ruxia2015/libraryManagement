package example.service;

import example.dao.LibrarianDao;
import example.entity.Librarian;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class LibrarianService {
    @Resource
    private LibrarianDao librarianDao;

    public List<Librarian> queryLibrarianList(){

        return librarianDao.queryLibrarianList();
    }

}
