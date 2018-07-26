package com.ff.finger.member.model;

public interface MemberDAO {
	public int insertMember(MemberVO memberVo);
	public String selectDbPwd(String id);
	public String findId(MemberVO memberVo);
	public int findPwCnt(MemberVO memberVo);
	public int updatePw(MemberVO memberVo);
	public int memberOut(MemberVO memberVo);
	public int memberLogOut(String id);
	public int userCheckId(String id);
}
