package com.ff.finger.member.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOMybatis implements MemberDAO {
	private String namespace = "config.mybatis.mapper.oracle.member.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertMember(MemberVO memberVo) {
		return sqlSession.insert(namespace + "insertMember", memberVo);
	}

	@Override
	public String selectDbPwd(String id) {
		return sqlSession.selectOne(namespace + "selectDbPwd", id);
	}

	@Override
	public String findId(MemberVO memberVo) {
		return sqlSession.selectOne(namespace+"findId", memberVo);
	}

	@Override
	public int findPwCnt(MemberVO memberVo) {
		return sqlSession.selectOne(namespace+"findPwCnt",memberVo);
	}
	
	@Override
	public int updatePw(MemberVO memberVo) {
		return sqlSession.update(namespace+"updatePw", memberVo);
	}

	@Override
	public int memberOut(MemberVO memberVo) {
		return sqlSession.update(namespace+"memberOut", memberVo);
	}

	@Override
	public int memberLogOut(String id) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+"memberLogOut",id);
	}

	@Override
	public int userCheckId(String id) {
		return sqlSession.selectOne(namespace+"userCheckId",id);
	}

	@Override
	public int emailAuth(String id) {
		return sqlSession.update(namespace+"emailAuth",id);
	}

	@Override
	public int checkMail(String id) {
		return sqlSession.selectOne(namespace+"checkMail",id);
	}

	@Override
	public int memberEdit(MemberVO memberVo) {
		return sqlSession.update(namespace+"memberEdit", memberVo);
	}

	
	

}
