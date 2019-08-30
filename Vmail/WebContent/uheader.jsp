<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="session.jsp"%>
<%@page import="com.vmail.DBConnection,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="utf-8">
 <link rel="stylesheet" href="CSS/InboxStyle.css">
</head>


<%!
	Connection con;
	Statement st, st1,st2;
	PreparedStatement ps, ps1,ps2;
	ResultSet rs, rs1, rs2;
	String uname, fromMail;
	int count = 0;
%>

<%
try{
	
	uname = (String)session.getAttribute("uname");
	
	con = DBConnection.getCon();
	ps1 = con.prepareStatement("SELECT * FROM register where uname = ?");
	ps1.setString(1, uname);
	rs1 = ps1.executeQuery();
	while(rs1.next()) {
	fromMail = rs1.getString("email");
	session.setAttribute("fromMail", fromMail);
	}
	
	//st2 = con.createStatement();
	//rs2 = st2.executeQuery("SELECT COUNT(*) FROM compose WHERE toMail LIKE '%" + uname + "%' and mStatus='inbox' ");
	//ps2 = con.prepareStatement("SELECT COUNT(*) FROM compose WHERE toMail LIKE '%?%' and mStatus='inbox'");
	
	ps2 = con.prepareStatement("SELECT COUNT(*) FROM compose WHERE toMail = ? and mStatus='inbox'");
	ps2.setString(1, fromMail);
    rs2 = ps2.executeQuery();
    while(rs2.next()){
			 count =rs2.getInt(1);				
	}
%>	

<body>

<div class="menu">
	<ul>
		<li><a href="userHome.jsp">Home</a></li>
		<li><a href="logOut.jsp">Logout</a></li>
		<li><a class = "uname" style="float:right"><%=session.getAttribute("uname")%></a></li>
	</ul>
</div>

<div class="row">
  <div class="column side">
    	<ul>
		<li><a href="compose.jsp">Compose</a></li>
		<li><a href="inbox.jsp">Inbox <span>(<%=count%>)</span></a></li>
		<li><a href="sentMail.jsp" >Sent Mail</a></li>
		<li><a href="trash.jsp" >Trash</a></li>							
	</ul>
  </div>
  
<div class="column middle">
</div>
</div>

<%
   } 
	catch(Exception e){
	e.printStackTrace();
	}
%>
</body>
</html>