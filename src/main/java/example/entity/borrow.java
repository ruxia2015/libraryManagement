package example.entity;

import java.util.Date;

public class borrow {
    private String userName;
    private String bookName;
    private int quantity;
    private Date stareDate;
    private Date endDate;
    private String returnDate;

    public borrow(String userName, String bookName, int quantity, Date stareDate, Date endDate, String returnDate) {
        this.userName = userName;
        this.bookName = bookName;
        this.quantity = quantity;
        this.stareDate = stareDate;
        this.endDate = endDate;
        this.returnDate = returnDate;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getStareDate() {
        return stareDate;
    }

    public void setStareDate(Date stareDate) {
        this.stareDate = stareDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(String returnDate) {
        this.returnDate = returnDate;
    }
}
