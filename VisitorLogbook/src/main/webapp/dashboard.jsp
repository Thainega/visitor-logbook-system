<%@ page import="java.util.*, com.visitorlogbook.dao.VisitorDAO, com.visitorlogbook.model.Visitor" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #e0f0ff, #f8fbff);
            color: #333;
        }

        /* Header */
        .header {
            background: linear-gradient(90deg, #4a6cf7, #6a8dff);
            color: white;
            padding: 24px 20px;
            text-align: center;
            font-size: 26px;
            font-weight: 500;
            letter-spacing: 1px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            position: relative;
        }

        .header-title {
            display: block;
        }

        .logout-btn {
            position: absolute;
            right: 20px;
            top: 50%;
            transform: translateY(-50%);
            background: white;
            color: #4a6cf7;
            border: none;
            border-radius: 6px;
            padding: 8px 16px;
            font-weight: 500;
            font-size: 14px;
            cursor: pointer;
            text-decoration: none;
            transition: 0.2s;
        }

        .logout-btn:hover {
            background: #f0f0f0;
        }

        /* Cards */
        .cards {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            margin: 50px auto;
            gap: 30px;
            max-width: 1200px;
            padding: 0 20px;
        }

        .card {
            background: white;
            border-radius: 16px;
            width: 240px;
            padding: 30px 20px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
            text-align: center;
            transition: transform 0.25s, box-shadow 0.25s;
        }

        .card:hover {
            transform: translateY(-8px);
            box-shadow: 0 16px 30px rgba(0,0,0,0.12);
        }

        .icon {
            font-size: 38px;
            margin-bottom: 10px;
        }

        .card h3 {
            font-size: 36px;
            margin: 8px 0;
            color: #4a6cf7;
            font-weight: 600;
        }

        .card p {
            margin: 0;
            font-size: 16px;
            color: #666;
        }

        .btn {
            display: inline-block;
            margin-top: 16px;
            padding: 8px 18px;
            background: linear-gradient(90deg, #4a6cf7, #6a8dff);
            color: white;
            border: none;
            border-radius: 6px;
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            transition: opacity 0.2s;
        }

        .btn:hover {
            opacity: 0.9;
        }

        .msg {
            text-align: center;
            margin: 20px;
            font-size: 16px;
            color: green;
        }

        @media (max-width: 768px) {
            .cards {
                flex-direction: column;
                align-items: center;
            }
            .card {
                width: 90%;
            }
        }
    </style>
</head>
<body>
    <div class="header">
        <span class="header-title">📋 Visitor Logbook - Admin Dashboard</span>
        <a href="LogoutServlet" class="logout-btn">Logout</a>
    </div>

    <%
        // Show message if redirected from add visitor
        String msg = request.getParameter("msg");
        if(msg != null) {
    %>
        <div class="msg"><%= msg %></div>
    <%
        }

        // Fetch visitor counts
        VisitorDAO dao = new VisitorDAO();
        int todayCount = 0;
        int weekCount = 0;

        try {
            todayCount = dao.getTodaysVisitors().size();
            weekCount = dao.getWeekVisitors().size();
        } catch(Exception e) {
            out.println("<p style='color:red;'>Error loading visitors: " + e.getMessage() + "</p>");
            e.printStackTrace();
        }
    %>

    <div class="cards">
        <div class="card">
            <div class="icon">📅</div>
            <h3><%= todayCount %></h3>
            <p>Visitors Today</p>
            <a href="ViewTodayServlet" class="btn">View Today</a>
        </div>
        <div class="card">
            <div class="icon">🗓️</div>
            <h3><%= weekCount %></h3>
            <p>Visitors This Week</p>
            <a href="ViewWeekServlet" class="btn">View Week</a>
        </div>
        <div class="card">
            <div class="icon">➕</div>
            <h3 style="font-size:32px; color:#4a6cf7;">Add</h3>
            <p>New Visitor</p>
            <a href="addVisitor.jsp" class="btn">Add Visitor</a>
        </div>
    </div>
</body>
</html>


