<%@ page import="com.database.DAOs.AuthDAO" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    AuthDAO authDAO = new AuthDAO();
    Integer userID = null;
    String role = null;

    try {
        userID = authDAO.getUserID(username, password);
        role = authDAO.getUserRole(username, password);
    } catch (Exception e) {
        e.printStackTrace();
    }

    if (userID != null && role != null) {
        session.setAttribute("username", username);
        session.setAttribute("userID", userID);
        session.setAttribute("role", role);

        if ("User".equals(role)) {
            response.sendRedirect("userHome.jsp");
        } else if ("Admin".equals(role)) {
            response.sendRedirect("adminHome.jsp");
        }
    } else {
        out.println("<h3>Invalid credentials. Please try again.</h3>");
        out.println("<a href='Login.jsp'>Back to Login</a>");
    }
%>
