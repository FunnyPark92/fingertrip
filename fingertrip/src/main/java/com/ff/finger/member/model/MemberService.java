package com.ff.finger.member.model;

public interface MemberService {
	public int insertMember(MemberVO memberVo);
	public int processLogin(String id, String pwd);
	public String findId(MemberVO memberVo);
	public int findPwCnt(MemberVO memberVo);
	public int updatePw(MemberVO memberVo);
	public int memberOut(MemberVO memberVo);
	public int memberLogOut(String id);
	public boolean userCheckId(String id);
	public int emailAuth(String id);
	
}
