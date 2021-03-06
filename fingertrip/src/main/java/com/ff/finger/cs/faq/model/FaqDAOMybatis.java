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

	@Override
	public int getAdminNo(String id) {
		return sqlSession.selectOne(namespace+"getAdminNo", id);
	}

	@Override
	public int faqInsert(FaqVO faqVo) {
		return sqlSession.insert(namespace+"faqInsert",faqVo);
	}

	@Override
	public FaqVO faqSelectByNo(int faqNo) {
		return sqlSession.selectOne(namespace+"faqSelectByNo", faqNo);
	}

	@Override
	public int faqUpdate(FaqVO faqVo) {
		return sqlSession.update(namespace+"faqUpdate", faqVo);
	}

	@Override
	public int faqDelete(int faqNo) {
		return sqlSession.delete(namespace+"faqDelete", faqNo);
	}

	@Override
	public int deleteMulti(Map<String, String[]> map) {
		return sqlSession.delete(namespace+"deleteMulti", map);
	}

}
