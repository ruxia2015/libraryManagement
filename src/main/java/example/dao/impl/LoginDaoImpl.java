package example.dao.impl;

import example.dao.LoginDao;
import example.entity.User;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Repository
public class LoginDaoImpl implements LoginDao {
    @Resource
    private SqlSessionTemplate sqlSessionTemplate;
    public User findUser(String name) {
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("userName",name);
        return sqlSessionTemplate.selectOne("user.findUser",params);
    }

    public int addUser(String name, String psd, String phone) {
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("userName",name);
        params.put("userPassword",psd);
        params.put("phone",phone);
        return sqlSessionTemplate.insert("user.addUser",params);
    }
}
