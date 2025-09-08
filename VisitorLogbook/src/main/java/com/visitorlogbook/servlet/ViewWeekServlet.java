package com.visitorlogbook.servlet;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.visitorlogbook.dao.VisitorDAO;
import com.visitorlogbook.model.Visitor;

@WebServlet("/ViewWeekServlet")
public class ViewWeekServlet extends HttpServlet {
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

        // Get search query from request
        String searchQuery = request.getParameter("search");

        // Get this week's visitors using DAO
        VisitorDAO dao = new VisitorDAO();
        List<Visitor> weekVisitors = dao.getWeekVisitors();

        // Filter visitors if searchQuery is not empty
        if (searchQuery != null && !searchQuery.isEmpty()) {
            String lowerSearch = searchQuery.toLowerCase();
            weekVisitors = weekVisitors.stream()
                    .filter(v -> v.getName().toLowerCase().contains(lowerSearch)
                              || v.getMobile().contains(lowerSearch)
                              || v.getPersonToMeet().toLowerCase().contains(lowerSearch))
                    .collect(Collectors.toList());
        }

        // Set visitors and search query in request scope
        request.setAttribute("weekVisitors", weekVisitors);
        request.setAttribute("searchQuery", searchQuery);

        // Forward to viewWeek.jsp
        request.getRequestDispatcher("viewWeek.jsp").forward(request, response);
    }
}


