<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Check if admin is logged in
    String adminUser = (String) session.getAttribute("adminUser");
    if (adminUser == null) {
        response.sendRedirect("login.jsp"); // redirect to login if not logged in
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Visitor Logbook - Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #e0f0ff, #f8fbff);
        }
        .container {
            text-align: center;
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            margin-top: 100px;
        }
        h1 {
            color: #4a6cf7;
            margin-bottom: 20px;
        }
        a {
            display: inline-block;
            margin: 10px;
            padding: 10px 20px;
            background: linear-gradient(90deg, #4a6cf7, #6a8dff);
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: 500;
            transition: opacity 0.2s;
        }
        a:hover {
            opacity: 0.9;
        }
        .logout-btn {
            background: #ff4d4f !important;
        }
        i {
            margin-right: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1><i class="bi bi-person-circle"></i> Welcome, <%= adminUser %></h1>
        <a href="AddVisitorServlet"><i class="bi bi-person-plus"></i> Add Visitor</a>
        <a href="ViewTodayServlet"><i class="bi bi-calendar-day"></i> View Today's Visitors</a>
        <a href="ViewWeekServlet"><i class="bi bi-calendar-week"></i> View This Week's Visitors</a>
        <a href="LogoutServlet" class="logout-btn"><i class="bi bi-box-arrow-right"></i> Logout</a>
    </div>
</body>
</html>

