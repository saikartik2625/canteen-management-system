<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.database.DBConnection"%>
<%@ page import="com.database.DAOs.AuthDAO" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

     HttpSession hs=  request.getSession();
     hs.setAttribute("dbusername", username);
    hs.setAttribute("dbpassword", password);
  Connection conn=    DBConnection.getConnection();
    PreparedStatement pst=  conn.prepareStatement("select *from staff where username=? AND password=?");
     
    pst.setString(1, username);
    pst.setString(2, password);
   ResultSet rs= pst.executeQuery();
       while(rs.next()){
    	   
    	 String dbusername=  rs.getString("username");
    	 String dbpassword=  rs.getString("password");
    	 
    	 if(username.equals(dbusername) && password.equals(dbpassword))
    	 {
    		 response.sendRedirect("staffadmin.jsp");
       }
    	 else{
    		 out.print("<h2>Invalid credentials. Please try again</h2>");
    	 }
       
    
       
        out.println("<a href='stafflogin.jsp'>Back to Login</a>");
    }
%>
