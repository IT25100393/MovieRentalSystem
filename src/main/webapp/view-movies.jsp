<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.movierentalsystem.filehandler.MovieFileHandler" %>
<%@ page import="com.movierentalsystem.model.Movie" %>
<%@ page import="com.movierentalsystem.model.PhysicalDVD" %>
<%@ page import="com.movierentalsystem.model.DigitalMovie" %>
<html>
<head>
    <title>MovieFlex - Movie Catalog</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #000; color: #fff; font-family: 'Segoe UI', sans-serif; }
        .navbar { background-color: #000; border-bottom: 1px solid #333; }
        .card { background-color: #1a1a1a; border: 1px solid #333; border-radius: 15px; }
        .btn-warning { background-color: #f5c518; color: #000; font-weight: bold; }
        .badge-dvd { background-color: #0dcaf0; color: #000; }
        .badge-digital { background-color: #198754; color: #fff; }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg py-3">
        <div class="container">
            <a class="navbar-brand text-warning fw-bold" href="index.jsp">🎬 MOVIEFLEX</a>
            <div class="d-flex align-items-center">
                <a href="add-movie.jsp" class="btn btn-outline-warning btn-sm">Add New Movie</a>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <h2 class="text-warning mb-4">Movie Catalog</h2>
        <div class="row">
            <%
                // File handler eken okkoma movies tika list ekakata gannawa
                MovieFileHandler fileHandler = new MovieFileHandler();
                List<Movie> movies = fileHandler.loadMovies();

                if(movies.isEmpty()) {
            %>
                <div class="col-12">
                    <div class="alert alert-dark text-center" role="alert">
                        No movies found in the catalog. Please add some movies first!
                    </div>
                </div>
            <%
                } else {
                    // Loop eka - list eke thiyena eka eka movie eka gannawa
                    for(Movie m : movies) {
                        boolean isDVD = m instanceof PhysicalDVD; // Polymorphism & Inheritance check eka [cite: 24]
            %>
                <div class="col-md-4 mb-4">
                    <div class="card p-3 shadow h-100">
                        <h4 class="text-warning"><%= m.getTitle() %></h4>
                        <p class="mb-1 text-muted"><%= m.getReleaseYear() %> | <%= m.getGenre() %> | <%= m.getDirector() %></p>

                        <div class="mb-3 mt-2">
                            <% if(isDVD) { %>
                                <span class="badge badge-dvd">Physical DVD</span>
                            <% } else { %>
                                <span class="badge badge-digital">Digital Stream</span>
                            <% } %>

                            <% if(m.isAvailable()) { %>
                                <span class="badge bg-success">Available</span>
                            <% } else { %>
                                <span class="badge bg-danger">Not Available</span>
                            <% } %>
                        </div>

                        <hr style="border-color: #444;">

                        <% if(isDVD) {
                            PhysicalDVD dvd = (PhysicalDVD) m;
                        %>
                            <p class="mb-1" style="font-size: 0.9em;"><strong>DVD Code:</strong> <%= dvd.getDvdCode() %></p>
                            <p class="mb-1" style="font-size: 0.9em;"><strong>Shelf:</strong> <%= dvd.getShelfLocation() %></p>
                            <p class="mb-1" style="font-size: 0.9em;"><strong>Condition:</strong> <%= dvd.getCondition() %></p>
                        <% } else {
                            DigitalMovie digital = (DigitalMovie) m;
                        %>
                            <p class="mb-1" style="font-size: 0.9em;"><strong>Resolution:</strong> <%= digital.getResolution() %></p>
                            <p class="mb-1" style="font-size: 0.9em;"><strong>Size:</strong> <%= digital.getFileSize() %> GB</p>
                            <a href="<%= digital.getStreamingUrl() %>" target="_blank" class="btn btn-sm btn-outline-info mt-2 w-100">Watch Link</a>
                        <% } %>

                        <div class="mt-auto pt-3 d-flex gap-2">
                            <a href="edit-movie.jsp?id=<%= m.getMovieId() %>" class="btn btn-warning btn-sm w-50">Edit</a>

                            <a href="MovieServlet?action=delete&id=<%= m.getMovieId() %>" class="btn btn-danger btn-sm w-50" onclick="return confirm('Are you sure you want to delete this movie?');">Delete</a>
                        </div>
                    </div>
                </div>
            <%
                    }
                }
            %>
        </div>
    </div>
</body>
</html>