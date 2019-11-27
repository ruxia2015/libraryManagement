package example.service.impl;

import example.dao.LoginDao;
import example.entity.User;
import example.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {
    @Autowired
    private LoginDao loginDao;

    public User findUserByName(String name) {
        User user = loginDao.findUser(name);
        return user;
    }


    public Boolean userLogin(String name, String psd) {
        if (name == null) {

        }
        User user = loginDao.findUser(name);
        if (user == null || user.getUserPassword().equals(psd)) {
            return false;
        }
        //此处将值写入的session中，以便验证登陆。session对象可以从request中获取，controller中传入，或者写一个工具进行获取
        return true;
    }
}
