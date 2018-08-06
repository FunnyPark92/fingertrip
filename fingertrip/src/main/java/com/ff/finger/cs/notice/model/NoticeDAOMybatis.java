package com.ff.finger.cs.notice.model;

import java.util.List;
import java.util.Map;

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
	public List<Map<String, Object>> selectAllNotice(SearchVO searchVO) {
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

	@Override
	public int noticeUpdate(NoticeVO noticeVo) {
		return sqlSession.update(namespace+"noticeUpdate", noticeVo);
	}

	@Override
	public int noticeDelete(int noticeNo) {
		return sqlSession.delete(namespace+"noticeDelete", noticeNo);
	}

	@Override
	public int deleteMulti(Map<String, String[]> map) {
		return sqlSession.delete(namespace+"deleteMulti", map);
	}

	@Override
	public String selectFileName(String noticeNo) {
		return sqlSession.selectOne(namespace+"selectFileName", noticeNo);
	}


	

}
