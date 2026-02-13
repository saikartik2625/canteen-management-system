<%@ page import="java.sql.*" %>
<%
    String ans = request.getParameter("ans");
    String qid = request.getParameter("QuestionID");

    if(ans == null || qid == null || ans.trim().equals("") || qid.trim().equals("")) {
        out.println("<h3>Error: QuestionID or Answer is missing!</h3>");
        return;
    }

    Connection con = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/canteen_db?useSSL=false&serverTimezone=UTC",
            "root",
            "root"
        );

        String query = "INSERT INTO ans (QuestionID, ans) VALUES (?, ?)";
        pstmt = con.prepareStatement(query);

        pstmt.setInt(1, Integer.parseInt(qid));
        pstmt.setString(2, ans);

        int rows = pstmt.executeUpdate();

        if(rows > 0){
            response.sendRedirect("getans.jsp");   // Redirect after success
        } else {
            out.println("<h3>Failed to store answer!</h3>");
        }

    } catch(Exception e){
        out.println("<h3>Error: " + e.getMessage() + "</h3>");
    } finally {
        try {
            if(pstmt != null) pstmt.close();
            if(con != null) con.close();
        } catch(Exception ex) {}
    }
%>
