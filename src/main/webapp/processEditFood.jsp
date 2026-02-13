<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.database.DAOs.FoodDAO" %>
<%
    int foodID = Integer.parseInt(request.getParameter("foodID"));
    String foodName = request.getParameter("foodName");
    double price = Double.parseDouble(request.getParameter("price"));
    String picturePath = request.getParameter("picturePath");

    try {
        FoodDAO foodDAO = new FoodDAO();
        boolean isUpdated = foodDAO.updateFood(foodID, foodName, price, picturePath);

        if (isUpdated) {
            out.println("<h3>Food item updated successfully!</h3>");
        } else {
            out.println("<h3>Failed to update food item. Try again.</h3>");
        }
        out.println("<a href='manageFood.jsp'>Back to Manage Food</a>");
    } catch (Exception e) {
        out.println("<h3>Error updating food item: " + e.getMessage() + "</h3>");
    }
%>
