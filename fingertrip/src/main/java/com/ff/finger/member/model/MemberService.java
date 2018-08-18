package com.ff.finger.member.model;

import java.util.List;
import java.util.Map;

import com.ff.finger.common.SearchVO;
import com.ff.finger.heartcharge.model.HeartChargeVO;

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
	public MemberVO selectMember(int memberNo);
	public List<MemberVO> selectAll(SearchVO searchVo);
	public int memberTotalRecord();
	public List<MemberVO> deleteSelectAll(SearchVO searchVo);
	public int deleteMemberTotalRecord();
	public List<Map<String, Object>> outLeason(int memberNo);
	public int adminDeleteMember(int memberNo);
	public int minusHeart(int memberNo);
	public int plusHeart(HeartChargeVO heartChargeVo);
	public int multiDelete(List<MemberVO> list);
	public int pressHeart(String id);
	public List<OutReasonVO> selectOutReason();
	public int selectOutReasonCount(int outReasonNo);
	public int selectMemberCnt();
	public int selectJoinCnt(String fDay);
	public int selectOutCnt(String fDay);
}
