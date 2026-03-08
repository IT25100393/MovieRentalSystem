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

import com.movierentalsystem.model.Movie;

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
            String id = "M" + System.currentTimeMillis(); // Auto ID generation

            if ("DVD".equals(type)) {
                String dvdCode = request.getParameter("dvdCode");
                String condition = request.getParameter("condition");
                String shelf = request.getParameter("shelf");
                PhysicalDVD dvd = new PhysicalDVD(id, title, genre, director, year, true, dvdCode, condition, shelf);
                fileHandler.saveMovie(dvd);
            } else {
                String url = request.getParameter("url");
                double size = Double.parseDouble(request.getParameter("size"));
                String resolution = request.getParameter("resolution");
                DigitalMovie digital = new DigitalMovie(id, title, genre, director, year, true, url, size, resolution);
                fileHandler.saveMovie(digital);
            }
            response.sendRedirect("add-movie.jsp?status=success");
        }
    }
}