<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<%
	response.addHeader("X-Frame-Options", "DENY"); 
	//response.setHeader("Content-Security-Policy", "default-src 'self'");
	response.setHeader("X-XSS-Protection", "1; mode=block");
	response.addHeader("X-Content-Type-Options", "nosniff");
	response.addHeader("Strict-Transport-Security", "max-age=31556926; www.vmail.com"); 
	response.setHeader("cache-control", "no-cache, no-store, must-revalidate, max-age=0, no-store");		// Prevent Back Button after logout
  

  String user = (String)session.getAttribute("uname");		// Session Management 
  if(user==null) {
		response.sendRedirect("login.jsp?id4=exp");
  }
  
  session.setMaxInactiveInterval(600);		// Session terminate after 10 min of inactivity
  
%>

</body>
</html>