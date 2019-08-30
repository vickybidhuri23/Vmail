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
	int id = Integer.parseInt(request.getParameter("id"));
	Connection con = DBConnection.getCon();
	PreparedStatement ps = con.prepareStatement("DELETE from compose WHERE id = ?");
	ps.setInt(1, id);
	ps.executeUpdate();
	response.sendRedirect("trash.jsp?df=complete");
	}
	catch(Exception e) {
	System.out.println(e);
	}
%>
</body>
</html>