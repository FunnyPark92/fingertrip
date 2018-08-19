package com.ff.finger.payment;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDAOMybatis implements PaymentDAO{
private String namespace = "config.mybatis.mapper.oracle.payment.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertPayment(PaymentVO vo) {
		return sqlSession.insert(namespace+"insertPayment",vo);
	}
}
