<%@page import="com.database.DAOs.Feedback"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.database.DAOs.FeedbackDAO" %>
<%
    // Ensure admin is logged in
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");

    if (username == null || !"Admin".equals(role)) {
        response.sendRedirect("Login.jsp");
        return;
    }

    // Fetch all feedback
    FeedbackDAO feedbackDAO = new FeedbackDAO();
    List<Feedback> feedbackList = new ArrayList<>();
    try {
        feedbackList = feedbackDAO.getAllFeedback();
    } catch (Exception e) {
        out.println("<h3>Error fetching feedback: " + e.getMessage() + "</h3>");
    }
%>
<html>
<head>
    <title>View Customer Feedback</title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body>
    <header>
        <h1>Admin Dashboard - View Feedback</h1>
        <p>Welcome, <strong><%= username %></strong>!</p>
        <a href="adminHome.jsp" class="btn">Back to Dashboard</a>
        <a href="home.jsp" class="btn">Logout</a>
    </header>
    <hr />

    <main>
        <h2>Customer Feedback</h2>
        <% if (feedbackList.isEmpty()) { %>
            <p>No feedback available.</p>
        <% } else { %>
            <table>
                <tr>
                    <th>Feedback ID</th>
                    <th>User ID</th>
                    <th>Feedback</th>
                    <th>Timestamp</th>
                </tr>
                <% for (Feedback feedback : feedbackList) { %>
                <tr>
                    <td><%= feedback.getFeedbackID() %></td>
                    <td><%= feedback.getUserID() %></td>
                    <td><%= feedback.getFeedbackText() %></td>
                    <td><%= feedback.getTimestamp() %></td>
                </tr>
                <% } %>
            </table>
        <% } %>
    </main>

    <footer>
        <hr />
        <p>&copy; <%= Calendar.getInstance().get(Calendar.YEAR) %> Canteen Management System</p>
    </footer>
</body>
</html>
