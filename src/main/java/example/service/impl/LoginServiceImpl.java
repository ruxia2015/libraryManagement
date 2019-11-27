package example.service.impl;

import example.dao.LoginDao;
import example.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;

public class LoginServiceImpl implements LoginService {
    @Autowired
    private LoginDao loginDao;
    public Boolean Sgin(String name, String psd) {
        return null;
    }
    //

}
