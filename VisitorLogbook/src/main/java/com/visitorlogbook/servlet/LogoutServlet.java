package com.visitorlogbook.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Invalidate the session if it exists
        HttpSession session = request.getSession(false); // false → don't create new session
        if (session != null) {
            session.invalidate(); // remove all session attributes
        }

        // Redirect to login page after logout
        response.sendRedirect("login.jsp");
    }
}
