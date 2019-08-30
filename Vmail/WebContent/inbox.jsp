<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>

<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="utf-8">
 <title>Inbox</title>
</head>
<body>

<div class="header">
  <h2>Inbox</h2>
</div>

<%@ include file = "uheader.jsp" %>

	<div class="inbox">
		 <table id="tb1">
		  <tr>
		    <th>From</th>
		    <th>Subject</th> 
		    <th>Message</th>
		    <th></th>
		    <th></th>
		  </tr>
		  
	<%
	String ms = "";
	try {
		
		fromMail = (String)session.getAttribute("fromMail");
		ps = con.prepareStatement("SELECT * FROM compose WHERE toMail = ? AND mStatus = 'inbox' ");
		ps.setString(1, fromMail);
        rs = ps.executeQuery();
        while(rs.next()) {
	%>
		  <tr>
		    <td><%=rs.getString("fromMail")%></td>
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
		   <td><a href="deleteMail.jsp?id=<%=rs.getString("id")%>"><img src="Image/trash.png"></a></td>
		   <td> <%
				if(rs.getString("vStatus").equals("new")){
				out.println("<img src = Image/new.gif>");
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