package example.entity;

import java.util.Date;

public class books {
    private int isbn;
    private String bookName;
    private String bookAuthor;
    private String bookPicture;
    private Double bookPrice;
    private Date createDate;
    private Date updateDate;
    private int bookTotal;
    private int bookQuantity;

    public books(int isbn, String bookName, String bookAuthor, String bookPicture, Double bookPrice, Date createDate, Date updateDate, int bookTotal, int bookQuantity) {
        this.isbn = isbn;
        this.bookName = bookName;
        this.bookAuthor = bookAuthor;
        this.bookPicture = bookPicture;
        this.bookPrice = bookPrice;
        this.createDate = createDate;
        this.updateDate = updateDate;
        this.bookTotal = bookTotal;
        this.bookQuantity = bookQuantity;
    }

    public int getIsbn() {
        return isbn;
    }

    public void setIsbn(int isbn) {
        this.isbn = isbn;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor;
    }

    public String getBookPicture() {
        return bookPicture;
    }

    public void setBookPicture(String bookPicture) {
        this.bookPicture = bookPicture;
    }

    public Double getBookPrice() {
        return bookPrice;
    }

    public void setBookPrice(Double bookPrice) {
        this.bookPrice = bookPrice;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public int getBookTotal() {
        return bookTotal;
    }

    public void setBookTotal(int bookTotal) {
        this.bookTotal = bookTotal;
    }

    public int getBookQuantity() {
        return bookQuantity;
    }

    public void setBookQuantity(int bookQuantity) {
        this.bookQuantity = bookQuantity;
    }
}
