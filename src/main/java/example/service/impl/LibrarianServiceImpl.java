package example.service.impl;

import example.dao.LibrarianDao;
import example.entity.Librarian;
import example.service.LibrarianService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class LibrarianServiceImpl implements LibrarianService {
    @Autowired
    private LibrarianDao librarianDao;

    public Boolean Login(String name, String psd, HttpServletRequest request) {
        Librarian librarian = librarianDao.findLibrarianByName(name);
        if (librarian == null || !librarian.getPassword().equals(psd)) {
            return false;
        }
        HttpSession session = request.getSession();
        session.setAttribute("librarian",librarian);
        return true;
    }

    public Librarian findUserByName(String userName) {
        return librarianDao.findLibrarianByName(userName);
    }

    public List<Librarian> queryLibrarianList() {
        return librarianDao.queryLibrarianList();
    }

    public int changePwd(String pwd, int id) {
        return librarianDao.changePwd(pwd,id);
    }
}
