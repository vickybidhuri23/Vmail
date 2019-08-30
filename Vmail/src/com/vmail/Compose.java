package com.vmail;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Compose extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection con;
		Statement st;
		PreparedStatement ps;
		ResultSet rs;
		String fromMail = "";
		
		HttpSession session = request.getSession();
		
		//Integer id = (Integer)session.getAttribute("dbid");
		fromMail = (String)session.getAttribute("fromMail");
	    
		String toMail = request.getParameter("toMail");  
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");
        
		ComposeBean ComBean = new ComposeBean();  
        ComBean.setToMail(toMail);  
        ComBean.setSubject(subject);  
        ComBean.setMessage(message); 
        ComBean.setFromMail(fromMail); 
        
        try {
        	con = DBConnection.getCon();
			st = con.createStatement();
			st.executeUpdate("DELETE FROM compose WHERE toMail is NULL");
			rs = st.executeQuery("SELECT max(id) FROM compose");
			int dbid = 0;
			
			if(rs.next()){
				dbid = rs.getInt(1);
				dbid++;
				//session.setAttribute("dbid",i);
				ComBean.setId(dbid); 
				}
			
			ps = con.prepareStatement("INSERT INTO compose(id, fromMail) values(?,?)");
			ps.setInt(1,dbid);
			ps.setString(2,fromMail);
			ps.executeUpdate();
		}
		catch(Exception e){
		System.out.println(e);
		}

        request.setAttribute("ComBean",ComBean); 
		
		int status = ComposeDao.sendMessage(ComBean);
       
		if(status!=0){
        	response.sendRedirect("userHome.jsp?m=pass");
        	}  
        else{  
            response.sendRedirect("compose.jsp?m=fail");
        	}
      
    }		
}