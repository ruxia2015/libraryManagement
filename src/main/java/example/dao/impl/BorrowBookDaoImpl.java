package example.dao.impl;

import example.dao.BorrowBookDao;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Repository
public class BorrowBookDaoImpl implements BorrowBookDao {
    @Resource
    private SqlSessionTemplate sqlSessionTemplate;
    public int borrowBook(String userName, String bookName, int bookQuantity, Date startDate, Date returnDate) {
            Map<String,Object> params = new HashMap<String,Object>();
            params.put("userName",userName);
            params.put("bookName",bookName);
            params.put("bookQuantity",bookQuantity);
            params.put("startDate",startDate);
            params.put("returnDate",returnDate);
            return sqlSessionTemplate.insert("borrow.addBorrow",params);
        }

}
