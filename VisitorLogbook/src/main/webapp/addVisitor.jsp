<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Visitor</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #e0f0ff, #f8fbff);
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }
        .card {
            border-radius: 16px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
            background: #ffffff;
            padding: 30px;
            width: 100%;
            max-width: 550px;
            text-align: center;
        }
        h3 { font-weight: 600; color: #4a6cf7; margin-bottom: 25px; }
        .form-label { font-weight: 500; color: #333; }
        .form-control { border-radius: 10px; border: 1px solid #ced4da; }
        .btn-primary { background: linear-gradient(90deg, #4a6cf7, #6a8dff); border: none; font-weight: 500; }
        .btn-primary:hover { opacity: 0.9; }
        .btn-secondary { background-color: #6c757d; border: none; font-weight: 500; }
        .btn-secondary:hover { opacity: 0.85; }
        .alert { border-radius: 10px; margin-bottom: 15px; }
        .button-group {
            display: flex;
            justify-content: center; /* Center buttons */
            gap: 15px; /* Space between buttons */
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="card">
    <h3><i class="fa fa-user-plus"></i> Add New Visitor</h3>

    <!-- Display Success / Error Message -->
    <%
        String msg = request.getParameter("msg");
        if (msg != null) {
            msg = URLDecoder.decode(msg, "UTF-8");
            if (msg.toLowerCase().contains("success")) {
    %>
                <div class="alert alert-success text-center">
                    <i class="fa fa-check-circle"></i> <%= msg %>
                </div>
    <%
            } else {
    %>
                <div class="alert alert-danger text-center">
                    <i class="fa fa-times-circle"></i> <%= msg %>
                </div>
    <%
            }
        }
    %>

    <!-- Add Visitor Form -->
    <form action="AddVisitorServlet" method="post">
        <div class="mb-3 text-start">
            <label class="form-label"><i class="fa fa-user"></i> Visitor Name</label>
            <input type="text" name="name" class="form-control" placeholder="Enter full name" required>
        </div>
        <div class="mb-3 text-start">
            <label class="form-label"><i class="fa fa-phone"></i> Mobile Number</label>
            <input type="text" name="mobile" class="form-control" placeholder="10-digit mobile number" maxlength="10" required>
        </div>
        <div class="mb-3 text-start">
            <label class="form-label"><i class="fa fa-user-tie"></i> Person to Meet</label>
            <input type="text" name="personToMeet" class="form-control" placeholder="Enter the person to meet" required>
        </div>
        <div class="mb-3 text-start">
            <label class="form-label"><i class="fa fa-calendar"></i> Visit Date</label>
            <input type="date" name="visitDate" class="form-control" required>
        </div>
        <div class="mb-3 text-start">
            <label class="form-label"><i class="fa fa-clock"></i> Check-In Time</label>
            <input type="time" name="checkinTime" class="form-control" required>
        </div>

        <div class="button-group">
            <a href="dashboard.jsp" class="btn btn-secondary">
                <i class="fa fa-arrow-left"></i> Back to Dashboard
            </a>
            <button type="submit" class="btn btn-primary">
                <i class="fa fa-plus"></i> Add Visitor
            </button>
        </div>
    </form>
</div>
</body>
</html>






