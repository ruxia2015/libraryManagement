package example.service;

import example.dao.LibrarianDao;
import example.entity.Librarian;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public interface LibrarianService {

    Boolean Login(String name, String psd, HttpServletRequest request);

    Librarian findUserByName(String userName);

    List<Librarian> queryLibrarianList();

    int changePwd(String pwd, int id);
}
