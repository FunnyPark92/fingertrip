package com.ff.finger.member.model;

import java.sql.Timestamp;

public class MemberVO {
	private int memberNo; /* 회원번호 */
	private String name; /* 이름 */
	private String id; /* 아이디 */
	private String password; /* 비밀번호 */
	private String email1; /* 이메일1 */
	private String email2; /* 이메일2 */
	private String hp1; /* 전화번호1 */
	private String hp2; /* 전화번호2 */
	private String hp3; /* 전화번호3 */
	private String zipcode; /* 우편번호 */
	private String address; /* 주소 */
	private String addressDetail; /* 상세주소 */
	private String gender; /* 성별 */
	private String mailAgreement; /* 메일수신동의여부 DEFAULT 'N' */
	private String mailAuthen; /*이메일 인증 여부*/
	private int heartCount; /* 보유하트수 DEFAULT 10 */
	private Timestamp logoutDate; /* 로그아웃일자 */
	private Timestamp joinDate; /* 가입일 DEFAULT SYSDATE */
	private Timestamp outDate; /* 탈퇴일 */
	private int outReasonNo; /* 탈퇴사유번호 */
	
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
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
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getHp1() {
		return hp1;
	}
	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}
	public String getHp2() {
		return hp2;
	}
	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}
	public String getHp3() {
		return hp3;
	}
	public void setHp3(String hp3) {
		this.hp3 = hp3;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddressDetail() {
		return addressDetail;
	}
	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMailAgreement() {
		return mailAgreement;
	}
	public void setMailAgreement(String mailAgreement) {
		this.mailAgreement = mailAgreement;
	}
	public int getHeartCount() {
		return heartCount;
	}
	public void setHeartCount(int heartCount) {
		this.heartCount = heartCount;
	}
	public Timestamp getLogoutDate() {
		return logoutDate;
	}
	public void setLogoutDate(Timestamp logoutDate) {
		this.logoutDate = logoutDate;
	}
	public Timestamp getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Timestamp joinDate) {
		this.joinDate = joinDate;
	}
	public Timestamp getOutDate() {
		return outDate;
	}
	public void setOutDate(Timestamp outDate) {
		this.outDate = outDate;
	}
	public int getOutReasonNo() {
		return outReasonNo;
	}
	public void setOutReasonNo(int outReasonNo) {
		this.outReasonNo = outReasonNo;
	}
	public String getMailAuthen() {
		return mailAuthen;
	}
	public void setMailAuthen(String mailAuthen) {
		this.mailAuthen = mailAuthen;
	}
	
	@Override
	public String toString() {
		return "MemberVO [memberNo=" + memberNo + ", name=" + name + ", id=" + id + ", password=" + password
				+ ", email1=" + email1 + ", email2=" + email2 + ", hp1=" + hp1 + ", hp2=" + hp2 + ", hp3=" + hp3
				+ ", zipcode=" + zipcode + ", address=" + address + ", addressDetail=" + addressDetail + ", gender="
				+ gender + ", mailAgreement=" + mailAgreement + ", mailAuthen=" + mailAuthen + ", heartCount="
				+ heartCount + ", logoutDate=" + logoutDate + ", joinDate=" + joinDate + ", outDate=" + outDate
				+ ", outReasonNo=" + outReasonNo + "]";
	}
	
	
	
}
