<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.database.DAOs.OrderDAO" %>
<%
    // Ensure the user is logged in
    String username = (String) session.getAttribute("username");
    Integer userID = (Integer) session.getAttribute("userID");

    if (username == null || userID == null) {
        response.sendRedirect("Login.jsp"); // Redirect to login if session attributes are missing
        return;
    }

    try {
        // Retrieve form parameters
        int foodID = Integer.parseInt(request.getParameter("foodID"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double pricePerUnit = Double.parseDouble(request.getParameter("price"));
        double totalPrice = pricePerUnit * quantity;

        // Place the order
        OrderDAO orderDAO = new OrderDAO();
        boolean isOrderPlaced = orderDAO.placeOrder(userID, foodID, quantity, totalPrice);

        if (isOrderPlaced) {
            out.println("<h3>Order placed successfully!</h3>");
            out.println("<a href='menu.jsp'>Back to Menu</a>");
        } else {
            out.println("<h3>Failed to place the order. Please try again.</h3>");
            out.println("<a href='menu.jsp'>Back to Menu</a>");
        }
    } catch (NumberFormatException e) {
        out.println("<h3>Error: Invalid input data. Please check your order details.</h3>");
        out.println("<a href='menu.jsp'>Back to Menu</a>");
    } catch (Exception e) {
        out.println("<h3>An error occurred: " + e.getMessage() + "</h3>");
        e.printStackTrace();
    }
%>
