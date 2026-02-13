<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%

    // Ensure the user is logged in
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");
    Integer userID = (Integer) session.getAttribute("userID"); // UserID from session

    if (username == null || userID == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>
<html>
<head>
    <title>Provide Feedback</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css" />
</head>
<body>
    <link rel="stylesheet" type="text/css" href="styles.css" />

    <header>
        <h1>Submit Your Feedback</h1>
        <p>Hello, <strong><%= username %></strong>! We value your feedback.</p>
        <a href="userHome.jsp" class="btn">Back to Dashboard</a>
        <a href="Login.jsp" class="btn">Logout</a>
    </header>
    <hr />

    <main>
        <form action="processFeedback.jsp" method="POST">
            <label for="feedback">Your Feedback:</label><br />
            <textarea id="feedback" name="feedbackText" rows="5" cols="50" required></textarea><br />
            <button type="submit" class="btn">Submit Feedback</button>
        </form>
    </main>

    <footer>
        <hr />
        <p>&copy; <%= Calendar.getInstance().get(Calendar.YEAR) %> Canteen Management System</p>
    </footer>
</body>
</html>
