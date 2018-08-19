package com.ff.finger.payment;

import java.util.List;
import java.util.Map;

public interface PaymentService {

	public int insertPayment(PaymentVO vo);
	public List<Map<String, Object>> selectAllPayment(int memberNo);
}
