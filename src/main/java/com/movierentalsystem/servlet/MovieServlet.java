package com.movierentalsystem.servlet;

import com.movierentalsystem.filehandler.MovieFileHandler;
import com.movierentalsystem.model.DigitalMovie;
import com.movierentalsystem.model.PhysicalDVD;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/MovieServlet")
public class MovieServlet extends HttpServlet {
    private MovieFileHandler fileHandler = new MovieFileHandler();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            String title = request.getParameter("title");
            String genre = request.getParameter("genre");
            String director = request.getParameter("director");
            int year = Integer.parseInt(request.getParameter("year"));
            String type = request.getParameter("type");
            String id = "M" + System.currentTimeMillis();

            if ("DVD".equals(type)) {
                String dvdCode = request.getParameter("dvdCode");
                String condition = request.getParameter("condition");
                String shelf = request.getParameter("shelf");
                PhysicalDVD dvd = new PhysicalDVD(id, title, genre, director, year, true, dvdCode, condition, shelf);
                fileHandler.saveMovie(dvd);
            } else {
                String url = request.getParameter("url");
                String sizeStr = request.getParameter("size");
                double size = (sizeStr != null && !sizeStr.isEmpty()) ? Double.parseDouble(sizeStr) : 0.0;
                String resolution = request.getParameter("resolution");
                DigitalMovie digital = new DigitalMovie(id, title, genre, director, year, true, url, size, resolution);
                fileHandler.saveMovie(digital);
            }
            // Update: Redirect to the Servlet's add action instead of direct JSP
            response.sendRedirect("MovieServlet?action=add&status=success");

        } else if ("update".equals(action)) {
            String id = request.getParameter("id");
            String title = request.getParameter("title");
            String genre = request.getParameter("genre");
            String director = request.getParameter("director");
            int year = Integer.parseInt(request.getParameter("year"));
            String type = request.getParameter("type");
            boolean isAvailable = Boolean.parseBoolean(request.getParameter("isAvailable"));

            if ("DVD".equals(type)) {
                String dvdCode = request.getParameter("dvdCode");
                String condition = request.getParameter("condition");
                String shelf = request.getParameter("shelf");
                PhysicalDVD dvd = new PhysicalDVD(id, title, genre, director, year, isAvailable, dvdCode, condition, shelf);
                fileHandler.updateMovie(dvd);
            } else {
                String url = request.getParameter("url");
                String sizeStr = request.getParameter("size");
                double size = (sizeStr != null && !sizeStr.isEmpty()) ? Double.parseDouble(sizeStr) : 0.0;
                String resolution = request.getParameter("resolution");
                DigitalMovie digital = new DigitalMovie(id, title, genre, director, year, isAvailable, url, size, resolution);
                fileHandler.updateMovie(digital);
            }
            // Update: Redirect to the Servlet's view action instead of direct JSP
            response.sendRedirect("MovieServlet?action=view&status=updated");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        // Routing logic: Forward to WEB-INF based on action
        if ("delete".equals(action)) {
            String id = request.getParameter("id");
            if (id != null) {
                fileHandler.deleteMovie(id);
            }
            response.sendRedirect("MovieServlet?action=view&status=deleted");
        }
        else if ("add".equals(action)) {
            request.getRequestDispatcher("/WEB-INF/views/add-movie.jsp").forward(request, response);
        }
        else if ("edit".equals(action)) {
            request.getRequestDispatcher("/WEB-INF/views/edit-movie.jsp").forward(request, response);
        }
        else {
            // Default action: View Movies
            request.getRequestDispatcher("/WEB-INF/views/view-movies.jsp").forward(request, response);
        }
    }
}