package example.dao;


import example.entity.User;

import java.util.Date;
import java.util.List;

public interface LoginDao {
    User findUser(String name);

    int addUser(String name, String psd, String phone, Date date);

    List<User> selectAllUser();
    List<User> selectAllUserList(int pageNo,int pageNum);

    List<User> queryUser(String userName);
}
