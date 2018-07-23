package com.ff.finger.member.model;

public interface MemberDAO {
	public int insertMember(MemberVO memberVo);
	public String selectDbPwd(String id);
}
