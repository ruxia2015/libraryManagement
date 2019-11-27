package example.service;

import example.entity.User;

public interface LoginService {


    User findUserByName(String name);

    Boolean userLogin(String name, String psd);
}
