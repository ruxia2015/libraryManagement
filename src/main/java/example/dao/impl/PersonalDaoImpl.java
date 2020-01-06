package example.dao.impl;

import example.dao.PersonalDao;
import example.entity.Personal;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Repository
public class PersonalDaoImpl implements PersonalDao {
    @Resource
    private SqlSessionTemplate sqlSessionTemplate;

    public int addPersonal(int userId) {
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("userId",userId);
        return sqlSessionTemplate.insert("addPersonal",params);

    }

    public Personal findPersonalByID(int userId) {
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("userId",userId);
        return sqlSessionTemplate.selectOne("findPersonalByID",params);
    }

    public int updatePersonal(int userId, String nickname, Integer age, String sex, String address) {
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("userId",userId);
        params.put("nickname",nickname);
        params.put("age",age);
        params.put("sex",sex);
        params.put("address",address);
        return sqlSessionTemplate.update("updatePersonal",params);
    }
}
