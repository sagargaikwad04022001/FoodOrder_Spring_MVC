<%@page import="org.springframework.ui.ModelMap"%>
<%@page import="com.ty.mvcproject.pojo.User"%>
<%@page import="java.util.List"%>
<%@page import="com.ty.mvcproject.repository.UserDao"%>
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
    .tab{
      margin: 0 auto;
      margin-top: 150px;
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
	margin:0 auto;margin-top:50px; text-shadow:1px 1px 5px black;box-shadow:8px 8px 8px grey; 
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
td{
  text-align: center;
}
td:hover{
  filter: brightness(90%);
  
  
  background-color:white;
  color:black;
  border: 1px solid rgba(0, 0, 0, 0.1);
  border-radius: 50%;
  position: relative;
  transition: all 1s ease;
 
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
            <h1>Welcome HR</h1>
            <ul class="nav-links">               
                <li> <form action="gettrainer"> <input style="border-radius: 15px;" type="text" name="user_id" placeholder="user id"> <input style="border-radius: 15px;" type="submit" value="View Trainer"> </form></li>
                <li><a href="allbatches">Batch Info</a></li>  
                <li><a href="registration.jsp">Create Trainer</a></li>    
                <li><a href="hrview.jsp">Back</a></li>            
                <li><a href="logout">Log Out</a></li>
            </ul>
        </div>
    </nav>
    
      <%String msg=(String)request.getAttribute("msg");
      List<User> users=(List<User>)request.getAttribute("list");
      %>
          <div><center>
         <%if(msg!=null) {%>
           <div style="background-color: #F5E8B7;padding-top:50px; box-shadow:3px 3px 4px white; border-radius:25px;color: white;height: 50px;width:300px;font-size: 25px; font-family: Roboto,Arial, sans-serif;padding-top: 20px;"> <%=msg %> </div>
          <%} %>
          </center> </div>
         <div class="tab">
       <center>  <h1> Trainers</h1></center>
         <%if(users!=null && users.size()>0){ %>
        <table border="1px solid black" cellspacing="15" cellpadding="15">
        <%for(User user:users){ %>
			<tr>
				<th></th>
				<th>Id</th>
				<th>Empid</th>
				<th>Name</th>
				<th>Email</th>
				<th>Action</th>
			</tr>
			<tr>
				<td rowspan="3"> <img  alt="" src="https://icon-library.com/images/employee-icon/employee-icon-15.jpg" height="80px" width="80px"></td>
				<td><%=user.getId()%></td>
				<td><%=user.getEmployeeId()%></td>
				<td><%=user.getName()%></td>
				<td><%=user.getEmail()%></td>
				 <td rowspan="3"><a href="updatetrainer?id=<%=user.getId() %>"><i style="color:green;padding-right: 5px;box-shadow: 2px 2px 4px white;" class="fa-regular fa-pen-to-square"></i></a> 
				       <form action="batchsave"
			style="margin-top: 10px; border: 1px solid black; box-shadow: 2px 2px 5px white; width: 180px; height: 80px; border-radius: 25px;">
			<input style="border-radius: 15px; margin-top: 20px;" type="text"
				name="batch_subject" placeholder="subject name"><br>
			<input  style="border-radius: 15px; margin-top: 10px;" type="hidden"
				name="user_id" placeholder="user id" value="<%=user.getId() %>" ><br> <input
				style="border-radius: 15px; margin-top: 10px;" type="submit"
				value="Create Batch">
		</form> </td>
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
				<%
				}
				%>
			</tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<%} %>

		</table>
           <%}else{ %>
                <h1>No Trainers Found</h1>
           <%} %>
         
           
         </div>  
</body>
</html>