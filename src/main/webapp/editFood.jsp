<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.database.DAOs.FoodDAO" %>
<%@ page import="com.database.Models.Food" %>
<%
    int foodID = 0; 
    Food food = null;

    try {
        foodID = Integer.parseInt(request.getParameter("foodID")); // Get foodID from URL
        FoodDAO foodDAO = new FoodDAO();
        food = foodDAO.getFoodById(foodID); 
    } catch (NumberFormatException | NullPointerException e) {
        out.println("<h3>Error: Invalid food ID provided.</h3>");
        return;
    } catch (Exception e) {
        out.println("<h3>Error fetching food details: " + e.getMessage() + "</h3>");
        return;
    }

    if (food == null) {
        out.println("<h3>Error: Food item not found.</h3>");
        return;
    }
%>
<html>
<head>
    <title>Edit Food Item</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css" />
</head>
<body>
    <h2>Edit Food Item</h2>
    <form action="processEditFood.jsp" method="POST">
        <input type="hidden" name="foodID" value="<%= food.getFoodID() %>" />
        <label>Food Name:</label>
        <input type="text" name="foodName" value="<%= food.getFoodName() %>" required /><br />

        <label>Price:</label>
        <input type="number" name="price" step="0.01" value="<%= food.getPrice() %>" required /><br />

        <label>Picture Path:</label>
        <input type="text" name="picturePath" value="<%= food.getPicturePath() %>" required /><br />

        <button type="submit" class="btn">Update Food</button>
    </form>
</body>
</html>
