<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow">
                <div class="card-header bg-primary text-white text-center">
                    <h3>Register Member</h3>
                </div>
                <div class="card-body">
                    <form action="register" method="post">

                        <div class="mb-3">
                            <label class="form-label">User ID</label>
                            <input type="text" name="userId" class="form-control" placeholder="U001" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Full Name</label>
                            <input type="text" name="name" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Email Address</label>
                            <input type="email" name="email" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="password" name="password" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Membership Type</label>
                            <select name="type" class="form-select">
                                <option value="Regular">Regular Member</option>
                                <option value="Premium">Premium Member</option>
                            </select>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary">Register Now</button>
                        </div>

                    </form>
                </div>
                <div class="card-footer text-center">
                    <small>Already have an account? <a href="login.jsp">Login here</a></small>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>