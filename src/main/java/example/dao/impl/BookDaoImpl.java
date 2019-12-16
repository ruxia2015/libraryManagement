package example.dao.impl;

import example.dao.BookDao;
import example.entity.Books;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class BookDaoImpl implements BookDao {
    @Resource
    private SqlSessionTemplate sqlSessionTemplate;

    public int count(String bookName,Integer bookTypeId){
        Map <String ,Object> params = new HashMap<String, Object>();
        params.put("bookName",bookName);
        params.put("bookTypeId",bookTypeId);
        return sqlSessionTemplate.selectOne("queryAllBooksCount" , params);
    }

    public List<Books> queryAllBooks(String bookName,Integer bookTypeId){
        Map <String ,Object> params = new HashMap<String, Object>();
        params.put("bookName",bookName);
        params.put("bookTypeId",bookTypeId);
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
        return sqlSessionTemplate.update("updateBooksQuantity",params);
    }

    public int addBook(int bookIsbn, String bookName, String bookAuthor, String bookParticulars,  String bookType, String bookPicture, Double bookPrice, Date date, int bookTotal, int bookQuantity) {
        Map <String ,Object> params = new HashMap<String, Object>();
        params.put("bookIsbn",bookIsbn);
        params.put("bookName",bookName);
        params.put("bookAuthor",bookAuthor);
        params.put("bookParticulars",bookParticulars);
        params.put("bookType",bookType);
        params.put("bookPicture",bookPicture);
        params.put("bookPrice",bookPrice);
        params.put("createDate",date);
        params.put("bookTotal",bookTotal);
        params.put("bookQuantity",bookQuantity);

        return sqlSessionTemplate.insert("addBook",params);
    }

    public int updateBook(int id ,Integer bookIsbn, String bookName, String bookAuthor, String bookParticulars, String bookType, String bookPicture, Double bookPrice, Date date, Integer bookTotal, Integer bookQuantity) {
        Map <String ,Object> params = new HashMap<String, Object>();
        params.put("id", id);
        params.put("bookIsbn",bookIsbn);
        params.put("bookName",bookName);
        params.put("bookAuthor",bookAuthor);
        params.put("bookParticulars",bookParticulars);
        params.put("bookType",bookType);
        params.put("bookPicture",bookPicture);
        params.put("bookPrice",bookPrice);
        params.put("updateDate",date);
        params.put("bookTotal",bookTotal);
        params.put("bookQuantity",bookQuantity);

        return sqlSessionTemplate.update("updateBook",params);
    }

    public int deleteBook(int id) {
        Map <String ,Object> params = new HashMap<String, Object>();
        params.put("id", id);
        return sqlSessionTemplate.delete("deleteBook",params);
    }
}
