package com.vmail;

import java.io.*;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Backup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
					
			try
			{
				File file = null;
				PrintWriter pw = null;
				Connection con = DBConnection.getCon();
				Statement st = con.createStatement();	
			    ResultSet rs =st.executeQuery("SELECT * FROM compose");
				while(rs.next())
				{
					file = new File("/Users/vicky/Software/eclipse-workspace/Vmail/Vmail_Extras/Backup/" + rs.getString(1));
					file.createNewFile();
					pw = new PrintWriter(file);
					pw.println(rs.getString(2));	
					pw.println(rs.getString(3));	
					pw.println(rs.getString(4));	
					pw.println(rs.getString(5));	
					pw.flush();
					pw.close();
				}
				response.sendRedirect("backup.jsp?id=succ");
			}
			catch(Exception e){
				System.out.println(e);
				}

		}

	}
