<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.movierentalsystem.filehandler.MovieFileHandler" %>
<%@ page import="com.movierentalsystem.model.*" %>
<%@ page import="java.util.List" %>
<%
    String id = request.getParameter("id");
    MovieFileHandler fileHandler = new MovieFileHandler();
    List<Movie> movies = fileHandler.loadMovies();
    Movie movieToEdit = null;

    for(Movie m : movies) {
        if(m.getMovieId().equals(id)) {
            movieToEdit = m;
            break;
        }
    }

    if(movieToEdit == null) {
        response.sendRedirect("MovieServlet?action=view&error=notfound");
        return;
    }

    boolean isDVD = movieToEdit instanceof PhysicalDVD;
    PhysicalDVD dvd = isDVD ? (PhysicalDVD) movieToEdit : null;
    DigitalMovie digital = !isDVD ? (DigitalMovie) movieToEdit : null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MovieFlex - Edit Movie</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

    <style>
        body { background-color: #121212; color: #ffffff; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .navbar { background-color: #000000; border-bottom: 2px solid #f5c518; padding: 15px 0; }
        .navbar-brand { color: #f5c518 !important; font-weight: 800; font-size: 1.8rem; letter-spacing: 1px; }
        .card { background-color: #1e1e1e; border: 1px solid #333; border-top: 4px solid #f5c518; border-radius: 12px; }
        .form-label { font-weight: 500; color: #ccc; font-size: 0.95rem; }
        .form-control, .form-select { background-color: #2a2a2a; border: 1px solid #444; color: #fff; padding: 10px 15px; }
        .form-control:focus, .form-select:focus { background-color: #333; border-color: #f5c518; color: #fff; box-shadow: 0 0 0 0.25rem rgba(245, 197, 24, 0.25); }
        .btn-warning { background-color: #f5c518; border: none; font-weight: bold; color: #000; }
        .btn-warning:hover { background-color: #e0b316; color: #000; }
        .btn-outline-light { border-color: #555; color: #ccc; font-weight: 500; }
        .btn-outline-light:hover { background-color: #333; color: #fff; border-color: #777; }
        .section-title { color: #f5c518; font-size: 1.1rem; border-bottom: 1px solid #444; padding-bottom: 8px; margin-bottom: 20px; }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark mb-5 shadow-sm">
        <div class="container">
            <a class="navbar-brand" href="MovieServlet?action=view"><i class="bi bi-film me-2"></i>MOVIEFLEX</a>
            <div class="collapse navbar-collapse justify-content-end">
                <a href="MovieServlet?action=view" class="btn btn-outline-light px-4 py-2">
                    <i class="bi bi-arrow-left-circle me-2"></i> Cancel Edit
                </a>
            </div>
        </div>
    </nav>

    <div class="container mb-5">
        <div class="row justify-content-center">
            <div class="col-lg-8 col-md-10">
                <div class="card p-4 p-md-5 shadow-lg">
                    <h3 class="fw-bold mb-4 text-white"><i class="bi bi-pencil-square me-2 text-warning"></i> Edit Movie: <span class="text-secondary"><%= movieToEdit.getTitle() %></span></h3>

                    <form action="MovieServlet" method="post">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="id" value="<%= movieToEdit.getMovieId() %>">
                        <input type="hidden" name="type" value="<%= isDVD ? "DVD" : "DIGITAL" %>">

                        <div class="section-title mt-2"><i class="bi bi-info-circle me-2"></i>General Information</div>

                        <div class="row g-3 mb-3">
                            <div class="col-md-6">
                                <label class="form-label">Movie Title</label>
                                <input type="text" name="title" class="form-control" value="<%= movieToEdit.getTitle() %>" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Genre</label>
                                <input type="text" name="genre" class="form-control" value="<%= movieToEdit.getGenre() %>" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Director</label>
                                <input type="text" name="director" class="form-control" value="<%= movieToEdit.getDirector() %>" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Release Year</label>
                                <input type="number" name="year" class="form-control" value="<%= movieToEdit.getReleaseYear() %>" required>
                            </div>
                        </div>

                        <div class="mb-4 mt-4">
                            <label class="form-label text-warning fw-bold">Availability Status</label>
                            <select name="isAvailable" class="form-select border-warning">
                                <option value="true" <%= movieToEdit.isAvailable() ? "selected" : "" %>>Available Now</option>
                                <option value="false" <%= !movieToEdit.isAvailable() ? "selected" : "" %>>Currently Unavailable</option>
                            </select>
                        </div>

                        <% if(isDVD) { %>
                            <div class="bg-dark p-3 rounded-3 mb-4 border border-info">
                                <div class="section-title text-info border-info"><i class="bi bi-disc me-2"></i>Physical DVD Details</div>
                                <div class="row g-3">
                                    <div class="col-md-4">
                                        <label class="form-label">DVD Code</label>
                                        <input type="text" name="dvdCode" class="form-control" value="<%= dvd.getDvdCode() != null ? dvd.getDvdCode() : "" %>">
                                    </div>
                                    <div class="col-md-4">
                                        <label class="form-label">Condition</label>
                                        <select name="condition" class="form-select">
                                            <option value="New" <%= "New".equals(dvd.getCondition()) ? "selected" : "" %>>New</option>
                                            <option value="Good" <%= "Good".equals(dvd.getCondition()) ? "selected" : "" %>>Good</option>
                                            <option value="Fair" <%= "Fair".equals(dvd.getCondition()) ? "selected" : "" %>>Fair</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="form-label">Shelf Location</label>
                                        <input type="text" name="shelf" class="form-control" value="<%= dvd.getShelfLocation() != null ? dvd.getShelfLocation() : "" %>">
                                    </div>
                                </div>
                            </div>
                        <% } else { %>
                            <div class="bg-dark p-3 rounded-3 mb-4 border border-success">
                                <div class="section-title text-success border-success"><i class="bi bi-cloud-download me-2"></i>Digital Stream Details</div>
                                <div class="mb-3">
                                    <label class="form-label">Streaming URL</label>
                                    <input type="url" name="url" class="form-control" value="<%= digital.getStreamingUrl() != null ? digital.getStreamingUrl() : "" %>">
                                </div>
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <label class="form-label">File Size (GB)</label>
                                        <input type="number" step="0.1" name="size" class="form-control" value="<%= digital.getFileSize() %>">
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Resolution</label>
                                        <select name="resolution" class="form-select">
                                            <option value="1080p" <%= "1080p".equals(digital.getResolution()) ? "selected" : "" %>>1080p Full HD</option>
                                            <option value="4K" <%= "4K".equals(digital.getResolution()) ? "selected" : "" %>>4K Ultra HD</option>
                                            <option value="720p" <%= "720p".equals(digital.getResolution()) ? "selected" : "" %>>720p HD</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        <% } %>

                        <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                            <a href="MovieServlet?action=view" class="btn btn-outline-light px-4 py-2 me-md-2">Cancel</a>
                            <button type="submit" class="btn btn-warning px-5 py-2"><i class="bi bi-arrow-repeat me-2"></i> Update Movie</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>