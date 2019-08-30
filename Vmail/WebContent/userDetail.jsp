<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<%@ page import="com.vmail.DBConnection, java.sql.* "%>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="utf-8">
 <title>User Details</title>
 <link rel="stylesheet" href="CSS/InboxStyle.css">
</head>
<body>

<div class="header">
  <h2>User Details</h2>
</div>

<%@ include file = "aheader.jsp" %>

<div class="userdt">
	 <table id="tb1">
	  <tr>
	    <th>Name</th>
	    <th>Email</th> 
	    <th>Mobile</th>
	    <th></th>
	  </tr>

<%

String du = request.getParameter("du");
if(du!=null && du.equalsIgnoreCase("deleted")) {
out.println("<script>alert('User Deleted Successfully !'); </script>");
}

try {
	Connection con = DBConnection.getCon();
	PreparedStatement ps = con.prepareStatement("SELECT * from register" );
	ResultSet rs = ps.executeQuery();
	while(rs.next()){
 %>
		<tr>
		<td><%=rs.getString("name")%></td>
		<td><%=rs.getString("email")%></td>
		<td><%=rs.getString("mobile")%></td>
		<td><a href="deleteUser.jsp?id=<%=rs.getString("email")%>"><img src="Image/trash.png"></a></td>
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