package com.ff.finger.travelAgency.model;

public class TravelAgencyVO {
	private int travelAgencyNo;
	private String name;
	private String id;
	private String password;
	private String hp;
	private String licenseNo;
	
	public int getTravelAgencyNo() {
		return travelAgencyNo;
	}
	public void setTravelAgencyNo(int travelAgencyNo) {
		this.travelAgencyNo = travelAgencyNo;
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
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getLicenseNo() {
		return licenseNo;
	}
	public void setLicenseNo(String licenseNo) {
		this.licenseNo = licenseNo;
	}
	
	@Override
	public String toString() {
		return "TravelAgencyVO [travelAgency=" + travelAgencyNo + ", name=" + name + ", id=" + id + ", password="
				+ password + ", hp=" + hp + ", licenseNo=" + licenseNo + "]";
	}

}
