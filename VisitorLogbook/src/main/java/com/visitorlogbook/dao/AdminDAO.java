package com.visitorlogbook.dao;

import java.sql.*;

public class AdminDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/visitorlogbook";
    private String jdbcUsername = "root";   // ✅ change to your MySQL username
    private String jdbcPassword = "novin";   // ✅ change to your MySQL password

    // JDBC Driver
    private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";

    // SQL query
    private static final String VALIDATE_ADMIN_SQL =
            "SELECT * FROM admin WHERE username = ? AND password = ?";

    public boolean validateAdmin(String username, String password) {
        boolean isValid = false;

        try {
            // Load MySQL driver
            Class.forName(JDBC_DRIVER);

            // Connect to DB
            try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
                 PreparedStatement preparedStatement = connection.prepareStatement(VALIDATE_ADMIN_SQL)) {

                preparedStatement.setString(1, username);
                preparedStatement.setString(2, password);

                ResultSet rs = preparedStatement.executeQuery();
                if (rs.next()) {
                    isValid = true; // ✅ Admin exists
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isValid;
    }
}
