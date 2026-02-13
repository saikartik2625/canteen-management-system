<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.database.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center><br><br>
    <link rel="stylesheet" type="text/css" href="styles.css" />

<table border=1>
    <tr>
        <th>QuestionID</th>
        <th>QuestionText</th>
        <th>CreatedDate</th>
        <th>Answer</th>
        
    </tr>
    <% 
	//Class.forName("com.mysql.cj.jdbc.Driver");

       // Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_db", "root", "admin");
 Connection conn=      DBConnection.getConnection();
       PreparedStatement stmt = conn.prepareStatement("SELECT * FROM questions");
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getString("QuestionID") %></td>
        <td><%= rs.getString("QuestionText") %></td>
        <td><%= rs.getString("CreatedDate") %></td>
      <td><a href="Answer.jsp" class="btn">Answer</a>
      </td>
    </tr>
    <% } %>
</table>
</center>
<br><br>
                   <div>
                     <a href="home.jsp"><b>BACK ClickHere</b></a>
                   </div>

</body>
</html>