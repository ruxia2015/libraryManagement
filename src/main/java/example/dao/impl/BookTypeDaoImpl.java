package example.dao.impl;

import example.dao.BookTypeDao;
import example.entity.BookType;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class BookTypeDaoImpl implements BookTypeDao {
    @Resource
    private SqlSessionTemplate sqlSessionTemplate;

    public List<BookType> queryAllBookType() {
        return sqlSessionTemplate.selectList("queryAllBookType");
    }

    public BookType queryBookTypeByName(String bookTypeName) {
        Map<String ,Object> params = new HashMap<String, Object>();
        params.put("bookTypeName",bookTypeName);
        return sqlSessionTemplate.selectOne("queryBookTypeByName",params);
    }

}
