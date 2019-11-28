package example.dao;


import example.entity.User;

public interface LoginDao {
    User findUser(String name);

    int addUser(String name, String psd, String phone);
}
