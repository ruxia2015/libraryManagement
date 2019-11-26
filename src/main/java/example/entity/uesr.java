package example.entity;


import java.util.Date;

public class uesr {
    private String userName;
    private String userPassword;
    private int phone;
    private Date createDate;
    private Date updateDate;

    public uesr(String userName, String userPassword, int phone, Date createDate, Date updateDate) {
        this.userName = userName;
        this.userPassword = userPassword;
        this.phone = phone;
        this.createDate = createDate;
        this.updateDate = updateDate;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
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
}
