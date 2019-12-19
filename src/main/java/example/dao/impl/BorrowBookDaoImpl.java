package example.dao.impl;

import example.dao.BorrowBookDao;
import example.entity.Borrow;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class BorrowBookDaoImpl implements BorrowBookDao {
    @Resource
    private SqlSessionTemplate sqlSessionTemplate;
    public int borrowBook(String userName, String bookName, int bookQuantity, Date startDate, Date returnDate, int userId,int bookId) {
            Map<String,Object> params = new HashMap<String,Object>();
            params.put("userName",userName);
            params.put("bookName",bookName);
            params.put("bookQuantity",bookQuantity);
            params.put("startDate",startDate);
            params.put("returnDate",returnDate);
            params.put("userId",userId);
            params.put("bookId",bookId);
            return sqlSessionTemplate.insert("borrow.addBorrow",params);
        }

    public List<Borrow> borrowMessage(String userName) {
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("userName",userName);
        return sqlSessionTemplate.selectList("borrow.borrowMessage",params);
    }

    public List<Borrow> queryAllBorrow(int id, String bookName) {
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("id", id);
        params.put("bookName", bookName);
        return sqlSessionTemplate.selectList("borrow.queryAllBorrow",params);
    }
}
