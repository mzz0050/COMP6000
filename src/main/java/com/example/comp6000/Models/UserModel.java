package com.example.comp6000.Models;

import java.util.Date;

public class UserModel {
    int user_id;
    String name;
    int type;
    float actions;
    Date opdate; // needs to be formatted as yyyy-mm-dd
    float balance;

    public UserModel(int user_id, String name, int type, float actions, Date opdate, float balance) {
        this.user_id = user_id;
        this.name = name;
        this.type = type;
        this.actions = actions;
        this.opdate = opdate;
        this.balance = balance;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public float getActions() {
        return actions;
    }

    public void setActions(float actions) {
        this.actions = actions;
    }

    public Date getOpdate() {
        return opdate;
    }

    public void setOpdate(Date opdate) {
        this.opdate = opdate;
    }

}
