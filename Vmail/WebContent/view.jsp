<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.vmail.DBConnection, java.sql.* "%>

<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="utf-8">
 <title>View</title>
 <link rel="stylesheet" href="CSS/InboxStyle.css">
</head>
<body>

<div class="header">
  <h2>View Mail</h2>
</div>

<%@ include file = "uheader.jsp" %>
 
   <%
	
   int id = Integer.parseInt(request.getParameter("id"));
   
try {
	st = con.createStatement();
	st.executeUpdate("UPDATE compose SET vStatus='seen' WHERE id='"+id+"'" );
	rs = st.executeQuery("SELECT * FROM compose WHERE id='"+id+"'" );
	
	while(rs.next()){
	 %>
		<div class = "viewbox">
		<table id = "tb2">
		<tr>
		<td><div class = h>From</div></td>
		<td><div class = m><%=rs.getString("fromMail")%></div></td>
		</tr>
		
		<tr>
		<td><div class = h>Subject</div></td>
		<td><div class = m><%=rs.getString("subject")%></div></td>
		</tr>
		
		<tr>
		<td><div class = h>Message</div></td>
		<td><div class = "scroll"><%=rs.getString("Message")%></div></td>
		</tr>
		
	<%
		}
	} catch(Exception e){
	e.printStackTrace();
	}
	%>
</table>
</div>
</body>
</html>