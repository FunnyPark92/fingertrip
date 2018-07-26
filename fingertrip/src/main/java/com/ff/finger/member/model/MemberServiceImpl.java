package com.ff.finger.member.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ff.finger.common.CommonConstants;


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
		
		int result = 0;
		if (dbPwd != null && !dbPwd.isEmpty()) {
			if (dbPwd.equals(pwd)) {
				result = CommonConstants.LOGIN_OK;
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



}
