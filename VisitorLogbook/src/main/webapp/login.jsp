<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Login - Visitor Logbook</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #f0f4f8, #d9e2ef);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .login-card {
            background: #ffffff;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 400px;
        }
        .login-card h3 {
            color: #1a3d7c;
            font-weight: 600;
            margin-bottom: 30px;
        }
        .btn-login {
            background: #1a3d7c;
            color: #fff;
            font-weight: 500;
            transition: 0.3s;
        }
        .btn-login:hover {
            background: #162f5a;
        }
        .form-label {
            font-weight: 500;
        }
        .error-msg {
            color: #dc3545;
            margin-bottom: 15px;
            font-size: 0.9rem;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="login-card">
        <h3 class="text-center">Admin Login</h3>

        <!-- Display error message if login fails -->
        <% String error = (String) request.getAttribute("error"); 
           if(error != null) { %>
            <div class="error-msg"><%= error %></div>
        <% } %>

        <form action="LoginServlet" method="post">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" id="username" name="username" class="form-control" placeholder="Enter your username" required>
            </div>
            <div class="mb-4">
                <label for="password" class="form-label">Password</label>
                <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password" required>
            </div>
            <button type="submit" class="btn btn-login w-100">Login</button>
        </form>
    </div>
</body>
</html>
