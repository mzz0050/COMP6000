package com.example.comp6000.Models;

import java.sql.Timestamp;
import java.util.Date;

public class History {
    String username;
    int user_id;
    int operation_id;
    float in_exp;
    Timestamp operation_date; // needs to be formatted as yyyy-mm-dd
    String type;

    public History(String username,int user_id, int operation_id, float in_exp, Timestamp operation_date, String type) {
        this.username = username;
        this.user_id = user_id;
        this.operation_id = operation_id;
        this.in_exp = in_exp;
        this.operation_date = operation_date;
        this.type = type;
    }

    public String getUsername() {
        return username;
    }

    public int getUser_id() {
        return user_id;
    }

    public int getOperation_id() {
        return operation_id;
    }

    public float getIn_exp() {
        return in_exp;
    }

    public Timestamp getOperation_date() {
        return operation_date;
    }

    public String getType() {
        return type;
    }
}
