<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="utf-8">
 <title>Login</title>
 <link rel="stylesheet" href="CSS/Style.css">
</head>
<body>

<div class="top">Vmail</div>
        <div class="box">
            <h2>Login</h2>
             <form action="Login" method="post"> 
                <div class="inputBox" >
                    <input type="text" name="userName" autocomplete="off" required>
                    <label>User Name</label>
                </div>
                <div class="inputBox">
                    <input type="password" name="userPass" required>
                    <label>Password</label>
                </div>
                <input type="submit" name="submit" value="Sign In">
             </form>
    	</div>
    	<div class="bottom"><a href = "register.jsp">Register</a></div>
</body>
</html>