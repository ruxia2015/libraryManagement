package example.service.impl;

import example.dao.PersonalDao;
import example.entity.Personal;
import example.service.PersonalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PersonalServiceImpl implements PersonalService {
    @Autowired
    private PersonalDao personalDao;

    public int addPersonal(int userId) {
        return personalDao.addPersonal(userId);
    }

    public Personal findPersonalByID(int userId) {
        return personalDao.findPersonalByID(userId);
    }

    public int updatePersonal(int userId, String nickname, Integer age, String sex, String address) {
        return personalDao.updatePersonal(userId,nickname,age,sex,address);
    }
}
