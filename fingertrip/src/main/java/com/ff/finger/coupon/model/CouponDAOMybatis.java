package com.ff.finger.coupon.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CouponDAOMybatis implements CouponDAO {
	private String namespace = "config.mybatis.mapper.oracle.coupon.";
	
	private Logger logger = LoggerFactory.getLogger(CouponDAOMybatis.class);
	@Autowired SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, Object>> selectCouponView(String id) {
		logger.info(id);
		return sqlSession.selectList(namespace+"selectCouponView",id);
	}
	
	
}