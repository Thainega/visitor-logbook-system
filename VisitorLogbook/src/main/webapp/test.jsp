<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>JDBC Test</title>
</head>
<body>
<h2>MySQL JDBC Connection Test</h2>
<pre>
<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/visitorlogbook?useSSL=false&serverTimezone=Asia/Kolkata", 
        "root", 
        ""
    );
    out.println("✅ Connected!");
    conn.close();
} catch(Exception e) {
    out.println(" Failed: " + e.getMessage());
    for (StackTraceElement ste : e.getStackTrace()) {
        out.println(ste.toString());
    }
}
%>
</pre>
</body>
</html>
