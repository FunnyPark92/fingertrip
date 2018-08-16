package com.ff.finger.cs.QnA.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ff.finger.common.SearchVO;

@Repository
public class QnADAOMybatis implements QnADAO {
	private String namespace="config.mybatis.mapper.oracle.qna.";
			
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<QnAVO> selectAll(SearchVO searchVo) {
		List<QnAVO> list=sqlSession.selectList(namespace+"selectAll",searchVo);
		return list;
	}

	@Override
	public int countUpdate(int qnaNo) {
		return sqlSession.update(namespace+"countUpdate", qnaNo);
	}

	@Override
	public String passck(int qnaNo) {
		return sqlSession.selectOne(namespace+"passck", qnaNo);
	}

	@Override
	public int QnAtotalRecord(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"QnAtotalRecord", searchVo);
	}

	@Override
	public QnAVO selectByNoOne(int qnaNo) {
		return sqlSession.selectOne(namespace+"selectByNoOne", qnaNo);
	}

	@Override
	public int reply(QnAVO qnAVo) {
		return sqlSession.insert(namespace+"reply", qnAVo);
	}

	@Override
	public int updateSortNo(int qnaNo) {
		return sqlSession.update(namespace+"updateSortNo", qnaNo);
	}

	@Override
	public int serchGroupNo(int qnaNo) {
		return sqlSession.selectOne(namespace+"serchGroupNo", qnaNo);
	}

	@Override
	public List<QnAVO> myWriteSelectAll(SearchVO searchVo) {
		List<QnAVO> list=sqlSession.selectList(namespace+"myWriteSelectAll",searchVo);
		return list;
	}

	@Override
	public int myWriteQnAtotalRecord(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"myWriteQnAtotalRecord", searchVo);
	}

	@Override
	public int qnADelete(int qnaNo) {
		return sqlSession.update(namespace+"qnADelete",qnaNo);
	}

	@Override
	public int qnaWrite(QnAVO qnAVo) {
		return sqlSession.insert(namespace+"qnaWrite", qnAVo);
	}

	@Override
	public QnAVO selectUp(int groupNo) {
		return sqlSession.selectOne(namespace+"selectUp", groupNo);
	}

	@Override
	public QnAVO selectDw(int groupNo) {
		return sqlSession.selectOne(namespace+"selectDw", groupNo);
	}

	@Override
	public int agencyReply(QnAVO qnAVo) {
		return sqlSession.insert(namespace+"agencyReply", qnAVo);
	}
}
