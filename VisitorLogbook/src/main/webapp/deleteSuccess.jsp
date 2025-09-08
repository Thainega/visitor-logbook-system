<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Visitor Deleted</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #eef2f7;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 500px;
            margin: 150px auto;
            background: #fff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.1);
            text-align: center;
        }
        h2 {
            color: #dc3545;
            margin-bottom: 20px;
        }
        a.btn-back {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background: #17a2b8;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 500;
            transition: 0.3s;
        }
        a.btn-back:hover {
            background: #138496;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Visitor Deleted Successfully!</h2>
        <a href="dashboard.jsp" class="btn-back">← Back to Dashboard</a>
    </div>
</body>
</html>
