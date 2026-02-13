<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%

    // Ensure the user is logged in
    String username = (String) session.getAttribute("dbusername");
   // String role = (String) session.getAttribute("role");
  //  Integer userID = (Integer) session.getAttribute("userID"); // UserID from session

    if (username == null ) {
        response.sendRedirect("stafflogin.jsp");
        return;
    }
%>
<html>
<head>
    <title>Provide Feedback</title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body>
    <link rel="stylesheet" type="text/css" href="styles.css" />

    <header>
        <h1>Submit Your Feedback</h1>
        <p>Hello, <strong><%= username %></strong>! We value your feedback.</p>
        <a href="staffadmin.jsp" class="btn">Back to Dashboard</a>
        <a href="stafflogin.jsp" class="btn">Logout</a>
    </header>
    <hr />

    <main>
        <form action="staffprocessFeedback.jsp" method="POST">
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
