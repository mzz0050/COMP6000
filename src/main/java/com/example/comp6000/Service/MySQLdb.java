package com.example.comp6000.Service;

import com.example.comp6000.Models.AccountModel;
import com.example.comp6000.Models.History;
import com.example.comp6000.Models.UserModel;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLdb {

    String url = "jdbc:mysql://localhost:3306/library_webatm";
    String user = "root";
    String password = "root";
    Connection conn = null;
    static MySQLdb instance = null;

    public static synchronized MySQLdb getInstance() {
        if (instance == null) {
            instance = new MySQLdb();
        }
        return instance;
    }

    public MySQLdb() {
        try {
            Class.forName( "com.mysql.cj.jdbc.Driver" );
            conn = DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public AccountModel doLogin(String email, String password) {
        AccountModel account = null;
        try {
            String sql = "SELECT * FROM account WHERE email = '" + email + "' AND password = '" + password + "'";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {
                account = new AccountModel(rs.getInt("accountid"), rs.getString("password"),
                        rs.getString("email"), rs.getBoolean("type"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return account;
    }

    public boolean accountExists(String email) {
        boolean response = false;
        try {
            String sql = "SELECT count(*) from account WHERE email = '" + email + "'";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {
                if(rs.getInt(1) > 0) {
                    response = true;
                }        }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return response;
    }

    public AccountModel doRegister(String email, String password, int isManager) {
        AccountModel account = null;
        System.out.println(email + " " + password + " " + isManager);
        if (!accountExists(email)) {
            try {
                String sql = "INSERT INTO account (email, password, type) VALUES ('" + email + "', '" + password + "', '" + isManager + "')";
                Statement stmt = conn.createStatement();
                int rs = stmt.executeUpdate(sql);
                if (rs > 0) {
                    account = doLogin(email, password);
                }
            } catch(SQLException e){
                e.printStackTrace();
            }
            return account;
        }
        return null;
    }

    public List<UserModel> fetchUserList() {
    List<UserModel> userList = new ArrayList<>();
    try {
        String sql = "SELECT * FROM user";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
            userList.add(new UserModel(rs.getInt("user_id"),
                    rs.getString("name"),rs.getFloat("balance")));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return userList;
}


    public void doDeposit(String userID, String amount) {
        logHistory(userID, amount, "Deposit");
        try {
            String sql = "UPDATE user SET balance = balance + " + amount + " WHERE user_id = '" + userID + "'";
            Statement stmt = conn.createStatement();
            stmt.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void logHistory(String userID, String amount,String type) {
        try {
            String sql = "INSERT INTO history (user_id, in_exp, exe_type ) VALUES ('" + userID + "', '" + amount + "', '" + type + "')";
            Statement stmt = conn.createStatement();
            stmt.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void doWithdraw(String userID, String amount) {
        logHistory(userID, amount, "Withdraw");
        try {
            String sql = "UPDATE user SET balance = balance + " + amount + " WHERE user_id = '" + userID + "'";
            Statement stmt = conn.createStatement();
            stmt.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<History> fetchHistory(){
        List<History> historyList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM history left join user on user.user_id = history.user_id";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                historyList.add(new History(rs.getString("name"),rs.getInt("user_id"), rs.getInt("operation_id"),
                        rs.getFloat("in_exp"), rs.getTimestamp("date") ,rs.getString("exe_type")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return historyList;
    }

    public void doSend(String userID, String amount) {

        logHistory(userID,"-".concat(amount), "Transfer");
        try {
            String sql = "UPDATE user SET balance = balance - " + amount + " WHERE user_id = '" + userID + "'";
            Statement stmt = conn.createStatement();
            stmt.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void doReceive(String userID, String amount) {
        logHistory(userID, amount, "Transfer");
        try {
            String sql = "UPDATE user SET balance = balance + " + amount + " WHERE user_id = '" + userID + "'";
            Statement stmt = conn.createStatement();
            stmt.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void doTransfer(String from_userID, String to_userID, String amount) {
        doSend(from_userID, amount);
        doReceive(to_userID, amount);
    }

    public int countToday() {
        int count = 0;
        try {
            String sql = "SELECT count(operation_id) as count FROM history WHERE date > CURRENT_DATE()-1 && date<CURRENT_DATE();";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                count = rs.getInt("count");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
}
