package com.ff.finger.cs.notice.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ff.finger.common.SearchVO;

@Repository
public class NoticeDAOMybatis implements NoticeDAO{
	private String namespace="config.mybatis.mapper.oracle.qna.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<NoticeVO> selectAllNotice(SearchVO searchVO) {
		return sqlSession.selectList(namespace+"selectAllNotice", searchVO);
	}

	@Override
	public int totalRecord(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"totalRecord", searchVo);
	}
	
	@Override
	public int countUpdateNotice(int noticeNo) {
		return 0;
	}

}
