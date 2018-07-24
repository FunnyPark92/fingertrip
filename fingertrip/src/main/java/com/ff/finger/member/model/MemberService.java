package com.ff.finger.member.model;

public interface MemberService {
	public int insertMember(MemberVO memberVo);
	public int processLogin(String id, String pwd);
	public String findId(MemberVO memberVo);
}
