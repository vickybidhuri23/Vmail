<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<%@ page import="com.vmail.DBConnection, java.sql.* "%>

<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="utf-8">
 <title>Sent</title>
 <link rel="stylesheet" href="CSS/InboxStyle.css">
</head>
<body>

<div class="header">
  <h2>Sent Mail</h2>
</div>

<%@ include file = "uheader.jsp" %>

	<div class="inbox">
		 <table id="tb1">
		  <tr>
		    <th>To</th>
		    <th>Subject</th> 
		    <th>Message</th>
		  </tr>
		  
	<%
	String ms,s = "";
	try {
		fromMail = (String)session.getAttribute("fromMail");
		ps = con.prepareStatement("SELECT * FROM compose WHERE toMail!='' AND fromMail = ?");
		ps.setString(1, fromMail);
        rs = ps.executeQuery();
        while(rs.next()) {
        s = rs.getString(1);
	%>
		  <tr>
		    <td><%=rs.getString("toMail")%></td>
		    <td><%=rs.getString("subject")%></td>
		    <td><a href="view.jsp?id=<%=rs.getString("id")%>">
		    <% 
		    
		    ms = rs.getString("message");
		    
		    try {
			out.println(ms.substring(0,20));
			}
			catch(Exception e){
				out.println(ms);
				}
			%> </a></td>
		  </tr>
	<%
		}
	}
	catch(Exception e){
	e.printStackTrace();
	}
	%> 
		</table>
	</div>   
</body>
</html>