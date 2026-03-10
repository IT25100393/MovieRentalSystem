<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MovieFlex - Add Movie</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #000; color: #fff; font-family: 'Segoe UI', sans-serif; }
        .navbar { background-color: #000; border-bottom: 1px solid #333; }
        .card { background-color: #1a1a1a; border: 1px solid #333; border-radius: 15px; }
        .btn-primary { background-color: #f5c518; border: none; color: #000; font-weight: bold; }
        .btn-primary:hover { background-color: #e2b616; }
        .form-control, .form-select { background-color: #333; border: 1px solid #444; color: #fff; }
        .form-control:focus { background-color: #444; color: #fff; border-color: #f5c518; box-shadow: none; }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg py-3">
        <div class="container">
            <a class="navbar-brand text-warning fw-bold" href="#">🎬 MOVIEFLEX</a>
            <div class="d-flex align-items-center">
                <span class="me-3">Hi, Admin!</span>
                <button class="btn btn-danger btn-sm rounded-pill">Logout</button>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card p-4 shadow">
                    <h3 class="text-center mb-4 text-warning">Add a New Movie</h3>
                    <form action="MovieServlet" method="post">
                        <input type="hidden" name="action" value="add">

                        <div class="mb-3">
                            <label class="form-label">Movie Title</label>
                            <input type="text" name="title" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Genre</label>
                            <input type="text" name="genre" class="form-control" required>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                <label class="form-label">Director</label>
                                <input type="text" name="director" class="form-control" required>
                            </div>
                            <div class="col">
                                <label class="form-label">Year</label>
                                <input type="number" name="year" class="form-control" required>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Format Type</label>
                            <select name="type" class="form-select" onchange="toggleFields(this.value)">
                                <option value="DVD">Physical DVD</option>
                                <option value="DIGITAL">Digital Streaming</option>
                            </select>
                        </div>

                        <div id="dvdFields">
                            <div class="mb-3">
                                <label class="form-label">DVD Code</label>
                                <input type="text" name="dvdCode" class="form-control" placeholder="e.g. DVD-001">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Condition</label>
                                <select name="condition" class="form-select">
                                    <option value="New">New</option>
                                    <option value="Good">Good</option>
                                    <option value="Fair">Fair</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Shelf Location</label>
                                <input type="text" name="shelf" class="form-control" placeholder="e.g. Shelf A1">
                            </div>
                        </div>

                        <div id="digitalFields" style="display:none;">
                            <div class="mb-3">
                                <label class="form-label">Streaming URL</label>
                                <input type="text" name="url" class="form-control" placeholder="e.g. http://stream.link">
                            </div>
                            <div class="row mb-3">
                                <div class="col">
                                    <label class="form-label">File Size (GB)</label>
                                    <input type="number" step="0.1" name="size" class="form-control" value="0.0">
                                </div>
                                <div class="col">
                                    <label class="form-label">Resolution</label>
                                    <select name="resolution" class="form-select">
                                        <option value="1080p">1080p</option>
                                        <option value="4K">4K</option>
                                        <option value="720p">720p</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary w-100 py-2 mt-3">Save Movie</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        function toggleFields(val) {
            document.getElementById('dvdFields').style.display = (val === 'DVD') ? 'block' : 'none';
            document.getElementById('digitalFields').style.display = (val === 'DIGITAL') ? 'block' : 'none';
        }
    </script>
</body>
</html>