package com.ff.finger.member.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ff.finger.common.CommonConstants;
import com.ff.finger.common.SearchVO;
import com.ff.finger.heartcharge.model.HeartChargeVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDao;

	@Override
	public int insertMember(MemberVO memberVo) {
		return memberDao.insertMember(memberVo);
	}

	@Override
	public int processLogin(String id, String pwd) {
		String dbPwd = memberDao.selectDbPwd(id);
		int cnt = memberDao.checkMail(id);
		
		int result = 0;
		if (dbPwd != null && !dbPwd.isEmpty()) {
			if (dbPwd.equals(pwd)) {
				if(cnt == 1) {
					result = CommonConstants.EMAIL_AUTHENTICATION;
				}else {
					result = CommonConstants.LOGIN_OK;
				}
			}else {
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

	

}
