package example.dao.impl;

import example.dao.LoginDao;
import example.entity.User;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Service
public class LoginDaoImpl implements LoginDao {
    @Resource
    private SqlSessionTemplate sqlSessionTemplate;
    public User findUser(String name) {
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("userName",name);
        return sqlSessionTemplate.selectOne("user.findUser",params);
    }
}
