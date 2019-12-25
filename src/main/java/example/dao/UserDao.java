package example.dao;


import example.entity.User;

import java.util.Date;
import java.util.List;

public interface UserDao {
    User findUserByName(String name);

    int addUser(String name, String psd, String phone, Date date);

    int count(String userName);

    List<User> queryAllUser(int id,int pageNo,int pageSize);

    int resetPwd(String pwd, int userId);

}