package com.vmail;

import java.sql.*;
import com.lambdaworks.crypto.SCryptUtil;

public class LoginDao {

// Authentication at the time of login
public static String validate(LoginBean Bean){
	
	String uname = null;
	String encPass = null;
	String decPass = null;
	String hash = null;
	String nonce = null;
	String roleDB = "";
	String user = "";
	
	
	try{
		Connection con = DBConnection.getCon();
		
		PreparedStatement ps = con.prepareStatement("SELECT * FROM register WHERE uname=?");
		ps.setString(1,Bean.getUserName());
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			uname = rs.getString(3);
			encPass = rs.getString(4);
			hash = rs.getString(7);
			nonce = rs.getString(8);
			roleDB = rs.getString(9);
			
			// SCrypt hash validation
			if(SCryptUtil.check(Bean.getUserPass(),hash)) {								
				
				// Setting Hash as key
				 AES.setKey(hash);
				 
				// Decrypting the final encoded password
		         decPass = AES.decrypt(encPass);	
		         
		        // Final authentication by comparing decoded value with actual nonce value
		         if(uname.equals(Bean.getUserName()) && decPass.equals(nonce) && roleDB.equals("admin")) {		
			 		user = "admin";
			 		}
		         else if(uname.equals(Bean.getUserName()) && decPass.equals(nonce) && roleDB.equals("user")) {		
				 		user = "user";
				 		}
			     else {
		 			user = "none";
		 			}    
		  	}
			else {
				user = "none";
				}
		}
	  } catch(Exception e){
		System.out.println(e);
		}
	
	return user;
}


// Register new user
public static int addUser(LoginBean Bean) {
	
int status = 0;

   try {
		Connection con1 = DBConnection.getCon();
	    PreparedStatement ps1 = con1.prepareStatement("SELECT * FROM register WHERE uname=?");
		ps1.setString(1,Bean.getUserName());
		ResultSet rs1 = ps1.executeQuery();
	     
		if(rs1.next()){
	    	 status = 0;
	    }
	    else {    
		Connection con2 = DBConnection.getCon();
    	PreparedStatement ps2 = con2.prepareStatement("INSERT INTO register(name,uname,password,email,mobile,hash,nonce) VALUES(?,?,?,?,?,?,?)");
        ps2.setString(1, Bean.getName());
        ps2.setString(2, Bean.getUserName()); 
        ps2.setString(3, Bean.getUserPass());
        ps2.setString(4, Bean.getUserEmail());
        ps2.setString(5, Bean.getUserMobile());
        ps2.setString(6, Bean.getHash());
        ps2.setString(7, Bean.getNonce());
        status = ps2.executeUpdate();
	    }
       } catch (Exception e) { 
    	System.out.println(e);
    	}
    
    return status;
	}
}

