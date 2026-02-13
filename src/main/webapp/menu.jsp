<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.database.DAOs.FoodDAO" %>
<%@ page import="com.database.Models.Food" %>
<%
    FoodDAO foodDAO = new FoodDAO();
    List<Food> foodList = new ArrayList<>();
    try {
        foodList = foodDAO.getAllFood(); // Fetch all food items
    } catch (Exception e) {
        out.println("<h3>Error fetching food data: " + e.getMessage() + "</h3>");
        e.printStackTrace();
    }
%>
<html>
<head>
    <title>Menu</title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body>
    <h2>Menu</h2>
    <table border="1">
        <tr>
            <th>Food Name</th>
            <th>Price</th>
            <th>Picture</th>
            <th>Order</th>
        </tr>
        <% for (Food food : foodList) { %>
        <tr>
            <td><%= food.getFoodName() %></td>
            <td>$<%= food.getPrice() %></td>
            <td><img src="<%= food.getPicturePath() %>" alt="<%= food.getFoodName() %>" width="50"></td>
            <td>
               <form action="placeOrder.jsp" method="POST">
    <input type="hidden" name="foodID" value="1" />
    <input type="hidden" name="price" value="9.99" />
    <input type="number" name="quantity" min="1" required />
    <button type="submit">Order</button>
    
</form>

            </td>
        </tr>
        <% } %>
    </table>
                  <p align="right"><a href="userHome.jsp">Back</a></p>
    
</body>
</html>
