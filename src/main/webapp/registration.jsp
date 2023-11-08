<%@page import="org.springframework.ui.ModelMap"%>
<%@page import="com.ty.mvcproject.pojo.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
     <script src="https://kit.fontawesome.com/35804de5f5.js" crossorigin="anonymous"></script> 
    <link rel="stylesheet" href="./font-awesome-4.7.0/font-awesome-4.7.0/css/font-awesome.css">
   <style>
    .bo{
        width: 100vw;
        height: 700px;;
        background-image: linear-gradient(rgba(117, 112, 113, 0.4),rgba(204, 174, 130, 0.4)),url("https://img.freepik.com/free-photo/executive-touching-icon-social-network_1232-158.jpg?w=996&t=st=1698469563~exp=1698470163~hmac=c6e7b88af0c36ba6f1fb63fbefedde70822bec8a36c873fefaf3746d7aab98ce");
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        margin-right: 100px;
        
    }
    .bod form{
         padding-top:30px;
    }
    .box{        
        max-width: 350px; 
        padding-top:50px;
        margin-left:900px;       
        background-color:transparent;
        padding :50px 40px 70px;
        text-align: center;
        border:1px solid black;
        border-radius: 20px;
        box-shadow: 4px 4px 6px grey ;
        text-shadow: 2px 2px 4px grey;
    }
    h1{
        font-size: 30px;
        margin-bottom: 15px;
        position: relative;
        color: #3c003c;
        margin-top:15px;
    }
    .inputfield{
        background-color:transparent;
        color:white;
        margin: 15px 0;
        border-radius: 3px;
        display: flex;
        align-items: center;
        padding-right: 10px;
    }
  .inputfield  input{
        width: 300px;
        background: transparent;
        color:black;
        
        border-left:none;
        border-right:none;
        border-top:none;
        border-botton: 1px solid black;
        outline: 0;
        padding: 13px 13px;
    }
    i{
        margin-left: 15px;
        color: #999;
    }
    .but{
        border-radius: 10px;
        color:black;
        background-color:#6499E9;
        text-align:center;
        margin-top:30px;
        padding-top:5px;
        color:black;
        height: 20px;
        width: 100px;

    }
    .but input{
      text-decoration: none;
      color:black;
      padding-bottom:7px;
      border:none;
      background: transparent;
    }
    .fa fa-key{
    background-color: transparent;
    color: grey;
    }
    .but:hover {
	scale:1.2;
}
    .msg{
       font-size: xx-large;
       color: #2874f0;
       
}
.inputfield input:hover {
	border-radius: 25px;
	background-color: #d3d3d3;
}
.abc{
height: 60px;
   width: 60px;
    background: url("https://icon-library.com/images/employee-icon/employee-icon-20.jpg");
   
   background-size: cover;
   background-position: center;
   background-repeat: no-repeat;
  
   margin-left: 150px;
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
    <div class="bo">
    <div class="bod">
     <center>
       <%  String msg=(String) request.getAttribute("msg") ;
       
       %>
         <center>
         <%if(msg!=null) {%>
           <div style="background-color: #F5E8B7;padding-top:50px; box-shadow:3px 3px 4px white; border-radius:25px;color: white;height: 50px;width:300px;font-size: 25px; font-family: Roboto,Arial, sans-serif;padding-top: 20px;"> <%=msg %> </div>
          <%} %>
          </center> 
      <form action="saveuser">
        <div class="box">
        <div class="abc"></div>
            <h1>Add Trainer</h1>          
                <div class="input">
                <div class="inputfield">
                        <i class="fa fa-user" aria-hidden="true"></i>
                        <input type="text" placeholder="emp id" name="user_empid">
                    </div>
                    <div class="inputfield">
                        <i class="fa fa-user" aria-hidden="true"></i>
                        <input type="text" placeholder="Name" name="user_name">
                    </div>
                    <div class="inputfield">
                       <i class="fa-solid fa-mobile-screen"></i>
                        <input type="text" placeholder="phone" name="user_phone">
                    </div>
                    <div class="inputfield">
                        <i class="fa fa-envelope-o" aria-hidden="true"></i>
                        <input type="email" placeholder="Email" name="user_email">
                    </div>
                    <div class="inputfield">
                        <i class="fa fa-key" aria-hidden="true"></i>
                        <input type="password" placeholder="Password" name="user_pass">
                    </div>  
                    <div class="inputfield">
                        
                        <input type="text" placeholder="role" name="user_role" value="Trainer"  hidden="true">
                    </div>  
                    <div class="inputfield">
                        
                        <input type="text" placeholder="status" name="user_status" value=true  hidden="true">
                    </div>               
                </div>
              <center> <div class="but">
                    <input type="submit" value="REGISTER"/>
                    
                </div>
                 <div style="padding-top: 20px;padding-bottom: 10px;"> <a href="hrview.jsp">Back</a> </div>
                </center>
                 </div>
            </form>
            </div>
       </div>   
</body>
</html>