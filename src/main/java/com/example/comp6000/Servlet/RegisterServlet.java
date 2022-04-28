package com.example.comp6000.Servlet;

import com.example.comp6000.Models.AccountModel;
import com.example.comp6000.Service.MySQLdb;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Register", value = "/Register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        int isManger = request.getParameter("type")!=null?1:0;

        MySQLdb db = new MySQLdb();
        AccountModel account = db.doRegister(email, password, isManger);

        if (account!=null) {
            HttpSession session = request.getSession();
            session.setAttribute("account", account);
            request.setAttribute("msg", "Successfully registered!");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
            requestDispatcher.forward(request, response);
        }
        else {
            request.setAttribute("msg", "Error: Username already exists");
            RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
        }
    }
}
