<%@page import="org.springframework.ui.ModelMap"%>
<%@page import="com.ty.mvcproject.pojo.User"%>
<%@page import="com.ty.mvcproject.pojo.Batch"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
   
   
<script src="https://kit.fontawesome.com/35804de5f5.js" crossorigin="anonymous"></script> 
    <link rel="stylesheet" href="./font-awesome-4.7.0/font-awesome-4.7.0/css/font-awesome.css">
<style type="text/css">
    .tab {
	margin: 0 auto;
	margin-top: 150px;
	width: 1000px;
}

body {
	height: 800px;
	width: 100%;
	background:
		url("https://tse1.mm.bing.net/th?id=OIP.ykPdVU5PxW5WN_qLMAXfYgHaFj&pid=Api&P=0&h=180");
	background-position: center;
	background-size: cover;
	background-repeat: no-repeat;
	overflow: y;
	background-attachment: fixed;
}

.msg {
	font-size: xx-large;
	color: #f60000;
	e
}

table {
	margin: 0 auto;
	margin-top: 50px;
	text-shadow: 1px 1px 5px red;
	box-shadow: 8px 8px 8px grey;
	width: 900px;
}
td:hover{
  filter: brightness(200%);
  
  
  background-color:white;
  color:black;
  border: 1px solid rgba(0, 0, 0, 0.1);
  border-radius: 50%;
  position: relative;
  transition: all 1s ease;
 
}

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
@media ( max-width : 768px) {
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
td:hover{
  filter: brightness(200%);
  
  
  background-color:white;
  color:black;
  border: 1px solid rgba(0, 0, 0, 0.1);
  border-radius: 50%;
  position: relative;
  transition: all 1s ease;
 
}
td{
  text-align: center;
}
</style>

</head>
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
            <h1>Welcome Trainer</h1>
            <ul class="nav-links">
            <li><a href="trainerview.jsp">Back</a></li>
                 <li><a href="batchinfo">Batch Info</a></li>
                <li><a href="logout">Logout</a></li>
            </ul>
        </div>      
    </nav> 
        
         <%
	String msg = (String) request.getAttribute("msg");
	User user = (User) session.getAttribute("trainer");
	%>
	<div><center>
         <%if(msg!=null) {%>
           <div style="background-color: #F5E8B7;padding-top:50px; box-shadow:3px 3px 4px white; border-radius:25px;color: white;height: 50px;width:300px;font-size: 25px; font-family: Roboto,Arial, sans-serif;padding-top: 20px;"> <%=msg %> </div>
          <%} %>
          </center> </div>
	
	<div class="tab">
		<center>
			<h1><u>Personal Info</u></h1>
		</center>
		<%
		if (user != null) {
			List<Batch> batches = user.getBatches();
		%>
		<table border="1px solid black" cellspacing="10" cellpadding="10">
			<tr>
				<th></th>
				<th>Id</th>
				<th>Empid</th>
				<th>Name</th>
				<th>Email</th>
				<th>Action</th>
			</tr>
			<tr>
				<td rowspan="3"> <img  alt="" src="https://icon-library.com/images/employee-icon/employee-icon-20.jpg" height="80px" width="80px"></td>
				<td><%=user.getId()%></td>
				<td><%=user.getEmployeeId()%></td>
				<td><%=user.getName()%></td>
				<td><%=user.getEmail()%></td>
				<td rowspan="3"></td>
			</tr>
			<tr>
				<th>Password</th>
				<th>Phone</th>
				<th>Role</th>
				<th>Status</th>
			</tr>
			<tr>
				<td><%=user.getPassword()%></td>
				<td><%=user.getPhoneNumber()%></td>
				<td><%=user.getRole()%></td>
				<%
				if (user.isStatus() == true) {
				%>
				<td>Active</td>
				<%
				} else {
				%>
				<td>Inactive</td>
				
			<%}
			}%>
				
			</tr>
		</table> 
</body>
</html>