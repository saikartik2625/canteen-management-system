<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.database.DAOs.OrderDAO" %>
<%
    int orderID = Integer.parseInt(request.getParameter("orderID"));
    String status = request.getParameter("status");

    try {
        OrderDAO orderDAO = new OrderDAO();
        boolean isUpdated = orderDAO.updateOrderStatus(orderID, status);

        if (isUpdated) {
            out.println("<h3>Order status updated successfully!</h3>");
        } else {
            out.println("<h3>Failed to update order status. Please try again.</h3>");
        }
    } catch (Exception e) {
        out.println("<h3>Error updating order status: " + e.getMessage() + "</h3>");
    }
    out.println("<a href='viewOrders.jsp'>Back to Orders</a>");
%>
