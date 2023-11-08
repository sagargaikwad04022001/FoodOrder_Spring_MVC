<%@page import="org.springframework.ui.ModelMap"%>
<%@page import="com.ty.mvcproject.pojo.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style type="text/css">
body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    height:800px;
background:url("https://businessfirstfamily.com/wp-content/uploads/2019/02/employee-management-software.jpg");
background-position: center;
background-size: cover;
background-repeat: no-repeat;
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


</style>
<body>
      <%
    User user11=(User) session.getAttribute("u");
    if(user11==null)
    {
    	RequestDispatcher dispatcher=request.getRequestDispatcher("login.jsp");

    	session.setAttribute("msg1", "Please Login To Access this field");
    	dispatcher.forward(request, response);
    }
    
    %>

       <nav>
        <div class="container">
            <h1>Welcome HR</h1>
            <ul class="nav-links">               
                <li><a href="allbatches">Batch Info</a></li>
                <li><a href="alltrainers">Trainer Info</a></li>                
                <li><a href="logout">Log Out</a></li>
            </ul>
        </div>
    </nav>
    
    <div class="a"></div>
    <%String msg=(String)request.getAttribute("msg");
     
      %>
      <div><center>
         <%if(msg!=null) {%>
           <div style="margin-top:50px; background-color: #F5E8B7;padding-top:50px; box-shadow:3px 3px 4px white; border-radius:25px;color: white;height: 50px;width:300px;font-size: 25px; font-family: Roboto,Arial, sans-serif;padding-top: 20px;"> <%=msg %> </div>
          <%} %>
          </center> </div>
</body>
</html>