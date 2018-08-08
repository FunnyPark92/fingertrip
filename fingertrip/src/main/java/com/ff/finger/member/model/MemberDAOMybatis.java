package com.ff.finger.member.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ff.finger.common.SearchVO;
import com.ff.finger.heartcharge.model.HeartChargeVO;

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

	@Override
	public MemberVO logingMember(String id) {
		return sqlSession.selectOne(namespace+"logingMember",id);
	}

	@Override
	public List<MemberVO> selectAll(SearchVO searchVo) {
		List<MemberVO> list=sqlSession.selectList(namespace+"selectAll",searchVo);
		return list;
	}

	@Override
	public int memberTotalRecord() {
		return sqlSession.selectOne(namespace+"memberTotalRecord");
	}

	@Override
	public List<MemberVO> deleteSelectAll(SearchVO searchVo) {
		List<MemberVO> list=sqlSession.selectList(namespace+"deleteSelectAll",searchVo);
		return list;
	}

	@Override
	public int deleteMemberTotalRecord() {
		return sqlSession.selectOne(namespace+"deleteMemberTotalRecord");
	}

	@Override
	public List<Map<String, Object>> outLeason(int memberNo) {
		return sqlSession.selectList(namespace+"outLeason", memberNo);
	}

	@Override
	public int adminDeleteMember(int memberNo) {
		return sqlSession.update(namespace+"adminDeleteMember", memberNo);
	}

	@Override
	public int minusHeart(int memberNo) {
		return sqlSession.update(namespace + "minusHeart", memberNo);
	}

	@Override
	public int plusHeart(HeartChargeVO heartChargeVo) {
		return sqlSession.update(namespace + "plusHeart", heartChargeVo);
	}


}
