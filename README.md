# 🍽️ Canteen Management System

A web-based Canteen Management System developed using JSP, Servlets, and MySQL.  
The system allows Admin, Staff, and Students to manage food items, place orders, and handle canteen operations efficiently.

---

## 🚀 Tech Stack

- Java
- JSP (Java Server Pages)
- Servlets
- JDBC
- MySQL
- Apache Tomcat
- HTML
- CSS

---

## 📌 Features

### 👨‍💼 Admin
- Admin Login & Registration
- Add / Update / Delete Food Items
- View Orders
- Manage Questions & Answers

### 👩‍🍳 Staff
- Staff Login
- Manage Orders
- Update Order Status

### 🎓 Student
- Student Registration & Login
- View Menu
- Place Orders
- View Questions & Provide Answers

---

## 📂 Project Structure
```
collegeManagment/
collegeManagment/
│
├── src/
│ ├── com.database/
│ ├── com.database.DAOs/
│ ├── com.database.Models/
│
├── WebContent/
│ ├── home.jsp
│ ├── Login.jsp
│ ├── register.jsp
│ ├── menu.jsp
│ ├── stafflogin.jsp
│ ├── viewQuestion.jsp
│ ├── styles.css
│
├── pom.xml
└── README.md

```
---

## 🛠️ How to Run the Project

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/saikartik2625/canteen-management-system.git

2️⃣ Import into Eclipse

Open Eclipse

File → Import

Existing Projects into Workspace

Select project folder

3️⃣ Configure Database

Create MySQL database:

CREATE DATABASE canteen_db;


Update your DBConnection.java file:

String url = "jdbc:mysql://localhost:3306/canteen_db";
String username = "root";
String password = "your_password";

4️⃣ Deploy on Tomcat

Add Apache Tomcat Server in Eclipse

Right click project → Run on Server

🗄️ Database Tables

Users

Food

Orders

Staff

Questions

Answers

🎯 Project Objective

To digitize and automate the canteen ordering and management process, reducing manual errors and improving efficiency.

👨‍💻 Author

Kartik


