package com.visitorlogbook.servlet;

import com.visitorlogbook.dao.VisitorDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/DeleteVisitorServlet")
public class DeleteVisitorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private VisitorDAO dao = new VisitorDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get visitor ID from request
            int id = Integer.parseInt(request.getParameter("id"));

            // Delete visitor using DAO
            dao.deleteVisitor(id);

            // Set success message
            request.setAttribute("msg", "Visitor Deleted Successfully!");

            // Forward to the JSP page
            request.getRequestDispatcher("deleteSuccess.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();

            // Set error message and forward to the same JSP
            request.setAttribute("msg", "Error deleting visitor. Please try again.");
            request.getRequestDispatcher("deleteSuccess.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
