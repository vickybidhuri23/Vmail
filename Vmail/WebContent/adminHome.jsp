<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="utf-8">
 <title>Admin</title>
 <link rel="stylesheet" href="CSS/InboxStyle.css">
</head>
<body>

<div class="header">
  <h2>Admin Home</h2>
</div>

<%@ include file = "aheader.jsp" %>

<div class="ahome">
 Welcome <%=session.getAttribute("uname")%> !!
 This is a admin home page.
</div>

</body>
</html>