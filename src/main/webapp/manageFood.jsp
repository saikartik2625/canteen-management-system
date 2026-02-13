<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@ page import="com.database.DAOs.FoodDAO" %>
<%@ page import="com.database.Models.Food" %>
<%
    FoodDAO foodDAO = new FoodDAO();
    List<Food> foodList = foodDAO.getAllFood();
%>
<html>
<head>
    <title>Manage Food Items</title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body>
    <header>
        <h1>Manage Food Items</h1>
        <p>Welcome, <strong><%= session.getAttribute("username") %></strong>!</p>
        <a href="adminHome.jsp" class="btn">Back to Dashboard</a>
        <a href="addFood.jsp" class="btn">Add New Food</a>
        <a href="Login.jsp" class="btn">Logout</a>
    </header>
    <hr />

    <main>
        <h2>Food Items</h2>
        <% if (foodList.isEmpty()) { %>
            <p>No food items found.</p>
        <% } else { %>
            <table>
                <tr>
                    <th>Food ID</th>
                    <th>Food Name</th>
                    <th>Price</th>
                    <th>Actions</th>
                </tr>
                <% for (Food food : foodList) { %>
                <tr>
                    <td><%= food.getFoodID() %></td>
                    <td><%= food.getFoodName() %></td>
                    <td>$<%= food.getPrice() %></td>
                    <td>
                        <a href="editFood.jsp?foodID=<%= food.getFoodID() %>" class="btn">Edit</a>
                        <a href="deleteFood.jsp?foodID=<%= food.getFoodID() %>" class="btn" onclick="return confirm('Are you sure you want to delete this food item?');">Delete</a>
                    </td>
                </tr>
                <% } %>
            </table>
        <% } %>
    </main>

    <footer>
        <hr />
        <p>&copy; <%= Calendar.getInstance().get(Calendar.YEAR) %> Canteen Management System</p>
    </footer>
                  <p align="right"><a href="adminHome.jsp">Back</a></p>
    
</body>
</html>
