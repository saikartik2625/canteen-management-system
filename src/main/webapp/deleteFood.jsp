<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.database.DAOs.FoodDAO" %>
<%
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");

    if (username == null || !"Admin".equals(role)) {
        response.sendRedirect("Login.jsp");
        return;
    }

    int foodID = Integer.parseInt(request.getParameter("foodID"));

    try {
        FoodDAO foodDAO = new FoodDAO();
        boolean isDeleted = foodDAO.deleteFood(foodID);

        if (isDeleted) {
            out.println("<h3>Food item deleted successfully!</h3>");
        } else {
            out.println("<h3>Failed to delete the food item. Please try again.</h3>");
        }
    } catch (Exception e) {
        out.println("<h3>Error deleting food item: " + e.getMessage() + "</h3>");
    }
    out.println("<a href='manageFood.jsp'>Back to Manage Food</a>");
%>
