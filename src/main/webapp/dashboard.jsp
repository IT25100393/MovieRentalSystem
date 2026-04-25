<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="p-5">
    <div class="container border p-4 bg-white shadow rounded">
        <h2>Welcome, ${sessionScope.userName}!</h2>
        <p>You have successfully logged into the Movie Rental System.</p>
        <hr>
        <a href="logout" class="btn btn-danger">Logout</a>
    </div>
</body>
</html>