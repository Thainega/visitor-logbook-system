<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, com.visitorlogbook.model.Visitor, java.time.format.DateTimeFormatter" %>
<%
    String adminUser = (String) session.getAttribute("adminUser");
    if (adminUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    @SuppressWarnings("unchecked")
    List<Visitor> weekVisitors = (List<Visitor>) request.getAttribute("weekVisitors");
    DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
    DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("hh:mm a");
    String message = (String) request.getAttribute("message");
    String searchQuery = request.getParameter("search");
%>
<!DOCTYPE html>
<html>
<head>
    <title>This Week's Visitors</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link href="styles.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #e0f0ff, #f8fbff);
            color: #333;
        }

        .delete-btn {
            background: #e74c3c;
            color: white;
        }

        .delete-btn:hover {
            background: #c0392b;
        }

        .table-container {
            padding: 40px;
        }

        .dashboard-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 8px 18px;
            background: linear-gradient(90deg, #4a6cf7, #6a8dff);
            color: white;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 500;
        }

        .dashboard-btn:hover {
            opacity: 0.9;
        }

        .search-box {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="table-container">
    <h2><i class="bi bi-calendar-week"></i> This Week's Visitors</h2>

    <% if(message != null) { %>
        <div class="alert alert-success text-center"><i class="bi bi-check-circle"></i> <%= message %></div>
    <% } %>

    <!-- 🔎 Search Form -->
    <form method="get" action="ViewWeekServlet" class="search-box">
        <div class="input-group">
            <input type="text" name="search" class="form-control" placeholder="Search by Name or Mobile"
                   value="<%= searchQuery != null ? searchQuery : "" %>">
            <button type="submit" class="btn btn-primary"><i class="bi bi-search"></i> Search</button>
        </div>
    </form>

    <div class="table-responsive">
        <table class="table table-striped table-bordered align-middle">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Mobile</th>
                    <th>Person to Meet</th>
                    <th>Visit Date</th>
                    <th>Check-In Time</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <%
                if (weekVisitors != null && !weekVisitors.isEmpty()) {
                    for (Visitor v : weekVisitors) {
            %>
                <tr>
                    <td><%= v.getName() %></td>
                    <td><%= v.getMobile() %></td>
                    <td><%= v.getPersonToMeet() %></td>
                    <td><%= v.getVisitDate().format(dateFormatter) %></td>
                    <td><%= v.getCheckinTime().format(timeFormatter) %></td>
                    <td>
                        <a href="DeleteVisitorServlet?id=<%= v.getId() %>&source=week"
                           class="delete-btn btn"
                           onclick="return confirm('Are you sure you want to delete this visitor?');">
                           <i class="bi bi-trash"></i> Delete
                        </a>
                    </td>
                </tr>
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="6" class="text-center">No visitors this week.</td>
                </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>

    <a href="AdminDashboardServlet" class="dashboard-btn"><i class="bi bi-arrow-left"></i> Back to Dashboard</a>
</div>
</body>
</html>
