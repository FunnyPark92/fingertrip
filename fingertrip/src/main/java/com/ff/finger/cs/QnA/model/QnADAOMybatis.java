package com.ff.finger.cs.QnA.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QnADAOMybatis implements QnADAO {
	private String namespace="config.mybatis.mapper.oracle.qna.";
			
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<QnAVO> selectAll() {
		List<QnAVO> list=sqlSession.selectList(namespace+"selectAll");
		return list;
	}

	@Override
	public int countUpdate(int qnaNo) {
		return sqlSession.update(namespace+"countUpdate", qnaNo);
	}
}
