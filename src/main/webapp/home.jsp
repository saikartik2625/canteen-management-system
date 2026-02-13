<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.database.DAOs.FoodDAO" %>
<%@ page import="com.database.Models.Food" %>
<%
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");
%>
<html>
<head>
    <title>Canteen Management - Home</title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }
        header {
            text-align: center;
            background-color: #ff9900;
            padding: 20px;
            color: white;
        }
        header h1 {
            margin: 0;
        }
        main {
            padding: 20px;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            margin: 10px;
            color: white;
            background-color: #007bff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .carousel {
            width: 80%;
            margin: 20px auto;
            overflow: hidden;
            border: 2px solid #ccc;
            border-radius: 10px;
        }
        .carousel img {
            width: 100%;
            display: block;
        }
        .carousel-container {
            display: flex;
            animation: slide 10s infinite;
        }
        @keyframes slide {
            0% { transform: translateX(0); }
            33% { transform: translateX(-100%); }
            66% { transform: translateX(-200%); }
            100% { transform: translateX(0); }
        }
        section {
            text-align: center;
            margin-top: 20px;
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 10px;
            background-color: #fff;
        }
        footer {
            text-align: center;
            padding: 20px;
            background-color: #333;
            color: white;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <header>
        <h1>Welcome to the Canteen Management System</h1>
       <% //if (username != null) { %>
           <!--  <p>Hello, <strong><%= username %></strong>! (Role: <%= role %>)</p>
            <a href="home.jsp" class="btn">Logout</a>  -->
        <% //} else { %>
            <a href="Login.jsp" class="btn">Admin/StudentLogin</a>
                        <a href="stafflogin.jsp" class="btn">StaffLogin</a>
            
            
            <a href="register.jsp" class="btn">Admin/StudentRegister</a>
                    <a href="viewQuestion.jsp" class="btn">ViewQuestions</a>
        
        
        <%// } %>
    </header>
    <hr />

    <!-- Image Carousel -->
    <div class="carousel">
        <div class="carousel-container">
            <img src="Gallery/th.jpg" width="300" height="300" alt=""/>
            <img src="Gallery/th2.jpg" width="300" height="300" alt=""/>
            <img src="Gallery/th3.jpg" width="300" height="300" alt=""/>
            <img src="Gallery/th.jpg"width="300" height="300" alt=""/>
            <img src="Gallery/th2.jpg"width="300" height="300" alt=""/>
            <img src="Gallery/th3.jpg"width="300" height="300" alt=""/>
   
        </div>
    </div>

    <main>
    
            <!-- For general users not logged in -->
            <section>
                <h2>Explore Our Menu</h2>
                <p>Please log in to place orders or provide feedback.</p>
                <a href="menu.jsp" class="btn">View Menu</a>
            </section>
                    
    </main>
    

    <footer>
        <hr />
        <p>&copy; <%= Calendar.getInstance().get(Calendar.YEAR) %>Developed by Kartik</p>
    </footer>
</body>
</html>
