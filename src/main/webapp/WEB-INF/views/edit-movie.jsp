<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.movierentalsystem.filehandler.MovieFileHandler" %>
<%@ page import="com.movierentalsystem.model.*" %>
<%@ page import="java.util.List" %>
<%
    // URL eken ena Movie ID eka gannawa
    String id = request.getParameter("id");
    MovieFileHandler fileHandler = new MovieFileHandler();
    List<Movie> movies = fileHandler.loadMovies();
    Movie movieToEdit = null;

    // ID ekata galapena movie eka list eken hoyagannawa
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
<html>
<head>
    <title>MovieFlex - Edit Movie</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #000; color: #fff; font-family: 'Segoe UI', sans-serif; }
        .card { background-color: #1a1a1a; border: 1px solid #333; border-radius: 15px; }
        .form-control, .form-select { background-color: #333; border: 1px solid #444; color: #fff; }
        .form-control:focus { background-color: #444; color: #fff; border-color: #f5c518; box-shadow: none; }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card p-4 shadow">
                    <h3 class="text-warning mb-4">Edit Movie: <%= movieToEdit.getTitle() %></h3>

                    <form action="MovieServlet" method="post">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="id" value="<%= movieToEdit.getMovieId() %>">
                        <input type="hidden" name="type" value="<%= isDVD ? "DVD" : "DIGITAL" %>">

                        <div class="mb-3">
                            <label class="form-label">Title</label>
                            <input type="text" name="title" class="form-control" value="<%= movieToEdit.getTitle() %>" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Genre</label>
                            <input type="text" name="genre" class="form-control" value="<%= movieToEdit.getGenre() %>" required>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                <label class="form-label">Director</label>
                                <input type="text" name="director" class="form-control" value="<%= movieToEdit.getDirector() %>" required>
                            </div>
                            <div class="col">
                                <label class="form-label">Year</label>
                                <input type="number" name="year" class="form-control" value="<%= movieToEdit.getReleaseYear() %>" required>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label class="form-label">Availability</label>
                            <select name="isAvailable" class="form-select">
                                <option value="true" <%= movieToEdit.isAvailable() ? "selected" : "" %>>Available</option>
                                <option value="false" <%= !movieToEdit.isAvailable() ? "selected" : "" %>>Not Available</option>
                            </select>
                        </div>

                        <% if(isDVD) { %>
                            <h5 class="text-info">DVD Details</h5>
                            <div class="mb-3">
                                <label class="form-label">DVD Code</label>
                                <input type="text" name="dvdCode" class="form-control" value="<%= dvd.getDvdCode() %>">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Condition</label>
                                <select name="condition" class="form-select">
                                    <option value="New" <%= dvd.getCondition().equals("New") ? "selected" : "" %>>New</option>
                                    <option value="Good" <%= dvd.getCondition().equals("Good") ? "selected" : "" %>>Good</option>
                                    <option value="Fair" <%= dvd.getCondition().equals("Fair") ? "selected" : "" %>>Fair</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Shelf Location</label>
                                <input type="text" name="shelf" class="form-control" value="<%= dvd.getShelfLocation() %>">
                            </div>
                        <% } else { %>
                            <h5 class="text-success">Digital Details</h5>
                            <div class="mb-3">
                                <label class="form-label">Streaming URL</label>
                                <input type="text" name="url" class="form-control" value="<%= digital.getStreamingUrl() %>">
                            </div>
                            <div class="row mb-3">
                                <div class="col">
                                    <label class="form-label">File Size (GB)</label>
                                    <input type="number" step="0.1" name="size" class="form-control" value="<%= digital.getFileSize() %>">
                                </div>
                                <div class="col">
                                    <label class="form-label">Resolution</label>
                                    <select name="resolution" class="form-select">
                                        <option value="1080p" <%= digital.getResolution().equals("1080p") ? "selected" : "" %>>1080p</option>
                                        <option value="4K" <%= digital.getResolution().equals("4K") ? "selected" : "" %>>4K</option>
                                        <option value="720p" <%= digital.getResolution().equals("720p") ? "selected" : "" %>>720p</option>
                                    </select>
                                </div>
                            </div>
                        <% } %>

                        <button type="submit" class="btn btn-warning w-100 py-2 mt-3 fw-bold">Update Movie</button>
                        <a href="MovieServlet?action=view" class="btn btn-outline-light w-100 py-2 mt-2">Cancel</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>