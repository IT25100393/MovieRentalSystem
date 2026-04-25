package com.movierentalsystem.servlet;

import com.movierentalsystem.model.*;
import com.movierentalsystem.filehandler.UserFileHandler;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet({"/register", "/login"})
public class UserServlet extends HttpServlet {
    private UserFileHandler fileHandler = new UserFileHandler();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // URL එක අනුව කුමන ක්‍රියාවක්ද කළ යුත්තේ කියා තීරණය කිරීම
        String path = request.getServletPath();

        if (path.equals("/register")) {
            // --- REGISTRATION PROCESS ---
            String id = request.getParameter("userId");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String type = request.getParameter("type");

            User newUser;
            // Polymorphism පාවිච්චි කරලා අදාළ object එක හදනවා
            if ("Premium".equals(type)) {
                newUser = new PremiumUser(id, name, email, password);
            } else {
                newUser = new RegularUser(id, name, email, password);
            }

            // File එකට save කිරීම
            fileHandler.saveUser(newUser);

            // සාර්ථකව register වූ බව පවසා login පිටුවට යවනවා
            response.sendRedirect("login.jsp?msg=success");

        } else if (path.equals("/login")) {
            // --- LOGIN PROCESS ---
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            // File එකෙන් සියලුම users ලා ලබා ගැනීම
            List<String> allUsers = fileHandler.getAllUsers();
            boolean isAuthenticated = false;
            String loggedInUserName = "";

            for (String line : allUsers) {
                // දත්ත බෙදා වෙන් කිරීම (userId, name, email, password, type)
                String[] details = line.split(",");

                // Email සහ Password සැසඳීම
                if (details.length >= 4 && details[2].equals(email) && details[3].equals(password)) {
                    isAuthenticated = true;
                    loggedInUserName = details[1]; // User ගේ නම
                    break;
                }
            }

            if (isAuthenticated) {
                // Session එකක් සාදා login තොරතුරු තැන්පත් කිරීම
                HttpSession session = request.getSession();
                session.setAttribute("userName", loggedInUserName);

                // Dashboard එකට යැවීම
                response.sendRedirect("dashboard.jsp");
            } else {
                // වැරදි නම් error එකක් සමඟ ආපහු ලොගින් පිටුවට
                response.sendRedirect("login.jsp?error=invalid");
            }
        }
    }
}