package com.ff.finger.cs.faq.model;

import java.util.List;

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

}
