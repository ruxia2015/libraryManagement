package example.service;

import org.springframework.stereotype.Service;

@Service
public interface LoginService {

    Boolean Sgin(String name, String psd);

}
