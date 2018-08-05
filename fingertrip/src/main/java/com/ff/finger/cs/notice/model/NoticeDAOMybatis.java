package com.ff.finger.cs.notice.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ff.finger.common.SearchVO;

@Repository
public class NoticeDAOMybatis implements NoticeDAO{
	private String namespace="config.mybatis.mapper.oracle.notice.";
	
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
		return sqlSession.update(namespace+"countUpdateNotice", noticeNo);
	}

	@Override
	public int getNoticeRnum(int noticeNo) {
		return sqlSession.selectOne(namespace+"getNoticeRnum", noticeNo);
	}
	
	@Override
	public List<NoticeVO> noticeDetail(int noticeNo) {
		return sqlSession.selectList(namespace+"noticeDetail", noticeNo);
	}

	@Override
	public int getAdminNo(String id) {
		return sqlSession.selectOne(namespace+"getAdminNo", id);
	}

	@Override
	public int noticeInsert(NoticeVO noticeVo) {
		return sqlSession.insert(namespace+"noticeInsert",noticeVo);
	}

	@Override
	public NoticeVO noticeSelectByNo(int noticeNo) {
		return sqlSession.selectOne(namespace+"noticeSelectByNo", noticeNo);
	}

	

}
