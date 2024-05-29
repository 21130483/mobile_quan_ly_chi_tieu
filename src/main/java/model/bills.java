package model;

import java.sql.Date;

public class bills {
    private int id;
    private int userId;
    private int typeBillId;
    private int money;
    private Date date;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getTypeBillId() {
        return typeBillId;
    }

    public void setTypeBillId(int typeBillId) {
        this.typeBillId = typeBillId;
    }

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
