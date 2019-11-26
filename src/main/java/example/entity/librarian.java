package example.entity;

import java.util.Date;

public class librarian {
    private String name;
    private String password;
    private int phone;
    private Date createDate;
    private Date updateDate;

    public librarian(String name, String password, int phone, Date createDate, Date updateDate) {
        this.name = name;
        this.password = password;
        this.phone = phone;
        this.createDate = createDate;
        this.updateDate = updateDate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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
