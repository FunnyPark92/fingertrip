package com.ff.finger.travelspot.model;

import com.ff.finger.course.model.CourseVO;

public class TravelSpotVO extends CourseVO {
	private int travelSpotNo; /* 여행지번호 NOT NULL*/
	private int day; /* 일차 NOT NULL*/
	private String city; /* 도시 NOT NULL*/
	private String travelSpot; /* 여행지 NOT NULL*/
	private String spotAddress; /* 여행지주소 NOT NULL*/
	private String img; /* 이미지 */
	private String travelContent; /* 설명 */
	private String latLng; /* 위도경도 NOT NULL*/
	private int dayNo; /* 일차번호 NOT NULL*/
	private String countryCode; /* 국가코드 NOT NULL*/
	
	public int getTravelSpotNo() {
		return travelSpotNo;
	}
	public void setTravelSpotNo(int travelSpotNo) {
		this.travelSpotNo = travelSpotNo;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getTravelSpot() {
		return travelSpot;
	}
	public void setTravelSpot(String travelSpot) {
		this.travelSpot = travelSpot;
	}
	public String getSpotAddress() {
		return spotAddress;
	}
	public void setSpotAddress(String spotAddress) {
		this.spotAddress = spotAddress;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getTravelContent() {
		return travelContent;
	}
	public void setTravelContent(String travelContent) {
		this.travelContent = travelContent;
	}
	public String getLatLng() {
		return latLng;
	}
	public void setLatLng(String latLng) {
		this.latLng = latLng;
	}
	public int getDayNo() {
		return dayNo;
	}
	public void setDayNo(int dayNo) {
		this.dayNo = dayNo;
	}
	public String getCountryCode() {
		return countryCode;
	}
	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}
	
	@Override
	public String toString() {
		return "TravelSpotVO [travelSpotNo=" + travelSpotNo + ", day=" + day + ", city=" + city + ", travelSpot="
				+ travelSpot + ", spotAddress=" + spotAddress + ", img=" + img + ", travelContent=" + travelContent
				+ ", latLng=" + latLng + ", dayNo=" + dayNo + ", countryCode=" + countryCode + ", toString()="
				+ super.toString() + "]";
	}
	
	
}
