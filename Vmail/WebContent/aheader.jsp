<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="session.jsp"%>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="utf-8">
 <link rel="stylesheet" href="CSS/InboxStyle.css">
</head>
<body>

<div class="menu">
	<ul>
		<li><a href="adminHome.jsp">Home</a></li>
		<li><a href="userDetail.jsp">Users</a></li>
		<li><a href="backup.jsp">Backup</a></li>
		<li><a href="logOut.jsp">Logout</a></li>
		<li><a class = "uname" style="float:right"><%=session.getAttribute("uname")%></a></li>
	</ul>
</div>

<div class="row">
 <div class="column admin">
</div>
</div>
</body>
</html>