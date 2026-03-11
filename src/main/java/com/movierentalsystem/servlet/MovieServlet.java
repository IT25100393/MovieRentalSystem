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

    // POST request eken Add saha Update deka karanawa
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            String title = request.getParameter("title");
            String genre = request.getParameter("genre");
            String director = request.getParameter("director");
            int year = Integer.parseInt(request.getParameter("year"));
            String type = request.getParameter("type");
            String id = "M" + System.currentTimeMillis(); // Auto ID generation

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
            response.sendRedirect("add-movie.jsp?status=success");

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
            response.sendRedirect("view-movies.jsp?status=updated");
        }
    }

    // GET request eken Delete operation eka karanawa
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            String id = request.getParameter("id");
            if (id != null) {
                fileHandler.deleteMovie(id);
            }
            response.sendRedirect("view-movies.jsp?status=deleted");
        }
    }
}