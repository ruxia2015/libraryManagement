package example.dao.impl;

import example.dao.LoginDao;
import example.entity.User;
import org.springframework.stereotype.Service;

@Service
public class LoginDaoImpl implements LoginDao {
    public User findUser(String name) {
        return null;
    }
}
