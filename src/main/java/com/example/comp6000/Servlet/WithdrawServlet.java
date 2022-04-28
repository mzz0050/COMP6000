package com.example.comp6000.Servlet;

import com.example.comp6000.Service.MySQLdb;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Withdraw", value = "/Withdraw")
public class WithdrawServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userID = request.getParameter("username");
        String amount = "-"+request.getParameter("amount");

        if (userID == null || userID.equals("")) {
            request.setAttribute("msg", "Username is required");
            request.getRequestDispatcher("withdraw.jsp").forward(request, response);
        } else if (amount == null || amount.equals("")) {
            request.setAttribute("msg", "Amount is required");
            request.getRequestDispatcher("withdraw.jsp").forward(request, response);
        }
        else {
            MySQLdb db = new MySQLdb();
            db.doWithdraw(userID, amount);
            request.setAttribute("msg", "Successfully withdraw " + amount + " from user ID:" + userID);
            request.getRequestDispatcher("withdraw.jsp").forward(request, response);
        }

    }
}
