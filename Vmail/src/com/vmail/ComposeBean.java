package com.vmail;

public class ComposeBean {
	
	private String fromMail,toMail,subject,message;
	private int id;

	public int getId() {  
	    return id;  
		}  
	  
	public void setId(int id) {  
	    this.id = id;  
		}  
	
	
	public String getFromMail() {  
	    return fromMail;  
		}  
	  
	public void setFromMail(String fromMail) {  
	    this.fromMail = fromMail;  
		}  
	
	public String getToMail() {  
	    return toMail;  
		}  
	  
	public void setToMail(String toMail) {  
	    this.toMail = toMail;  
		}  

	public String getSubject() {  
	    return subject;  
		}  
	  
	public void setSubject(String subject) {  
	    this.subject = subject;  
		}  
	  
	public String getMessage() {  
	    return message;  
		}  
	  
	public void setMessage(String message) {  
	    this.message = message;  
		}  
}
