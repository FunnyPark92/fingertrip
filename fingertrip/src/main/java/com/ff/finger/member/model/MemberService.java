package com.ff.finger.member.model;

import java.util.List;
import java.util.Map;

import com.ff.finger.common.SearchVO;

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
	public int memberEdit(MemberVO memberVo);
	public MemberVO logingMember(String id);
	public List<MemberVO> selectAll(SearchVO searchVo);
	public int memberTotalRecord();
	public List<MemberVO> deleteSelectAll(SearchVO searchVo);
	public int deleteMemberTotalRecord();
	public List<Map<String, Object>> outLeason(int memberNo);
	public int adminDeleteMember(int memberNo);
	public int minusHeart(int memberNo);
	public int multiDelete(List<MemberVO> list);

}
