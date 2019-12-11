package example.dao.impl;

import example.dao.BookTypeDao;
import example.entity.BookType;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

@Repository
public class BookTypeDaoImpl implements BookTypeDao {
    @Resource
    private SqlSessionTemplate sqlSessionTemplate;

    public List<BookType> queryAllBookType() {
        return sqlSessionTemplate.selectList("queryAllBookType");
    }
}
