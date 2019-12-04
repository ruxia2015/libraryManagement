package example.dao.impl;

import example.dao.LoginDao;
import example.entity.User;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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

    public int addUser(String name, String psd, String phone, Date date) {
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("userName",name);
        params.put("userPassword",psd);
        params.put("phone",phone);
        params.put("createDate",date);
        return sqlSessionTemplate.insert("user.addUser",params);
    }

    public List<User> selectAllUser() {
        return sqlSessionTemplate.selectList("selectAllUser");
    }

    public List<User> selectAllUserList(int pageNo,int pageNum){
        int startNo = (pageNo-1)*pageNum;
        Map <String ,Object> params = new HashMap<String, Object>();
        params.put("pageNo" ,startNo);
        params.put("pageNum" ,pageNum);
        return sqlSessionTemplate.selectList("user.selectAllUserList",params);
    }

    //    public List<User> selectAllUser() {
//    }

    public List<User> queryUser(String userName){
        Map <String ,Object> params = new HashMap<String, Object>();
        params.put("userName" ,userName);
        return sqlSessionTemplate.selectList("user.queryUser",params);
    }

    public int count(){
        return sqlSessionTemplate.selectOne("user.count");
    }

    public List<User> queryAllUser(int pageNo, int pageNum, String userName){
        int startNo = (pageNo-1)*pageNum;
        Map <String ,Object> params = new HashMap<String, Object>();
        params.put("pageNo" ,startNo);
        params.put("pageNum" ,pageNum);
        params.put("userName",userName);
        return sqlSessionTemplate.selectList("user.queryAllUser",params);
    }
}
