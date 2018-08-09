package com.ff.finger.cs.faq.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class FaqDAOMybatis implements FaqDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.faq.";

	@Override
	public List<FaqVO> selectFaqCategory(int faqCategoryNo) {
		return sqlSession.selectList(namespace+"selectFaqCategory", faqCategoryNo);
	}

	@Override
	public List<Map<String, Object>> allFaqCategory(int faqCategoryNo){
		return sqlSession.selectList(namespace+"allFaqCategory",faqCategoryNo);
	}

}
