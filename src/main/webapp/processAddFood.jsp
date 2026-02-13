<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.database.DAOs.FoodDAO" %>
<%
    // Ensure admin is logged in
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");

    if (username == null || !"Admin".equals(role)) {
        response.sendRedirect("Login.jsp");
        return;
    }

    // Get food details from the form
    String foodName = request.getParameter("foodName");
    double price = Double.parseDouble(request.getParameter("price"));
    String picturePath = request.getParameter("picturePath");

    try {
        // Add food item to the database
        FoodDAO foodDAO = new FoodDAO();
        boolean isAdded = foodDAO.addFood(foodName, price, picturePath);

        if (isAdded) {
            out.println("<h3>Food item added successfully!</h3>");
        } else {
            out.println("<h3>Failed to add food item. Please try again.</h3>");
        }
        out.println("<a href='manageFood.jsp'>Back to Manage Food</a>");
    } catch (Exception e) {
        out.println("<h3>Error adding food item: " + e.getMessage() + "</h3>");
        e.printStackTrace();
    }
%>
