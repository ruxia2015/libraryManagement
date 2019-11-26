package example.dao.impl;

import example.dao.LibrarianDao;
import example.entity.Librarian;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

@Repository
public class LibrarianDaoImpl implements LibrarianDao {
    @Resource
    private SqlSessionTemplate sqlSessionTemplate;
    public List<Librarian> queryLibrarianList() {
       return sqlSessionTemplate.selectList("librarian.queryLibrarian");

    }

}
