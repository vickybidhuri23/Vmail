<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout</title>
</head>
<body>
		<% 
		  request.getSession();
		  session.removeAttribute("uname");
		  session.invalidate();
		  response.sendRedirect("login.jsp?id3=logout");
		  %>
</body>
</html>