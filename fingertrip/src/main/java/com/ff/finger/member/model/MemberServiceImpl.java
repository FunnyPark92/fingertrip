package com.ff.finger.member.model;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ff.finger.common.CommonConstants;
import com.ff.finger.common.SearchVO;
import com.ff.finger.heartcharge.model.HeartChargeVO;

@Service
public class MemberServiceImpl implements MemberService {
	public static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	@Autowired
	private MemberDAO memberDao;

	@Override
	public int insertMember(MemberVO memberVo) {
		return memberDao.insertMember(memberVo);
	}

	@Override
	public int processLogin(String id, String pwd) {
		String dbPwd = memberDao.selectDbPwd(id);
		int emailAuth = memberDao.checkMail(id);
		
		int result = 0;
		if (dbPwd != null && !dbPwd.isEmpty()) {
			if (dbPwd.equals(pwd)) {
				if (emailAuth == 1) {
					result = CommonConstants.EMAIL_AUTHENTICATION;
				} else { //로그인 성공 영역
					MemberVO memberVo = memberDao.logingMember(id);
					Timestamp logoutDate = memberVo.getLogoutDate();
					Timestamp today = new Timestamp(new Date().getTime());
					
					if (logoutDate != null && today.getTime() - logoutDate.getTime() >= 15552000000L) { //180일 == 15552000000L
						result = CommonConstants.LOGIN_OK_LONG_TERM_NOT_LOGIN;
					} else {
						result = CommonConstants.LOGIN_OK;
					}
				}
			} else {
				result = CommonConstants.PWD_MISMATCH;
			}
		} else {
			result = CommonConstants.ID_NONE;
		}
		
		return result;
	}

	@Override
	public String findId(MemberVO memberVo) {
		return memberDao.findId(memberVo);
	}

	@Override
	public int findPwCnt(MemberVO memberVo) {
		return memberDao.findPwCnt(memberVo);
	}
	
	@Override
	public int updatePw(MemberVO memberVo) {
		return memberDao.updatePw(memberVo);
	}

	@Override
	public int memberOut(MemberVO memberVo) {
		return memberDao.memberOut(memberVo);
	}

	@Override
	public int memberLogOut(String id) {
		return memberDao.memberLogOut(id);
	}

	@Override
	public boolean userCheckId(String id) {
		int result = memberDao.userCheckId(id);
		if(result>0) {
			return false; //아이디가 이미 존재
		}else {
			return true; // 사용 가능
		}
	}

	@Override
	public int emailAuth(String id) {
		return memberDao.emailAuth(id);
	}

	@Override
	public int memberEdit(MemberVO memberVo) {
		return memberDao.memberEdit(memberVo);
	}

	@Override
	public MemberVO logingMember(String id) {
		return memberDao.logingMember(id);
	}
	
	@Override
	public MemberVO selectMember(int memberNo) {
		return memberDao.selectMember(memberNo);
	}

	@Override
	public List<MemberVO> selectAll(SearchVO searchVo) {
		return memberDao.selectAll(searchVo);
	}

	@Override
	public int memberTotalRecord() {
		return memberDao.memberTotalRecord();
	}

	@Override
	public List<MemberVO> deleteSelectAll(SearchVO searchVo) {
		return  memberDao.deleteSelectAll(searchVo);
	}

	@Override
	public int deleteMemberTotalRecord() {
		return memberDao.deleteMemberTotalRecord();
	}

	@Override
	public List<Map<String, Object>> outLeason(int memberNo) {
		return memberDao.outLeason(memberNo);
	}

	@Override
	public int adminDeleteMember(int memberNo) {
		return memberDao.adminDeleteMember(memberNo);
	}
	
	@Override
	public int minusHeart(int memberNo) {
		return memberDao.minusHeart(memberNo);
	}
	
	@Override
	public int plusHeart(HeartChargeVO heartChargeVo) {
		return memberDao.plusHeart(heartChargeVo);
	}

	@Override
	public int multiDelete(List<MemberVO> list) {
		int cnt =0;
		try {
			for(MemberVO vo : list) {
				int memberNo = vo.getMemberNo();
				if(memberNo>0) {
					cnt = memberDao.adminDeleteMember(vo.getMemberNo());
				}
			}
		} catch (RuntimeException e) {
			cnt=-1;
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int pressHeart(String id) {
		return memberDao.pressHeart(id);
	}

	@Override
	public List<OutReasonVO> selectOutReason() {
		return memberDao.selectOutReason();
	}

	@Override
	public int selectOutReasonCount(int outReasonNo) {
		return memberDao.selectOutReasonCount(outReasonNo);
	}

	@Override
	public int selectMemberCnt() {
		return memberDao.selectMemberCnt();
	}

	@Override
	public int selectJoinCnt(String fDay) {
		return memberDao.selectJoinCnt(fDay);
	}

	@Override
	public int selectOutCnt(String fDay) {
		return memberDao.selectOutCnt(fDay);
	}

}
