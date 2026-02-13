<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Register - Canteen Management</title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <script>
        function validateForm() {
            let password = document.getElementById("password").value;
            let confirmPassword = document.getElementById("confirmPassword").value;

            if (password !== confirmPassword) {
                alert("Passwords do not match!");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <div class="form-container">
        <h2>Create an Account</h2>
        <form action="processRegister.jsp" method="POST" onsubmit="return validateForm();">
            <label>Email:</label>
            <input type="email" name="email" required /><br />

            <label>Username:</label>
            <input type="text" name="username" required /><br />

            <label>Mobile:</label>
            <input type="tel" name="mobile" pattern="[0-9]{10}" required 
                   placeholder="10-digit mobile number" /><br />

            <label>Password:</label>
            <input type="password" name="password" id="password" required /><br />

            <label>Confirm Password:</label>
            <input type="password" name="confirmPassword" id="confirmPassword" required /><br />

            <label>Role:</label>
            <select name="role">
                <option value="User">User</option>
                <option value="Admin">Admin</option>
            </select><br />

            <button type="submit">Register</button>
        </form>
        <p>Already have an account? <a href="Login.jsp">Login here</a></p>
                    <p align="right"><a href="Login.jsp">Back</a></p>
    
    </div>
</body>
</html>
