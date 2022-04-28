package com.example.comp6000.Servlet;

import com.example.comp6000.Models.AccountModel;
import com.example.comp6000.Service.MySQLdb;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Login", value = "/Login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        //fetches the user from the database
        MySQLdb db = new MySQLdb();
        AccountModel account = db.doLogin(email,password);

        if (account!=null) {
            HttpSession session = request.getSession();
              session.setAttribute("account", account);

            RequestDispatcher requestDispatcher;
              if (account.is_manager()) {
                  requestDispatcher = request.getRequestDispatcher("manager.jsp");

              }else{
                    requestDispatcher = request.getRequestDispatcher("index.jsp");
              }
            requestDispatcher.forward(request, response);
        }
        else {
            request.setAttribute("error", "Invalid username or password");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
            requestDispatcher.forward(request, response);
        }
    }
}
