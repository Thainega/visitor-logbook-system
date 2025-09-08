package com.visitorlogbook.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.visitorlogbook.dao.VisitorDAO;
import com.visitorlogbook.model.Visitor;

@WebServlet("/ViewTodayServlet")
public class ViewTodayServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Check admin session
        HttpSession session = request.getSession();
        String adminUser = (String) session.getAttribute("adminUser");
        if (adminUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Create DAO
        VisitorDAO dao = new VisitorDAO();
        List<Visitor> todayVisitors;

        // 🔎 Check if search parameter exists
        String search = request.getParameter("search");
        if (search != null && !search.trim().isEmpty()) {
            todayVisitors = dao.searchTodaysVisitors(search);
        } else {
            todayVisitors = dao.getTodaysVisitors();
        }

        // Set visitors in request scope
        request.setAttribute("todayVisitors", todayVisitors);

        // Forward to viewToday.jsp
        request.getRequestDispatcher("viewToday.jsp").forward(request, response);
    }
}


