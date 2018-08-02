package com.ff.finger.admin.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAOMybatis implements AdminDAO {
	private String namespace = "config.mybatis.mapper.oracle.admin.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public String dbPwd(String id) {
		return sqlSession.selectOne(namespace+"dbPwd",id);
	}
	
	

}
