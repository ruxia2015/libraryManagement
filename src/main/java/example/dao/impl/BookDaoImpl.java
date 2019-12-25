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

    public int count(String queryName,Integer bookTypeId){
        Map <String ,Object> params = new HashMap<String, Object>();
        params.put("queryName",queryName);
        params.put("bookTypeId",bookTypeId);
        return sqlSessionTemplate.selectOne("queryAllBooksCount" , params);
    }

    public List<Books> queryAllBooks(String queryName,Integer bookTypeId, Integer pageNo, Integer pageSize){
        int startNo = (pageNo-1)*pageSize;
        Map <String ,Object> params = new HashMap<String, Object>();
        params.put("queryName",queryName);
        params.put("bookTypeId",bookTypeId);
        params.put("pageNo",startNo);
        params.put("pageSize",pageSize);
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

    public int updateBooksQuantity(int id , Integer quantity){
        Map <String ,Object> params = new HashMap<String, Object>();
        params.put("id",id);
        params.put("quantity", quantity);
        return sqlSessionTemplate.update("updateBooksQuantity",params);
    }

    public int addBook(String bookIsbn, String bookName, String bookAuthor, String bookParticulars,  Integer  bookTypeId, String bookPicture, Double bookPrice, Date date, int bookTotal, int bookQuantity) {
        Map <String ,Object> params = new HashMap<String, Object>();
        params.put("bookIsbn",bookIsbn);
        params.put("bookName",bookName);
        params.put("bookAuthor",bookAuthor);
        params.put("bookParticulars",bookParticulars);
        params.put("bookTypeId",bookTypeId);
        params.put("bookPicture",bookPicture);
        params.put("bookPrice",bookPrice);
        params.put("createDate",date);
        params.put("bookTotal",bookTotal);
        params.put("bookQuantity",bookQuantity);

        return sqlSessionTemplate.insert("addBook",params);
    }

    public int updateBook(int id ,String bookIsbn, String bookName, String bookAuthor, String bookParticulars,  int bookTypeId, String bookPicture, Double bookPrice, Date date, Integer bookTotal, Integer bookQuantity) {
        Map <String ,Object> params = new HashMap<String, Object>();
        params.put("id", id);
        params.put("bookIsbn",bookIsbn);
        params.put("bookName",bookName);
        params.put("bookAuthor",bookAuthor);
        params.put("bookParticulars",bookParticulars);
        params.put("bookTypeId",bookTypeId);
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

    public int addBooksQuantity(int bookId, int quantity) {
        Map <String ,Object> params = new HashMap<String, Object>();
        params.put("id",bookId);
        params.put("quantity", quantity);
        return sqlSessionTemplate.update("addBooksQuantity",params);
    }


}
