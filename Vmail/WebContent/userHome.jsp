<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="utf-8">
 <title>User</title>
 <link rel="stylesheet" href="CSS/InboxStyle.css">
</head>
<body>

<div class="header">
  <h2>User Home</h2>
</div>

<%@ include file = "uheader.jsp" %>

<%
String m = request.getParameter("m");
if(m!=null && m.equalsIgnoreCase("pass")) {
out.println("<script>alert('Email successfully sent !!!'); </script>");
}
%>

<div class="uhome">
 Welcome <%=session.getAttribute("uname")%> !!
 This is a user home page.
</div>
</body>
</html>