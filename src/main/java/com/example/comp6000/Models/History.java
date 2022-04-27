package com.example.comp6000.Models;

import java.util.Date;

public class History {
    int user_id;
    int operation_id;
    float inexp;
    Date operation_date; // needs to be formatted as yyyy-mm-dd
    String describe;


    public History(int user_id, int operation_id, float inexp, Date operation_date, String describe) {
        this.user_id = user_id;
        this.operation_id = operation_id;
        this.inexp = inexp;
        this.operation_date = operation_date;
        this.describe = describe;
    }


    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getOperation_id() {
        return operation_id;
    }

    public void setOperation_id(int operation_id) {
        this.operation_id = operation_id;
    }

    public float getInexp() {
        return inexp;
    }

    public void setInexp(float inexp) {
        this.inexp = inexp;
    }

    public Date getOperation_date() {
        return operation_date;
    }

    public void setOperation_date(Date operation_date) {
        this.operation_date = operation_date;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

}
