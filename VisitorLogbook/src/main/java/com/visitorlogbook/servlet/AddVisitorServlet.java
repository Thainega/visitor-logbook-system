package com.visitorlogbook.servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.visitorlogbook.dao.VisitorDAO;
import com.visitorlogbook.model.Visitor;

@WebServlet("/AddVisitorServlet")
public class AddVisitorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private VisitorDAO dao = new VisitorDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Visitor visitor = new Visitor();
            visitor.setName(request.getParameter("name"));
            visitor.setMobile(request.getParameter("mobile"));
            visitor.setPersonToMeet(request.getParameter("personToMeet"));
            visitor.setVisitDate(LocalDate.now());
            visitor.setCheckinTime(LocalTime.now());

            boolean success = dao.addVisitor(visitor);

            // Forward to success.jsp with proper message
            if (success) {
                request.setAttribute("message", "Visitor added successfully!");
            } else {
                request.setAttribute("message", "Failed to add visitor.");
            }

            request.getRequestDispatcher("success.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error: " + e.getMessage());
            request.getRequestDispatcher("success.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
