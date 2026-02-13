<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.database.DAOs.FeedbackDAO" %>
<%
    Integer userID = (Integer) session.getAttribute("userID");
    if (userID == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    String feedbackText = request.getParameter("feedbackText");

    try {
        FeedbackDAO feedbackDAO = new FeedbackDAO();
        boolean isFeedbackSaved = feedbackDAO.saveFeedback(userID, feedbackText);

        if (isFeedbackSaved) {
            out.println("<h3>Thank you for your feedback!</h3>");
        } else {
            out.println("<h3>Failed to submit feedback. Please try again.</h3>");
        }
        out.println("<a href='userHome.jsp'>Back to Dashboard</a>");
    } catch (Exception e) {
        out.println("<h3>Error processing feedback: " + e.getMessage() + "</h3>");
        e.printStackTrace();
    }
%>
