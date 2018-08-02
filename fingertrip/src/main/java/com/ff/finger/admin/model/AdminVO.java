package com.ff.finger.admin.model;

import java.sql.Timestamp;

public class AdminVO {
	private int adminNo;
	private String name;
	private String id;
	private String password;
	private Timestamp regDate;
	private String adminCode;
	
	public int getAdminNo() {
		return adminNo;
	}
	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public String getAdminCode() {
		return adminCode;
	}
	public void setAdminCode(String adminCode) {
		this.adminCode = adminCode;
	}
	
	@Override
	public String toString() {
		return "AdminVO [adminNo=" + adminNo + ", name=" + name + ", id=" + id + ", password=" + password + ", regDate="
				+ regDate + ", adminCode=" + adminCode + "]";
	}
	
	
	
	
	
}
