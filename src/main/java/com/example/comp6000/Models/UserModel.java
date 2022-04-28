package com.example.comp6000.Models;


public class UserModel {
    int user_id;
    String name;
    float balance;

    public UserModel(int user_id, String name, float balance) {
        this.user_id = user_id;
        this.name = name;
        this.balance = balance;
    }

    public float getBalance() {
        return balance;
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
}
