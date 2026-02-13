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
    <link rel="stylesheet" type="text/css" href="styles.css" />

</head>
<body>
<center>
    <h2>Menu</h2>
    <table border="1">
        <tr>
            <th>Id</th>
            <th>Answers</th>
                   </tr>
   
    <%
   Connection conn=   DBConnection.getConnection();
   PreparedStatement pst=   conn.prepareStatement("select * from ans");
   ResultSet rs=   pst.executeQuery(); 
    
      while(rs.next()){
    	  %>	  
    	 <tr>
            <td><%= rs.getInt(1) %></td>
            <td><%= rs.getString(2) %></td>
        </tr>
    	  
  <%    } %>
   </table>
   
                      <p align="right"><a href="adminHome.jsp">Back</a></p>
                      
</center>

</body>
</html>