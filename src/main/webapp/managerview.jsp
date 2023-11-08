<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Beautiful Navbar</title>
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
background: url("https://img.freepik.com/free-photo/executive-touching-icon-social-network_1232-158.jpg?w=996&t=st=1698469563~exp=1698470163~hmac=c6e7b88af0c36ba6f1fb63fbefedde70822bec8a36c873fefaf3746d7aab98ce");

background-position: center;
background-size: cover;
background-repeat: no-repeat;
}
 
    
    </style>
</head>
<body>
    <nav>
        <div class="container">
            <h1>Welcome Manager</h1>
            <ul class="nav-links">
                <li><a href="">Home</a></li>
                <li><a href="allhr.jsp">View All HR</a></li>
                
                <li><a href="registration.jsp">Create HR</a></li>
               
                
                <li><a href="logout">Logout</a></li>
            </ul>
        </div>      
    </nav>
      <div class="a">
    
            <center style="background-color: transparent;">
       <%  String msg=(String) request.getAttribute("msg") ;
       if(msg!=null){
       %>
       
        <div style="background-color: #F5E8B7;padding-top:50px; box-shadow:3px 3px 4px white; border-radius:25px;color: white;height: 50px;width:300px;font-size: 25px; font-family: Roboto,Arial, sans-serif;padding-top: 20px;"> <%=msg %> </div>
       
        <%} %>
        </center>
    </div>
    
    
</body>
</html>
    