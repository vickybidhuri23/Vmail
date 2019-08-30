<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.vmail.DBConnection, java.sql.* "%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
	try {
	String id = request.getParameter("id");
	Connection con = DBConnection.getCon();
	PreparedStatement ps = con.prepareStatement("DELETE from register WHERE email = ?");
	ps.setString(1, id);
	ps.executeUpdate();
	response.sendRedirect("userDetail.jsp?du=deleted");
	}
	catch(Exception e) {
	System.out.println(e);
	}
%>
</body>
</html>