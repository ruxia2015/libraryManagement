package example.service;

import example.entity.User;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Service
public interface UserService {

    User findUserByName(String userName);

    Boolean userLogin(String name, String psd, HttpServletRequest  request);

    Boolean addUser(String name, String psd, String phone, Date date);

    int count(String userName);

    List<User> queryAllUser(int id, int pageNo, int pageSize);

    int resetPwd(String pwd, int userId);


    User findUserById(int id);

    int deleteUser(int id);

    int updateUser(int id, String pwd, String phone, Date date);
}

