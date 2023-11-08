<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="https://kit.fontawesome.com/35804de5f5.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="./font-awesome-4.7.0/font-awesome-4.7.0/css/font-awesome.css">
<style>
* {
	box-sizing: border-box;
}

.container1 {
	height: 800px;
	width: 100%;
	border: 1px solid;
	background:
		url("https://img.freepik.com/free-photo/executive-touching-icon-social-network_1232-158.jpg?w=996&t=st=1698472853~exp=1698473453~hmac=864be0575b8b9ecc0f14d618ec89598c5fbbb5c216d926dc6861204815f445d7");
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}

#page {
	margin: 0 auto;
	height: 400px;
	width: 300px;
	border: 1px solid;
	/* margin-left: 250px; */
	margin-top: 160px;
	border-radius: 20px;
	box-shadow: 4px 4px 4px;
	text-shadow: 2px 2px 2px white;
	margin-left: 1000px;
}

.circle {
	height: 30px;
	width: 30px;
	border: 1px solid;
	border-radius: 50%;
	display: inline-block;
	font-size: 20px;
	padding-left: 4px;
	padding-top: 3px;
}

.b {
	margin: 30px 10px 30px 45px;
}

input {
	background-color: transparent;
	border: none;
	outline: none;
	border-bottom: 1px solid;
	height: 30px;
}

#login {
	border: 1px solid;
	width: 60px;
	border-radius: 20px;
	background-color: #2874f0;
	margin-left: 120px;
	margin-top: 15px;
}

input:hover {
	border-radius: 25px;
	background-color: #d3d3d3;
}

#us {
	padding-left: 6px;
}

#a {
	margin-top: 70px;
}

#login:hover {
	scale: 1.2;
}

.msg {
	font-size: xx-large;
	color: #2874f0;
}

.imgicon {
	background:
		url("https://icon-library.com/images/employee-icon/employee-icon-20.jpg");
	height: 50px;
	width: 50px;
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	margin-top: 10px;
	margin-left: 125px;
}
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
</style>
</head>

<body>
	<nav style="box-shadow: 0 0 15px -3px white;">
		<div class="container" style="text-shadow: 2px 2px 5px grey;">
			<h1>HR Management app</h1>
			<ul class="nav-links">
				<li><a href="#">Contact us</a></li>
			</ul>
		</div>
	</nav>
	<%
	String msg1 = (String) session.getAttribute("msg1");
	%>
	<div class="container1">
		<center>
			<%
			if (msg1 != null) {
			%>
			<div
				style="margin-top: 50px; background-color: #00A9FF; padding-top: 50px; box-shadow: 3px 3px 4px white; border-radius: 25px; color: white; height: 100px; width: 300px; font-size: 25px; font-family: Roboto, Arial, sans-serif; padding-top: 20px;">
				<%=msg1%>
			</div>
			<%
			}
			%>
		</center>
		<%
		String msg = (String) request.getAttribute("msg");
		%>
		<div>
			<center>
				<%
				if (msg != null) {
				%>
				<div
					style="background-color: #F5E8B7; padding-top: 50px; box-shadow: 3px 3px 4px white; border-radius: 25px; color: white; height: 50px; width: 300px; font-size: 25px; font-family: Roboto, Arial, sans-serif; padding-top: 20px;">
					<%=msg%>
				</div>
				<%
				}
				%>
			</center>
		</div>
		<form action="login">
			<div id="page">
				<div class="imgicon"></div>
				<center>
					<h1>Login</h1>
				</center>
				<div id="a">
					<div id="email" class="b">
						<div class="circle">
							<i class="fa fa-envelope-o" aria-hidden="true"></i>
						</div>
						<input type="email" size="20px" name="user_email">
					</div>
					<div id="pass" class="b">
						<div class="circle">
							<i class="fa fa-key" aria-hidden="true"></i>
						</div>
						<input type="password" size="20px" name="user_pass">
					</div>
					<input style="padding-bottom: 10px; height: 20px;" id="login"
						type="submit" value="Login"> <br>
				</div>
			</div>
		</form>
	</div>
</body>

</html>