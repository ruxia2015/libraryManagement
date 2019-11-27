package example.dao.impl;

import example.dao.LoginDao;
import example.entity.User;
import org.springframework.stereotype.Service;

@Service
public class LoginDaoImpl implements LoginDao {
    public User findUser(String name) {
        //进入数据库，通过name查找User对象
        String sql = "";
        return null;
    }
}
