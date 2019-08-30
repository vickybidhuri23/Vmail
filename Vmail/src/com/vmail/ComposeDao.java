package com.vmail;

import java.sql.Connection;
import java.sql.PreparedStatement;
public class ComposeDao {
	
	// Compose
	public static int sendMessage(ComposeBean ComBean) {
		
	int status = 0;
	
	try {
		Connection conn = DBConnection.getCon();
    	//PreparedStatement ps = conn.prepareStatement("insert into compose(toMail,subject,message) values(?,?,?) WHERE id ='?'");
    	
    	PreparedStatement ps = conn.prepareStatement("UPDATE compose SET toMail= ?, subject=?, message=? WHERE id=?");
    	ps.setString(1, ComBean.getToMail());
        ps.setString(2, ComBean.getSubject()); 
        ps.setString(3, ComBean.getMessage());
        ps.setInt(4, ComBean.getId());
        status = ps.executeUpdate();
       } 
   	catch (Exception e) { 
    	System.out.println(e);
    	}
	return status;
	}
}