package com.ff.finger.heart.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ff.finger.common.SearchVO;
import com.ff.finger.coupon.model.CouponDAO;

@Service
public class HeartServiceImpl implements HeartService{
	@Autowired
	private HeartDAO heartDao;
	
	@Override
	public List<Map<String, Object>> myCourseList(SearchVO searchVo) {
		return heartDao.myCourseList(searchVo);
	}

	@Override
	public int getTotalRecord(SearchVO searchVo) {
		return heartDao.getTotalRecord(searchVo);
	}

	@Override
	public int insertHeart(HeartVO heartVo) {
		return heartDao.insertHeart(heartVo);
	}
	
	@Override
	public List<HeartVO> selectByCourse(int courseNo) {
		return heartDao.selectByCourse(courseNo);
	}

	@Override
	public int countHeartMember(HeartVO heartvo) {
		return heartDao.countHeartMember(heartvo);
	}

	@Override
	public int updateCourseHeart(int courseNo) {
		return heartDao.updateCourseHeart(courseNo);
	}

	@Override
	public int countHeart200(int courseNo) {
		return heartDao.countHeart200(courseNo);
	}

	

}
