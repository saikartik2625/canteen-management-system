<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Ensure admin is logged in
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");

    if (username == null || !"Admin".equals(role)) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>
<html>
<head>
    <title>Add New Food Item</title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body>
    <header>
        <h1>Add New Food Item</h1>
        <p>Welcome, <strong><%= username %></strong>!</p>
        <a href="manageFood.jsp" class="btn">Back to Manage Food</a>
        <a href="home.jsp" class="btn">Logout</a>
    </header>
    <hr />

    <main>
        <form action="processAddFood.jsp" method="POST">
            <label for="foodName">Food Name:</label><br />
            <input type="text" id="foodName" name="foodName" required /><br />

            <label for="price">Price ($):</label><br />
            <input type="number" id="price" name="price" step="0.01" required /><br />

            <label for="picturePath">Picture Path:</label><br />
            <input type="text" id="picturePath" name="picturePath" required /><br />

            <button type="submit" class="btn">Add Food</button>
        </form>
    </main>

    <footer>
        <hr />
        <p>&copy; <%= Calendar.getInstance().get(Calendar.YEAR) %> Canteen Management System</p>
    </footer>
</body>
</html>
