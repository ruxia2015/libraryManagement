package example.service;

import example.entity.User;

public interface LoginService {

    Boolean   findUser(String name,String psd);

}
