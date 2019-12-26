package example.dao.impl;

import example.dao.UserDao;
import example.entity.User;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class UserDaoImpl implements UserDao {
    @Resource
    private SqlSessionTemplate sqlSessionTemplate;
    public User findUserByName(String name) {
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("userName",name);
        return sqlSessionTemplate.selectOne("user.findUserByName",params);
    }

    public List<User> queryUserByName(String name) {
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("userName",name);
        return sqlSessionTemplate.selectList("user.queryUserByName",params);
    }

    public int addUser(String name, String psd, String phone, Date date) {
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("userName",name);
        params.put("userPassword",psd);
        params.put("phone",phone);
        params.put("createDate",date);
        return sqlSessionTemplate.insert("user.addUser",params);
    }

    public int count(String userName){
        Map <String ,Object> params = new HashMap<String, Object>();
        params.put("userName",userName);
        return sqlSessionTemplate.selectOne("user.count" , params);
    }

    public List<User> queryAllUser(int id, int pageNo, int pageSize){
        int startNo = (pageNo-1)*pageSize;
        Map <String ,Object> params = new HashMap<String, Object>();
        params.put("pageNo" ,startNo);
        params.put("pageSize" ,pageSize);
        params.put("id",id);
        return sqlSessionTemplate.selectList("user.queryAllUser",params);
    }

    public int resetPwd(String pwd, int userId) {
        Map <String ,Object> params = new HashMap<String, Object>();
        params.put("pwd" ,pwd);
        params.put("userId" ,userId);
        return sqlSessionTemplate.update("user.resetPwd",params);
    }

    public User findUserById(int id) {
        Map <String ,Object> params = new HashMap<String, Object>();
        params.put("id" ,id);
        return sqlSessionTemplate.selectOne("user.findUserById",params);
    }

    public int deleteUser(int id) {
        Map <String ,Object> params = new HashMap<String, Object>();
        params.put("id" ,id);
        return sqlSessionTemplate.delete("user.deleteUser",params);
    }

    public int updateUser(int id, String pwd, String phone, Date date) {
        Map <String ,Object> params = new HashMap<String, Object>();
        params.put("id" ,id);
        params.put("pwd" ,pwd);
        params.put("phone" ,phone);
        params.put("updateDate" ,date);
        return sqlSessionTemplate.update("user.updateUser",params);
    }
}
