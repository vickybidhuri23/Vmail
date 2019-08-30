
package com.vmail;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;


public class LogIn extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		final Logger logger = LogManager.getLogger(LogIn.class);
		
		String uname = request.getParameter("userName");  
        String password = request.getParameter("userPass");
        String user = "none";
        
        LoginBean Bean = new LoginBean();  
        Bean.setUserName(uname);  
        Bean.setUserPass(password);  
        request.setAttribute("Bean",Bean); 
        
        logger.trace("Entering application.");
  
        user = LoginDao.validate(Bean); 
          
        if(user.equals("admin")){
        	logger.error("Admin Log.");
        	HttpSession session = request.getSession();
        	session.setAttribute("uname", Bean.getUserName());
        	response.sendRedirect("adminHome.jsp");
        	}  
        else if(user.equals("user")){
        	logger.error("User Log");
        	HttpSession session = request.getSession();
        	session.setAttribute("uname", Bean.getUserName());
        	response.sendRedirect("userHome.jsp");
            }  
        else{ 
        	response.sendRedirect("login.jsp?id1=fail");
        	}  
        logger.trace("Exiting application.");
    }
}