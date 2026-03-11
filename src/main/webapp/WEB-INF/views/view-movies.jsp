<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.movierentalsystem.filehandler.MovieFileHandler" %>
<%@ page import="com.movierentalsystem.model.*" %>
<%@ page import="java.util.List" %>
<%
    MovieFileHandler fileHandler = new MovieFileHandler();
    List<Movie> movies = fileHandler.loadMovies();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MovieFlex - Catalog</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

    <style>
        /* Dark Theme Customizations */
        body { background-color: #121212; color: #ffffff; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .navbar { background-color: #000000; border-bottom: 2px solid #f5c518; padding: 15px 0; }
        .navbar-brand { color: #f5c518 !important; font-weight: 800; font-size: 1.8rem; letter-spacing: 1px; }
        .movie-card { background-color: #1e1e1e; border: 1px solid #333; border-radius: 12px; transition: transform 0.3s, box-shadow 0.3s; height: 100%; }
        .movie-card:hover { transform: translateY(-7px); box-shadow: 0 10px 25px rgba(245, 197, 24, 0.15); border-color: #555; }
        .card-title { color: #f5c518; font-weight: bold; font-size: 1.3rem; }
        .badge-dvd { background-color: #0dcaf0; color: #000; letter-spacing: 1px; }
        .badge-digital { background-color: #198754; color: #fff; letter-spacing: 1px;}
        .btn-warning { background-color: #f5c518; border: none; font-weight: bold; color: #000; }
        .btn-warning:hover { background-color: #e0b316; color: #000; }
        .info-text { color: #aaaaaa; font-size: 0.9rem; }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark mb-5 shadow-sm">
        <div class="container">
            <a class="navbar-brand" href="MovieServlet?action=view"><i class="bi bi-film me-2"></i>MOVIEFLEX</a>
            <div class="collapse navbar-collapse justify-content-end">
                <a href="MovieServlet?action=add" class="btn btn-warning px-4 py-2">
                    <i class="bi bi-plus-circle-fill me-2"></i> Add New Movie
                </a>
            </div>
        </div>
    </nav>

    <div class="container mb-5">
        <div class="d-flex justify-content-between align-items-center mb-4 border-bottom border-secondary pb-3">
            <h2 class="fw-bold m-0">Movie Collection</h2>
            <span class="badge bg-secondary fs-6"><%= movies != null ? movies.size() : 0 %> Movies</span>
        </div>

        <% String status = request.getParameter("status");
           if ("deleted".equals(status)) { %>
            <div class="alert alert-danger alert-dismissible fade show shadow-sm" role="alert">
                <i class="bi bi-trash-fill me-2"></i> Movie deleted successfully!
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <% } else if ("updated".equals(status)) { %>
            <div class="alert alert-success alert-dismissible fade show shadow-sm" role="alert">
                <i class="bi bi-check-circle-fill me-2"></i> Movie updated successfully!
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <% } %>

        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
            <% if (movies != null && !movies.isEmpty()) {
                for (Movie m : movies) {
                    boolean isDVD = m instanceof PhysicalDVD;
            %>
            <div class="col">
                <div class="card movie-card p-3 shadow-sm">
                    <div class="card-body d-flex flex-column p-2">
                        <div class="d-flex justify-content-between align-items-start mb-3">
                            <h5 class="card-title mb-0 pe-2"><%= m.getTitle() %></h5>
                            <span class="badge <%= isDVD ? "badge-dvd" : "badge-digital" %> rounded-pill">
                                <%= isDVD ? "DVD" : "Digital" %>
                            </span>
                        </div>

                        <h6 class="text-white mb-3"><i class="bi bi-calendar3 me-2 text-warning"></i><%= m.getReleaseYear() %> &nbsp;|&nbsp; <%= m.getGenre() %></h6>

                        <p class="info-text mb-2"><i class="bi bi-person-video me-2 text-warning"></i> Director: <span class="text-white"><%= m.getDirector() %></span></p>

                        <p class="info-text mb-4">
                            <i class="bi <%= m.isAvailable() ? "bi-check-circle-fill text-success" : "bi-x-circle-fill text-danger" %> me-2"></i>
                            <span class="<%= m.isAvailable() ? "text-success" : "text-danger" %> fw-bold">
                                <%= m.isAvailable() ? "Available Now" : "Currently Unavailable" %>
                            </span>
                        </p>

                        <div class="mt-auto d-flex gap-2">
                            <a href="MovieServlet?action=edit&id=<%= m.getMovieId() %>" class="btn btn-outline-warning btn-sm w-50 py-2">
                                <i class="bi bi-pencil-square me-1"></i> Edit
                            </a>
                            <a href="MovieServlet?action=delete&id=<%= m.getMovieId() %>" class="btn btn-outline-danger btn-sm w-50 py-2" onclick="return confirm('Are you sure you want to delete <%= m.getTitle() %>?');">
                                <i class="bi bi-trash me-1"></i> Delete
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <%  }
               } else { %>
               <div class="col-12 text-center mt-5 py-5 bg-dark rounded-4 border border-secondary">
                   <i class="bi bi-film display-1 text-secondary mb-3"></i>
                   <h3 class="text-muted">Your catalog is empty</h3>
                   <p class="text-secondary mb-4">Start building your MovieFlex collection today.</p>
                   <a href="MovieServlet?action=add" class="btn btn-warning btn-lg px-5 shadow"><i class="bi bi-plus-lg me-2"></i>Add First Movie</a>
               </div>
            <% } %>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>