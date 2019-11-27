package example.service;

import example.entity.User;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public interface LoginService {

    User findUserByName(String name);

    Boolean userLogin(String name, String psd, HttpServletRequest  request);
}
