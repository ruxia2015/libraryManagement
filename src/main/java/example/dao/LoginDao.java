package example.dao;


import example.entity.User;

import java.util.Date;

public interface LoginDao {
    User findUser(String name);

    int addUser(String name, String psd, String phone, Date date);
}
