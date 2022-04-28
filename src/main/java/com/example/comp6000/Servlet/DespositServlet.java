package com.example.comp6000.Servlet;

import com.example.comp6000.Service.MySQLdb;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Deposit", value = "/Deposit")
public class DespositServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userID = request.getParameter("username");
        String amount = request.getParameter("amount");

        if (userID == null || userID.equals("")) {
            request.setAttribute("msg", "Username is required");
            request.getRequestDispatcher("deposit.jsp").forward(request, response);
        } else if (amount == null || amount.equals("")) {
            request.setAttribute("msg", "Amount is required");
            request.getRequestDispatcher("deposit.jsp").forward(request, response);
        }
        else {
            MySQLdb db = new MySQLdb();
            db.doDeposit(userID, amount);
            request.setAttribute("msg", "Successfully deposited");
            request.getRequestDispatcher("deposit.jsp").forward(request, response);
        }

    }
}
