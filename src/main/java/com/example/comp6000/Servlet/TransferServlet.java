package com.example.comp6000.Servlet;

import com.example.comp6000.Service.MySQLdb;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Transfer", value = "/Transfer")
public class TransferServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String from_userID = request.getParameter("from_username");
        String to_userID = request.getParameter("to_username");
        String amount = request.getParameter("amount");

        if (from_userID == null || from_userID.equals("")) {
            request.setAttribute("msg", "From username is required");
            request.getRequestDispatcher("transfer.jsp").forward(request, response);

        }if (to_userID == null || to_userID.equals("")) {
            request.setAttribute("msg", "To username is required");
            request.getRequestDispatcher("transfer.jsp").forward(request, response);
        }else if (amount == null || amount.equals("")) {
            request.setAttribute("msg", "Amount is required");
            request.getRequestDispatcher("transfer.jsp").forward(request, response);
        }
        else {
            MySQLdb db = new MySQLdb();
            db.doTransfer(from_userID,to_userID, amount);
            request.setAttribute("msg", "Successfully transferred");
            request.getRequestDispatcher("transfer.jsp").forward(request, response);
        }
    }
}
