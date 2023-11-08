<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Welcome</title>
    <style type="text/css">
/* Reset some default styles */
body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
}

/* Style the navigation bar */
nav {
    background-color: #333;
    color: #fff;
    padding: 10px 0;
    box-shadow: 0 0 15px -3px white;
}

.container {
    max-width: 1400px;
    margin: 0 auto;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 20px;
}

h1 {
    margin: 0;
    font-size: 24px;
}

/* Style the navigation links */
.nav-links {
    list-style-type: none;
    padding: 0;
    display: flex;
}

.nav-links li {
    margin: 0 15px;
    position: relative;
}

.nav-links a {
    text-decoration: none;
    color: #fff;
    font-size: 18px;
    transition: color 0.3s;
}

/* Hover effect */
.nav-links a:hover {
    color: #ff9900;
}

/* Add underline effect on hover */
.nav-links li::after {
    content: '';
    position: absolute;
    width: 0%;
    height: 2px;
    background-color: #ff9900;
    bottom: 0;
    left: 0;
    transition: width 0.3s ease-in-out;
}

.nav-links li:hover::after {
    width: 100%;
}

/* Mobile responsive */
@media (max-width: 768px) {
    .container {
        flex-direction: column;
        text-align: center;
    }

    .nav-links {
        margin-top: 20px;
    }

    .nav-links li {
        margin: 10px 0;
        position: relative;
    }
}
.a{
height:700px;
width:100%;
background: url("https://img.freepik.com/free-photo/businessman-blurred-background-with-people-connection-icon-business-leadership-chart_1258-123385.jpg?w=1380&t=st=1698472370~exp=1698472970~hmac=38e0b2378dee482501de6bae2d8795574de3c0535705bbb608db372a8433237e");

background-position: center;
background-size: cover;
background-repeat: no-repeat;
}
 
 .bb{
       height: 300px;
       width: 600px;
 }   
    </style>
</head>
<body>
    <nav style="box-shadow: 0 0 15px -3px white;">
        <div class="container" style="text-shadow: 2px 2px 5px grey;">
            <h1>HR Management  app</h1>
            <ul class="nav-links">
                <li><a href="">Home</a></li>
                <li><a href="login.jsp">Manager Login</a></li>
                <li><a href="login.jsp">Hr Login</a></li>
                <li><a href="login.jsp">Trainer Login</a></li>
                <li><a href="#">Contact us</a></li>
            </ul>
        </div>
    </nav>
    <div class="a">
            <div class="bb">
            
            </div>
    </div>
    
    
</body>
</html>
    