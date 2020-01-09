package example.dao.impl;

import example.dao.LibrarianDao;
import example.entity.Librarian;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class LibrarianDaoImpl implements LibrarianDao {
    @Resource
    private SqlSessionTemplate sqlSessionTemplate;
    public List<Librarian> queryLibrarianList() {
       return sqlSessionTemplate.selectList("librarian.queryLibrarian");

    }

    public Librarian findLibrarianByName(String name) {
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("userName",name);
        return sqlSessionTemplate.selectOne("librarian.findLibrarianByName",params);
    }

    public int changePwd(String pwd, int id) {
        Map <String ,Object> params = new HashMap<String, Object>();
        params.put("pwd" ,pwd);
        params.put("id" ,id);
        return sqlSessionTemplate.update("librarian.changePwd",params);
    }

}
