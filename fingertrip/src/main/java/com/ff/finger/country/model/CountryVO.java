package com.ff.finger.country.model;

public class CountryVO {
	private String countryCode;
	private String country;
	private int continentNo;
	
	public String getCountryCode() {
		return countryCode;
	}
	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public int getContinentNo() {
		return continentNo;
	}
	public void setContinentNo(int continentNo) {
		this.continentNo = continentNo;
	}
	
	@Override
	public String toString() {
		return "CountryVO [countryCode=" + countryCode + ", country=" + country + ", continentNo=" + continentNo + "]";
	}
	
}
