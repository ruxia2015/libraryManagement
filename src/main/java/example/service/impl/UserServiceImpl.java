package example.service.impl;

import example.dao.UserDao;
import example.entity.User;
import example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;


@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    public User findUserByName(String userName) {
        return userDao.findUserByName(userName);
    }

    public Boolean userLogin(String name, String psd, HttpServletRequest request) {
        if (name == null) {

        }
        User user = userDao.findUserByName(name);
        if (user == null || !user.getUserPassword().equals(psd)) {
            return false;
        }
        //此处将值写入的session中，以便验证登陆。session对象可以从request中获取，controller中传入，或者写一个工具进行获取
        HttpSession session = request.getSession();
        session.setAttribute("user",user);
        return true;
    }

    public Boolean  addUser(String name, String psd, String phone, Date date) {
        int i = userDao.addUser(name, psd, phone, date);
       if(i==1){
           return true;
       }else {
           return false;
       }
    }


    public int count(String userName){
        return userDao.count(userName);
    }
    public List<User> queryAllUser(int id, int pageNo, int pageSize){
        return   userDao.queryAllUser(id, pageNo , pageSize);
    }

    public int resetPwd(String pwd, int userId) {
        return userDao.resetPwd(pwd, userId);
    }

    public User findUserById(int id) {
        return userDao.findUserById(id);
    }

    public int deleteUser(int id) {
        return userDao.deleteUser(id);
    }

    public int updateUser(int id, String pwd, String phone, Date date) {
        return userDao.updateUser(id, pwd, phone, date);
    }

    public List<User> queryUserByName(String userName,Integer limit) {
        return userDao.queryUserByName(userName,limit);
    }

}
