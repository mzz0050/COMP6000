package com.example.comp6000.Models;

public class AccountModel {

    int account_id;
    String password;
    String email;
    boolean is_manager;

    public AccountModel() {
    }


    public boolean is_manager() {
        return is_manager;
    }
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public AccountModel(int account_id, String password, String email, boolean is_manager) {
        this.account_id = account_id;
        this.password = password;
        this.email = email;
        this.is_manager = is_manager;
    }

}