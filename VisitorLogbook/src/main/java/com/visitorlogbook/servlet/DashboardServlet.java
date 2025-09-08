package com.visitorlogbook.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.visitorlogbook.dao.VisitorDAO;
import com.visitorlogbook.model.Visitor;

@WebServlet("/AdminDashboardServlet")
public class DashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private VisitorDAO dao = new VisitorDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ✅ Check if admin is logged in
        HttpSession session = request.getSession(false); // don't create new session
        if (session == null || session.getAttribute("adminUser") == null) {
            response.sendRedirect("login.jsp"); // redirect if not logged in
            return;
        }

        // Get today's and week's visitors
        List<Visitor> todayVisitors = dao.getTodaysVisitors();
        List<Visitor> weekVisitors = dao.getWeekVisitors();

        // Set attributes for JSP
        request.setAttribute("todayVisitors", todayVisitors);
        request.setAttribute("weekVisitors", weekVisitors);
        request.setAttribute("todayCount", todayVisitors.size());
        request.setAttribute("weekCount", weekVisitors.size());

        // Move message from session to request (if exists)
        String message = (String) session.getAttribute("message");
        if (message != null) {
            request.setAttribute("message", message);
            session.removeAttribute("message");
        }

        // Forward to dashboard.jsp
        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }

    // Optional: handle POST the same way
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}


