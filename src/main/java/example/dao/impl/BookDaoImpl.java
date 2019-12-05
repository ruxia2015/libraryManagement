package example.dao.impl;

import example.dao.BookDao;
import example.entity.BookType;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class BookDaoImpl implements BookDao {
    @Resource
    private SqlSessionTemplate sqlSessionTemplate;
    public List<BookType> queryBookType() {
        return sqlSessionTemplate.selectList("queryBookType");
    }
}
