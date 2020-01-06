package example.service;

import example.entity.Personal;
import org.springframework.stereotype.Service;

@Service
public interface PersonalService {
    int addPersonal(int uderId);

    Personal findPersonalByID(int userId);

    int updatePersonal(int userId, String nickname, Integer age, String sex, String address);
}
