package com.ff.finger.heart.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ff.finger.common.SearchVO;

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

}
