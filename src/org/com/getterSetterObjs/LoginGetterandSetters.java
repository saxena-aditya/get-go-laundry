package org.com.getterSetterObjs;


public class LoginGetterandSetters {
	public String username;
	public String pass;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}

	public LoginGetterandSetters(){
		setUsername(username);
		setPass(pass);
	}
	
}
