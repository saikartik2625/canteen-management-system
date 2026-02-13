<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*, com.database.DBConnection" %>
<%
    String email = request.getParameter("email");
    String username = request.getParameter("username");
    String mobile = request.getParameter("mobile");
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirmPassword");
    String role = request.getParameter("role");

    if (!password.equals(confirmPassword)) {
        out.println("<h3>Passwords do not match!</h3>");
        out.println("<a href='register.jsp'>Back to Register</a>");
        return;
    }

    Connection con = null;
    PreparedStatement pstmt = null;
    try {
        con = DBConnection.getConnection();
        String query = "INSERT INTO Users (Email, Username, Mobile, Password, Role) VALUES (?, ?, ?, ?, ?)";
        pstmt = con.prepareStatement(query);
        pstmt.setString(1, email);
        pstmt.setString(2, username);
        pstmt.setString(3, mobile);
        pstmt.setString(4, password); // You can hash the password for added security
        pstmt.setString(5, role);

        int rows = pstmt.executeUpdate();
        if (rows > 0) {
            out.println("<h3>Account created successfully!</h3>");
            out.println("<a href='Login.jsp'>Go to Login</a>");
        } else {
            out.println("<h3>Failed to create account. Try again.</h3>");
            out.println("<a href='register.jsp'>Back to Register</a>");
        }
    } catch (SQLIntegrityConstraintViolationException e) {
        out.println("<h3>Error: Email or username already exists.</h3>");
        out.println("<a href='register.jsp'>Back to Register</a>");
    } catch (Exception e) {
        out.println("<h3>Error: " + e.getMessage() + "</h3>");
        out.println("<a href='register.jsp'>Back to Register</a>");
    } finally {
        if (pstmt != null) pstmt.close();
        if (con != null) con.close();
    }
%>
