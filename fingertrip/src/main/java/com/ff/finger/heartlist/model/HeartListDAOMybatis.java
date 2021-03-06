package com.ff.finger.heartlist.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ff.finger.common.PaginationInfo;

@Repository
public class HeartListDAOMybatis implements HeartListDAO {
	private String namespace = "config.mybatis.mapper.oracle.heartlist.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertHeartListUse(HeartListVO heartListVo) {
		return sqlSession.insert(namespace + "insertHeartListUse", heartListVo);
	}

	@Override
	public int insertHeartListCharge(HeartListVO heartListVo) {
		return sqlSession.insert(namespace + "insertHeartListCharge", heartListVo);
	}

	@Override
	public List<Map<String, Object>> selectHeartListByMemberNo(int memberNo) {
		return sqlSession.selectList(namespace + "selectHeartListByMemberNo", memberNo);
	}

	@Override
	public List<Map<String, Object>> selectHeartListByMemberNoWithPaging(PaginationInfo paginationInfo) {
		return sqlSession.selectList(namespace + "selectHeartListByMemberNoWithPaging", paginationInfo);
	}

	@Override
	public int getTotalRecord(int memberNo) {
		return sqlSession.selectOne(namespace + "getTotalRecord", memberNo);
	}
	
}
