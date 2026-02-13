<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Ensure the user is logged in
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");

    if (username == null || !"User".equals(role)) {
        response.sendRedirect("Login.jsp"); // Redirect to login if not authenticated as User
        return;
    }
%>
<html>
<head>
    <title>User Dashboard - Canteen Management</title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body>
    <header>
        <h1>Welcome to the Canteen</h1>
        <p>Hello, <strong><%= username %></strong>!</p>
        <a href="Login.jsp" class="btn">Logout</a><br>
          <p align="right"><a href="Login.jsp">Back</a></p>
         
    </header>
    <hr />

    <main>
        <h2>What Would You Like To Do?</h2>
        <ul>
            <li><a href="menu.jsp" class="link">View Menu and Order Food</a></li>
            <li><a href="viewOrders.jsp" class="link">View Your Orders</a></li>
            <li><a href="feedback.jsp" class="link">Provide Feedback</a></li>
        </ul>
    </main>

    <footer>
        <hr />
        <p>&copy; <%= Calendar.getInstance().get(Calendar.YEAR) %> Canteen Management System</p>
    </footer>
</body>
</html>
