package com.ff.finger.payment;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ff.finger.member.model.MemberServiceImpl;

@Service
public class PaymentServiceImpl implements PaymentService {
	public static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	@Autowired
	private PaymentDAO paymentDao;
	@Override
	public int insertPayment(PaymentVO vo) {
		return paymentDao.insertPayment(vo);
	}
	@Override
	public List<Map<String, Object>> selectAllPayment(int memberNo) {
		return paymentDao.selectAllPayment(memberNo);
	}
	
	
	
	
}
