package example.dao;

import example.entity.Personal;

public interface PersonalDao {
    int addPersonal(int userId);

    Personal findPersonalByID(int userId);

    int updatePersonal(int userId, String nickname, Integer age, String sex, String address);
}
