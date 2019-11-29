package example.service;

import example.entity.User;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Service
public interface LoginService {

    User findUserByName(String name);

    Boolean userLogin(String name, String psd, HttpServletRequest  request);

    Boolean addUser(String name, String psd, String phone, Date date);
}
