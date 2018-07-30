package com.ff.finger.country.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CountryDAOMybatis implements CountryDAO {
	private String namespace = "config.mybatis.mapper.oracle.country.";

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<CountryVO> selectAllCountry() {
		return sqlSession.selectList(namespace + "selectAllCountry");
	}

	@Override
	public List<CountryVO> selectSomeCountry(int continentNo) {
		return sqlSession.selectList(namespace + "selectSomeCountry", continentNo);
	}

}
