package com.ff.finger.payment;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ff.finger.IamportRestClient.response.Payment;
import com.ff.finger.member.model.MemberDAO;
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
	
	
	
}
