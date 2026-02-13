<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
     HttpSession hs=  request.getSession();
 String username=(String) hs.getAttribute("dbusername");
  %>
<html>
<head>
    <title>Staff Dashboard - Canteen Management</title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body>
    <header>
        <h1>Welcome to the Canteen</h1>
        <p>Hello, <strong><%= username %></strong>!</p>
        <a href="stafflogin.jsp" class="btn">Logout</a><br>
          <p align="right"><a href="Login.jsp">Back</a></p>
         
    </header>
    <hr />

    <main>
        <h2>What Would You Like To Do?</h2>
        <ul>
            <li><a href="adminmenu.jsp" class="link">View Menu and Order Food</a></li>
            <li><a href="staffviewOrders.jsp" class="link">View Your Orders</a></li>
            <li><a href="stafffeedback.jsp" class="link">Provide Feedback</a></li>
        </ul>
    </main>

    <footer>
        <hr />
        <p>&copy; <%= Calendar.getInstance().get(Calendar.YEAR) %> Canteen Management System</p>
    </footer>
</body>
</html>
