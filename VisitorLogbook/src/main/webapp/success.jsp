<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Success</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        .checkmark {
            font-size: 80px;
            color: green;
        }
    </style>
</head>
<body class="bg-light">
<div class="container mt-5 text-center">

    <!-- Tick symbol -->
    <div class="checkmark">✅</div>

    <!-- Success message -->
    <h2 class="text-success mt-3">
        <%= request.getAttribute("message") != null ? request.getAttribute("message") : "Visitor added successfully!" %>
    </h2>

    <!-- Buttons -->
    <div class="mt-4">
        <a href="AdminDashboardServlet" class="btn btn-primary me-2">
            🔙 Back to Dashboard
        </a>
        <a href="ViewTodayServlet" class="btn btn-success me-2">
            📅 View Today’s Visitors
        </a>
        <a href="ViewWeekServlet" class="btn btn-info">
            📆 View Week’s Visitors
        </a>
    </div>

</div>
</body>
</html>

