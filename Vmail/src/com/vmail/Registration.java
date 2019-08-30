package com.vmail;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lambdaworks.crypto.SCryptUtil;

public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String uname = request.getParameter("userName");
		String pass = request.getParameter("userPass");
		String email = request.getParameter("userEmail");
		String mobile = request.getParameter("userMobile");
		
        LoginBean Bean = new LoginBean();  
        
        Bean.setName(name);  
        Bean.setUserName(uname);  
        Bean.setUserEmail(email);  
        Bean.setUserMobile(mobile);
        
        long startTime = System.nanoTime();
        
        // Scrypt Hashing S-Key
		
     		int N = 16384;
     	    int r = 8;
     	    int p = 1;
     		
     		String hash = SCryptUtil.scrypt(pass, N, r, p);	
     		System.out.println("SCrypt Hash : " + hash);
        
        Bean.setHash(hash);  
        
       // Getting Nonce
        
		   String nonce = AES.getNonce();
		   System.out.println("Nonce : " + nonce);
        
        Bean.setNonce(nonce);
        
        // AES encryption 
		
		  AES.setKey(hash);
		  String encPass = AES.encrypt(nonce);
		
		  long elapsedTime = System.nanoTime() - startTime;
		  System.out.println("AES Encrypted password : " + encPass);
          System.out.println("Execution Time of scrypt + AES (in NanoSec) " + elapsedTime);
        
        Bean.setUserPass(encPass);
        
	    request.setAttribute("Bean",Bean);  
		   
	    // Adding Users
          
		if(LoginDao.addUser(Bean)!=0){
			response.sendRedirect("register.jsp?id5=pass");
			
		}
		else{
			response.sendRedirect("register.jsp?id5=fail");
		}
	}
}