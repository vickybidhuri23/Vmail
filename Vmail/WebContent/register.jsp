<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<!DOCTYPE html>
<html>
<head>
   <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="utf-8">
   <title>Registration</title>
   <link rel="stylesheet" href="CSS/Style.css">
</head>
<body>

<div class="top">Vmail</div>
        <div class="box">
            <h2>Registration </h2>
             <form action="Registration" method="post"> 
                
                <div class="inputBox" >
                    <input type="text" name="name" maxlength="30" autocomplete="off" required>
                    <label id = "msg1">Name</label>
                </div>
                
                <div class="inputBox" >
                    <input type="text" name="userName" maxlength="30" autocomplete="off" required>
                    <label id = "msg2">Username</label>
                </div>
                
                <div class="inputBox" >
                    <input type="password" name="userPass" maxlength="30" required>
                    <label id = "msg3">Password</label>
                </div>
                
                <div class="inputBox" >
                    <input type="text" name="userEmail" maxlength="30" autocomplete="off" required>
                    <label id = "msg4">Email</label>
                </div>
                
                <div class="inputBox" >
                    <input type="text" name="userMobile" maxlength="10" autocomplete="off" required >
                    <label id = "msg5">Mobile</label>
                </div>
                <input type="submit" name="submit" value="Register">
            </form>
        </div>
        <div class="bottom1"><a href = "login.jsp">Cancel</a></div>
</body>
</html>