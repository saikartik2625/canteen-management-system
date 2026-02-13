<%@page import="com.database.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");

    // Redirect to login if not an admin
    if (username == null || !"Admin".equals(role)) {
        response.sendRedirect("Login.jsp");
        return;
    }

    // Get the question from the form
    String question = request.getParameter("question");

    try {
        // Insert the question into the database
        Connection con = DBConnection.getConnection();
        String query = "INSERT INTO Questions (QuestionText) VALUES (?)";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, question);

        int rowsInserted = pstmt.executeUpdate();
        pstmt.close();
        con.close();

        if (rowsInserted > 0) {
            out.println("<h3>Question added successfully!</h3>");
        } else {
            out.println("<h3>Failed to add the question. Please try again.</h3>");
        }
    } catch (Exception e) {
        out.println("<h3>Error: " + e.getMessage() + "</h3>");
        e.printStackTrace();
    }
    out.println("<a href='addQuestions.jsp'>Add Another Question</a> | <a href='adminHome.jsp'>Back to Dashboard</a>");
%>
