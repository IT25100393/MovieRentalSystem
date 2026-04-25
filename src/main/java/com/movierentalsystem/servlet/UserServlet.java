package com.movierentalsystem.servlet;

import com.movierentalsystem.model.*;
import com.movierentalsystem.filehandler.UserFileHandler;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/registerUser")
public class UserServlet extends HttpServlet {
    private UserFileHandler fileHandler = new UserFileHandler();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("userId");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String type = request.getParameter("membershipType");

        User newUser;
        // Inheritance & Polymorphism පාවිච්චි කිරීම
        if ("Premium".equals(type)) {
            newUser = new PremiumUser(id, name, email, password);
        } else {
            newUser = new RegularUser(id, name, email, password);
        }

        fileHandler.saveUser(newUser);
        response.sendRedirect("login.jsp?status=success");
    }
}