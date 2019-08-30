<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="utf-8">
 <title>Compose</title>
 <link rel="stylesheet" href="CSS/InboxStyle.css">
</head>
<body>

<div class="header">
  <h2>Compose Mail</h2>
</div>

<%@ include file = "uheader.jsp" %>

<%
String m = request.getParameter("m");
if(m!=null && m.equalsIgnoreCase("fail")) {
out.println("<script>alert('Email not sent !!!'); </script>");
}
%>

<div class="box">
      <form action="Compose" method="post"> 
         <div class="inputBox" >
             <input type="email" name="toMail" autocomplete="off" required>
             <label>To</label>
         </div>
         <div class="inputBox">
             <input type="text" name="subject" required>
             <label>Subject</label>
         </div>
          <div class="inputBox">
             <textarea name="message" cols="133" rows="5" required ></textarea>
             <label>Message</label>
         </div>
         <input type="submit" name="submit" value="Send">
      </form>
</div>
</body>
</html>