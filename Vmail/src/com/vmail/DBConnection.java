package com.vmail;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class DBConnection {

	private static Connection con = null;  
	private static final String url = "jdbc:mysql://localhost:3306/vmailDB";
	
	//location of properties file, stored securely somewhere in the local system.
    private static final String file = "/Users/vicky/Software/eclipse-workspace/Vmail/Vmail_Extras/Database/config.properties";
    
	static{  
		
		try{  
		    FileReader reader = new FileReader(file);
            Properties props = new Properties();
            props.load(reader);
            
            // fetching database user name and pre-encoded password along with the encryption KEY from properties file
            final String dbUser = props.getProperty("user");                
            final String encPass = props.getProperty("encPass");
            String Key = props.getProperty("Key");
            
            // decrypting the database encoded password using the decoded KEY 
            AES.setKey(Key);
            String dbPass = AES.decrypt(encPass);
            
            // using the decrypted password for database connection
            props.put("user", dbUser);
            props.put("password", dbPass);
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, props);
 
		}catch(Exception e) {
			System.out.println(e);
			}  
	}  
	
public static Connection getCon(){  
	    return con;  
	}  
}
