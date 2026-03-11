<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MovieFlex - Add New Movie</title>
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

    <script>
        function toggleMovieFields() {
            var type = document.getElementById("movieType").value;
            var dvdFields = document.getElementById("dvdFields");
            var digitalFields = document.getElementById("digitalFields");

            if (type === "DVD") {
                dvdFields.style.display = "block";
                digitalFields.style.display = "none";
            } else {
                dvdFields.style.display = "none";
                digitalFields.style.display = "block";
            }
        }

        // Form load weddi hariyatama fields tika pennanna
        window.onload = function() {
            toggleMovieFields();
        };
    </script>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark mb-5 shadow-sm">
        <div class="container">
            <a class="navbar-brand" href="MovieServlet?action=view"><i class="bi bi-film me-2"></i>MOVIEFLEX</a>
            <div class="collapse navbar-collapse justify-content-end">
                <a href="MovieServlet?action=view" class="btn btn-outline-light px-4 py-2">
                    <i class="bi bi-arrow-left-circle me-2"></i> Back to Catalog
                </a>
            </div>
        </div>
    </nav>

    <div class="container mb-5">
        <div class="row justify-content-center">
            <div class="col-lg-8 col-md-10">

                <% String status = request.getParameter("status");
                   if ("success".equals(status)) { %>
                    <div class="alert alert-success alert-dismissible fade show shadow-sm mb-4" role="alert">
                        <i class="bi bi-check-circle-fill me-2"></i> Movie added successfully!
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                <% } %>

                <div class="card p-4 p-md-5 shadow-lg">
                    <h3 class="fw-bold mb-4 text-white"><i class="bi bi-camera-reels me-2 text-warning"></i> Add New Movie</h3>

                    <form action="MovieServlet" method="post">
                        <input type="hidden" name="action" value="add">

                        <div class="section-title mt-2"><i class="bi bi-info-circle me-2"></i>General Information</div>

                        <div class="row g-3 mb-3">
                            <div class="col-md-6">
                                <label class="form-label">Movie Title</label>
                                <input type="text" name="title" class="form-control" placeholder="e.g. Inception" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Genre</label>
                                <input type="text" name="genre" class="form-control" placeholder="e.g. Sci-Fi, Action" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Director</label>
                                <input type="text" name="director" class="form-control" placeholder="e.g. Christopher Nolan" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Release Year</label>
                                <input type="number" name="year" class="form-control" placeholder="e.g. 2010" required>
                            </div>
                        </div>

                        <div class="mb-4 mt-4">
                            <label class="form-label text-warning fw-bold">Select Format</label>
                            <select name="type" id="movieType" class="form-select border-warning" onchange="toggleMovieFields()">
                                <option value="DVD">Physical DVD</option>
                                <option value="DIGITAL">Digital Stream</option>
                            </select>
                        </div>

                        <div id="dvdFields" class="bg-dark p-3 rounded-3 mb-4 border border-secondary">
                            <div class="section-title text-info border-info"><i class="bi bi-disc me-2"></i>Physical DVD Details</div>
                            <div class="row g-3">
                                <div class="col-md-4">
                                    <label class="form-label">DVD Code</label>
                                    <input type="text" name="dvdCode" class="form-control" placeholder="e.g. DVD-101">
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label">Condition</label>
                                    <select name="condition" class="form-select">
                                        <option value="New">New</option>
                                        <option value="Good">Good</option>
                                        <option value="Fair">Fair</option>
                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label">Shelf Location</label>
                                    <input type="text" name="shelf" class="form-control" placeholder="e.g. Shelf A">
                                </div>
                            </div>
                        </div>

                        <div id="digitalFields" class="bg-dark p-3 rounded-3 mb-4 border border-secondary" style="display: none;">
                            <div class="section-title text-success border-success"><i class="bi bi-cloud-download me-2"></i>Digital Stream Details</div>
                            <div class="mb-3">
                                <label class="form-label">Streaming URL</label>
                                <input type="url" name="url" class="form-control" placeholder="https://...">
                            </div>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label">File Size (GB)</label>
                                    <input type="number" step="0.1" name="size" class="form-control" placeholder="e.g. 2.5">
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Resolution</label>
                                    <select name="resolution" class="form-select">
                                        <option value="1080p">1080p Full HD</option>
                                        <option value="4K">4K Ultra HD</option>
                                        <option value="720p">720p HD</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                            <a href="MovieServlet?action=view" class="btn btn-outline-light px-4 py-2 me-md-2">Cancel</a>
                            <button type="submit" class="btn btn-warning px-5 py-2"><i class="bi bi-save me-2"></i> Save Movie</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>