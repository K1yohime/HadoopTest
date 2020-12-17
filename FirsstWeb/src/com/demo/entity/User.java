package com.demo.entity;

public class User {
	protected String username;
	protected String password;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "User{" + "username='" + username + '\'' + ", password='"
				+ password + '\'' + '}';
	}

}
