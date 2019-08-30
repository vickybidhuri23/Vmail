<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<%@ page import="com.vmail.DBConnection, java.sql.* "%>

<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="utf-8">
 <title>Trash</title>
 <link rel="stylesheet" href="CSS/InboxStyle.css">
</head>
<body>

<div class="header">
  <h2>Trash</h2>
</div>

<%
String df = request.getParameter("df");
if(df!=null && df.equalsIgnoreCase("complete")) {
out.println("<script>alert('Mail Completely Removed !!!'); </script>");
}
%>

<%@ include file = "uheader.jsp" %>

	<div class="inbox">
		 <table id="tb1">
		  <tr>
		    <th>From</th>
		    <th>Subject</th> 
		    <th>Message</th>
		    <th></th>
		    <th></th>
		    <th></th>
		  </tr>
		  
	<%
	String ms = "";
	try {
		fromMail = (String)session.getAttribute("fromMail");
		ps = con.prepareStatement("SELECT * FROM compose WHERE toMail = ? AND mStatus = 'trash' ");
		ps.setString(1, fromMail);
        rs = ps.executeQuery();
        while(rs.next()) {
	%>
		  <tr>
		    <td><%=rs.getString("fromMail")%></td>
		    <td><%=rs.getString("subject")%></td>
		    <td>
		    <% 
		    
		    ms = rs.getString("message");
		    
		    try {
			out.println(ms.substring(0,20));
			}
			catch(Exception e){
				out.println(ms);
				}
			%> </td>
		   <td><a href="restoreMail.jsp?id=<%=rs.getString("id")%>"><img src="Image/restore.png"></a></td>
		   <td><a href="deleteMailForever.jsp?id=<%=rs.getString("id")%>"><img src="Image/trash.png"></a></td>
		   <td> <%
				if(rs.getString("vStatus").equals("new")){
				out.println("<img src = Image/new.gif");
				}
				%>
		  </td>
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