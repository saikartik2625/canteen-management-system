<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");

    if (username == null || !"Admin".equals(role)) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>
<html>
<head>
    <title>Add Daily Questions</title>
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
        .form-container {
            width: 50%;
            margin: 50px auto;
            background-color: white;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-container label {
            display: block;
            margin-bottom: 10px;
        }
        .form-container input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-container button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .form-container button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <header>
        <h1>Add Daily Questions</h1>
        <p>Welcome, <strong><%= username %></strong>!</p>
        <a href="adminHome.jsp" class="btn">Back to Dashboard</a>
    </header>
    <main>
        <div class="form-container">
            <h2>Submit a New Question</h2>
            <form action="processAddQuestion.jsp" method="POST">
                <label for="question">Question:</label>
                <input type="text" id="question" name="question" placeholder="Enter your question here" required />
                <button type="submit">Add Question</button>
            </form>
        </div>
    </main>
</body>
</html>
