<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<%@ page import="com.vmail.DBConnection, java.sql.* "%>

<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="utf-8">
 <title>Backup</title>
 <link rel="stylesheet" href="CSS/InboxStyle.css">
</head>
<body>
<div class="header">
  <h2>Back Mail Data</h2>
</div>

<%@ include file = "aheader.jsp" %>

<%
if(request.getParameter("id")!=null){
out.println("<script>alert('Backup Successful !!')</script>");
}

try {
	Connection con = DBConnection.getCon();
	Statement st = con.createStatement();	
	ResultSet rs = st.executeQuery("SELECT count(*) FROM compose");
	if(rs.next()) {
%>
	<div class="ahome">
  	<h1> Total Mails : <%=rs.getString(1)%> </h1>
	<%	
		}
	}
catch(Exception e){
System.out.println(e);
}
	%>

<form action="Backup" method="post">
	<div class="bottom2"><input type="submit" value="Backup"></div>
</form>
 
</div>

</body>
</html>