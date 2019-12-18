package example.dao;


import example.entity.User;

import java.util.Date;
import java.util.List;

public interface LoginDao {
    User findUser(String name);
    User findUserByName2(String userName);


    int addUser(String name, String psd, String phone, Date date);

    List<User> selectAllUser();
    List<User> selectAllUserList(int pageNo,int pageNum);

    List<User> queryUser(String userName);

    int count(String userName);


    List<User> queryAllUser(int pageNo,int pageNum, String userName);

    int resetPwd(String pwd, int userId);

    List<User> queryUserBorrow(int id, String bookName);
}
