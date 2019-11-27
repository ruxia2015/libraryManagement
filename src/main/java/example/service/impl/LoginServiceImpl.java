package example.service.impl;

import example.dao.LoginDao;
import example.entity.User;
import example.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;

public class LoginServiceImpl implements LoginService {
    @Autowired
    private LoginDao loginDao;


    public Boolean findUser(String name, String psd) {
        if(name ==null){

        }

      User user =   loginDao.findUser(name);
      if(user ==null || user.getUserPassword().equals(psd)){
          return false;
      }
      return true;
    }
}
