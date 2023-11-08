
<%@page import="org.springframework.ui.ModelMap"%>
<%@page import="com.ty.mvcproject.pojo.User"%>
<%@page import="com.ty.mvcproject.pojo.Batch"%>
<%@page import="com.ty.mvcproject.pojo.Attendance"%>
<%@page import="java.util.List"%>
<%@page import="com.ty.mvcproject.pojo.Image"%>
<%@page import="java.util.Base64"%>
<%@page import="java.io.OutputStream"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.ByteArrayInputStream"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
       .tab{
      margin: 0 auto;
      margin-top: 50px;
      width: 1000px;
    }
    body{
       height:800px;
       width:100%;
       background-image: linear-gradient(rgba(117, 112, 113, 0.4),rgba(204, 174, 130, 0.4)),url("https://tse1.mm.bing.net/th?id=OIP.ykPdVU5PxW5WN_qLMAXfYgHaFj&pid=Api&P=0&h=180");
       background-position: center;
       background-size: cover;
       background-repeat: no-repeat;
       overflow: y;
       background-attachment: fixed;
}
.msg{
       font-size: xx-large;
       color: #f60000;e
       
}
table {
	margin:0 auto;margin-top:30px; text-shadow:1px 1px 5px black;box-shadow:8px 8px 8px grey; 
	width: 900px;
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
th{
background-color: grey;
color:white;
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
    }else{
    
    %>
  <nav>
        <div class="container">
            <h1>Attendance Info</h1>
            <ul class="nav-links">                     
                <li><a href="batchinfo">Back</a></li>           
                <li><a href="logout">Log Out</a></li>
            </ul>
        </div>
    </nav>
<table border="1px solid black" style="width: 800px;">
	<%
	Batch batch=(Batch)request.getAttribute("batch");
	List<Attendance> ats=batch.getAttendances();
	if(ats!=null && ats.size()>0)
	{
	for(Attendance attendance:ats)
	{%>
	<tr>
	  <th> <i> ID</i></th>
	  <th><i>No. Of Student</i></th>
	  <th><i>Created DT</i></th>
	</tr>
	<tr>
	  <td><%=attendance.getId() %></td>
	  <td><%=attendance.getNoOfStudent() %></td>
	  <td><%=attendance.getCreatedDateTime() %></td>
	</tr>
	<tr> <td colspan="3" style="margin-top: 20px;margin-bottom: 20px;" > <center><i>Attendance Image</i></center> </td> </tr>
	<tr>
	<td colspan="3" height="300px" style="align-items: center;text-align: center;margin-top: 50px;" >
	<% 	
	Image image=attendance.getImage();	
	String base64Image = Base64.getEncoder().encodeToString(image.getImg());
	%>	
		IMG Id:-<%=image.getId()%> : <img style="height: 180px;" src="data:image/jpeg;base64, <%=base64Image%>"
			alt="Image" />	
	<%}
	}else{
	%></td>
	</tr>
	      <h1>Attendance Not Exist</h1> 
	<%} %>
	</table>
	<%} %>
</body>
</html>