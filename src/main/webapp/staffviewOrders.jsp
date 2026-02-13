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
   <% HttpSession hs=  request.getSession();
   
   String username=(String)  hs.getAttribute("dbpassword");
   %>
       <link rel="stylesheet" type="text/css" href="styles.css" />
   
<center>
      <table border="1">
                <tr>
                    <th>Order ID</th>
                    <th>FoodID</th>
                    <th>Quantity</th>
                    <th>Total Price</th>
                    <th>StaffID</th>
                    <th>Status</th>
                    </tr>
                
                 <%
                 
                Connection conn=  DBConnection.getConnection();
             PreparedStatement pst=    conn.prepareStatement("select *from orders where staffId='1' ");
          ResultSet rs=   pst.executeQuery(); 
            
         while(rs.next()){ 
            	 
            	 
            	 %>
            	 <tr>
            	 <td><%=rs.getInt("OrderID") %></td>
            	            	 <td><%= rs.getInt("FoodID") %></td>
            	            	 <td><%= rs.getInt("Quantity") %></td>
            	            	 <td>$<%=rs.getFloat("TotalPrice") %></td>
            	            	 <td><%=rs.getString("staffId") %></td>
            	          	 <td><%=rs.getString("Status") %></td>
            	          	 </tr>
            	
           <% }%>  
             
             
                    
                    
                    
                    
                          </table>
                          <div>
                          <button> <a href="staffadmin.jsp">Back</a> </button>
                          </div>
     
</center>
             

</body>
</html>