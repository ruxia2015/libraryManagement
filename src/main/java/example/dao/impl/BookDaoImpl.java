package example.dao.impl;

import example.dao.BookDao;
import example.entity.BookType;
import example.entity.Books;
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

    public int count(String bookName){
        Map <String ,Object> params = new HashMap<String, Object>();
        params.put("bookName",bookName);
        return sqlSessionTemplate.selectOne("queryAllBooksCount" , params);
    }

    public List<Books> queryAllBooks(String bookName){
        Map <String ,Object> params = new HashMap<String, Object>();
        params.put("bookName",bookName);
        return sqlSessionTemplate.selectList("queryAllBooks",params);
    }

    public Books queryBook(int id) {
        Map <String ,Object> params = new HashMap<String, Object>();
        params.put("id",id);
        return sqlSessionTemplate.selectOne("queryBook",params);
    }

    public Books findBooksByName(String bookName) {
        Map <String ,Object> params = new HashMap<String, Object>();
        params.put("bookName",bookName);
        return sqlSessionTemplate.selectOne("findBooksByName",params);
    }

    public int updateBooksQuantity(int id){
        Map <String ,Object> params = new HashMap<String, Object>();
        params.put("id",id);
        return sqlSessionTemplate.selectOne("updateBooksQuantity",params);
    }
}
