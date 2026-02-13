<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.database.DAOs.OrderDAO" %>
<%@ page import="com.database.Models.Order" %>
<%
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");
    Integer userID = (Integer) session.getAttribute("userID"); // UserID for filtering user-specific orders

    String staffId = (String) session.getAttribute("dbusername");

    if (username == null || role == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    OrderDAO orderDAO = new OrderDAO();
    List<Order> orderList = new ArrayList<>();
    try {
        if ("Admin".equals(role)) {
            orderList = orderDAO.getAllOrders(); // Fetch all orders for admin
        } else if ("User".equals(role)) {
            orderList = orderDAO.getOrdersByUserID(userID); // Fetch only the user's orders
        } else {
            out.println("<h3>Unauthorized access. Please log in with a valid account.</h3>");
            response.sendRedirect("login.jsp");
            return;
        }
    } catch (Exception e) {
        out.println("<h3>Error fetching orders: " + e.getMessage() + "</h3>");
    }
%>
<html>
<head>
    <title>Orders Management</title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body>
    <header>
        <h1><%= "Admin".equals(role) ? "Admin Dashboard - Manage Orders" : "Your Orders" %></h1>
        <p>Welcome, <strong><%= username %></strong>!</p>
        <a href="<%= "Admin".equals(role) ? "adminHome.jsp" : "userHome.jsp" %>" class="btn">
            <%= "Admin".equals(role) ? "Back to Dashboard" : "Back to Home" %>
        </a>
        <a href="home.jsp" class="btn">Logout</a>
    </header>
    <hr />

    <main>
        <h2><%= "Admin".equals(role) ? "All Orders" : "Your Orders" %></h2>
        <% if (orderList.isEmpty()) { %>
            <p>No orders found.</p>
        <% } else { %>
            <table>
                <tr>
                    <th>Order ID</th>
                    <% if ("Admin".equals(role)) { %>
                        <th>User ID</th>
                    <% } %>
                    <th>Quantity</th>
                    <th>Total Price</th>
                    <th>Status</th>
                    <% if ("Admin".equals(role)) { %>
                        <th>Actions</th>
                    <% } %>
                </tr>
                <% for (Order order : orderList) { %>
                <tr>
                    <td><%= order.getOrderID() %></td>
                    <% if ("Admin".equals(role)) { %>
                        <td><%= order.getUserID() %></td>
                    <% } %>
                    <td><%= order.getQuantity() %></td>
                    <td>$<%= order.getTotalPrice() %></td>
                    
                    <td><%= order.getStatus() %></td>
                    <% if ("Admin".equals(role)) { %>
                        <td>
                            <form action="updateOrderStatus.jsp" method="POST">
                                <input type="hidden" name="orderID" value="<%= order.getOrderID() %>" />
                                <select name="status">
                                    <option value="Pending" <%= "Pending".equals(order.getStatus()) ? "selected" : "" %>>Pending</option>
                                    <option value="Accepted" <%= "Accepted".equals(order.getStatus()) ? "selected" : "" %>>Accepted</option>
                                    <option value="Delivered" <%= "Delivered".equals(order.getStatus()) ? "selected" : "" %>>Delivered</option>
                                </select>
                                <button type="submit" class="btn">Update</button>
                            </form>
                        </td>
                    <% } %>
                </tr>
                <% } %>
            </table>
        <% } %>
    </main>

    <footer>
        <hr />
        <p>&copy; <%= Calendar.getInstance().get(Calendar.YEAR) %> Canteen Management System</p>
    </footer>
</body>
</html>
