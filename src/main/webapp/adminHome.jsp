<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");

    if (username == null || !"Admin".equals(role)) {
        response.sendRedirect("Login.jsp"); // Redirect to login if not authenticated as Admin
        return;
    }
%>
<html>
<head>
    <title>Admin Dashboard - Canteen Management</title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body>
    <header>
        <h1>Admin Dashboard</h1>
        <p>Welcome, <strong><%= username %></strong>!</p>
        <a href="Login.jsp" class="btn">Logout</a>
    </header>
    <hr />

    <main>
        <section>
            <h2>Manage Canteen Operations</h2>
            <ul>
                <li><a href="manageFood.jsp" class="link">Manage Food Items</a></li>
                <li><a href="viewOrders.jsp" class="link">View All Orders</a></li>
                <li><a href="viewFeedback.jsp" class="link">View Customer Feedback</a></li>
                <li><a href="addQuestions.jsp" class="btn">Add Daily Questions</a></li> <!-- Only for Admin -->
    <li><a href="viewAnswers.jsp" class="btn">view Answers</a></li> <!-- Only for Admin -->
            
            </ul>
        </section>
    </main>

    <footer>
        <hr />
        <p>&copy; <%= Calendar.getInstance().get(Calendar.YEAR) %> Canteen Management System</p>
    </footer>
                  <p align="right"><a href="home.jsp">Back</a></p>
    
</body>
</html>
