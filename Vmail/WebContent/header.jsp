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


String id1=request.getParameter("id1");
String id2=request.getParameter("id2");
String id3=request.getParameter("id3");
String id4=request.getParameter("id4");
String id5=request.getParameter("id5");

if(id1!=null && id1.equalsIgnoreCase("fail")) {
out.println("<script>alert('Login Failed ! Invalid User Name or Password !')</script>");
}

else if(id2!=null && id2.equalsIgnoreCase("pass")) {
out.println("<script>alert('User successfully added !!')</script>");
}

else if(id3!=null && id3.equalsIgnoreCase("logout")) {
out.println("<script>alert('Log out successfully !!')</script>");
}

else if(id4!=null && id4.equalsIgnoreCase("exp")) {
out.println("<script>alert('Session Terminated !!')</script>");
}

else if(id5!=null && id5.equalsIgnoreCase("pass")) {
out.println("<script>alert('User Successfully Registered !!')</script>");
}

else if(id5!=null && id5.equalsIgnoreCase("fail")) {
out.println("<script>alert('User Already Exists !!')</script>");
}


%>

</body>
</html>