package example.service;

import example.entity.User;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Service
public interface LoginService {

    User findUserByName(String name);
    User findUserByName2(String userName);


    Boolean userLogin(String name, String psd, HttpServletRequest  request);

    Boolean addUser(String name, String psd, String phone, Date date);

    List<User> selectAllUser();
    List<User> selectAllUserList(int pageNo, int pageNum);
    List<User> queryUser(String userName);

    int count(String userName);


    List<User> queryAllUser(int pageNo, int pageNum, String userName);

    int resetPwd(String pwd, int userId);

    List<User> queryUserBorrow(int id, String bookName);
}

