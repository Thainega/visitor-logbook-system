package com.visitorlogbook.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.visitorlogbook.dao.AdminDAO;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminDAO adminDAO = new AdminDAO();

    /**
     * Handles POST request for admin login
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get username and password from login form
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            // Validate admin credentials using AdminDAO
            if (adminDAO.validateAdmin(username, password)) {
                // ✅ Login successful → create session
                HttpSession session = request.getSession();
                session.setAttribute("adminUser", username);

                // Redirect to index.jsp (main page after login)
                response.sendRedirect("AdminDashboardServlet");
            } else {
                // ❌ Invalid credentials → show error on login page
                request.setAttribute("error", "Invalid username or password!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            // ❌ Handle exceptions and show error
            e.printStackTrace();
            request.setAttribute("error", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    /**
     * Handles GET request → forward to login page
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // If user opens /LoginServlet directly, redirect to login.jsp
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}
