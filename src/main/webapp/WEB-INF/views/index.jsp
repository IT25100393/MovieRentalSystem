<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MovieFlex - Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #000; color: #fff; }
        .hero-section { height: 70vh; display: flex; align-items: center; justify-content: center; text-align: center; }
        .btn-warning { background-color: #f5c518; font-weight: bold; }
    </style>
</head>
<body>
    <div class="hero-section">
        <div class="container">
            <h1 class="display-1 fw-bold text-warning">MOVIEFLEX</h1>
            <p class="lead">Experience the Ultimate Movie Journey</p>
            <div class="mt-4">
                <a href="add-movie.jsp" class="btn btn-warning btn-lg px-5 rounded-pill">Add Movie</a>
                <a href="view-movies.jsp" class="btn btn-outline-light btn-lg px-5 rounded-pill ms-3">Explore Collection</a>
            </div>
        </div>
    </div>
</body>
</html>