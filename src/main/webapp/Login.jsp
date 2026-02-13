<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<html>
<head>
    <title>Login - Canteen Management</title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body>
    <div class="form-container">
        <h2>Login</h2>
        <form action="validateUser.jsp" method="POST">
            <label>Username:</label>
            <input type="text" name="username" required /><br />
            <label>Password:</label>
            <input type="password" name="password" required /><br />
            <button type="submit">Login</button>
        </form>
        <p>Don't have an account? <a href="register.jsp">Register here</a></p>
      
    
    </div>
                <p align="right"><a href="home.jsp">Back</a></p>
    
</body>
</html>

</body>
</html>