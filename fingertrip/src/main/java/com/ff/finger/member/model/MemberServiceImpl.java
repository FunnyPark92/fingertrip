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
	

}
