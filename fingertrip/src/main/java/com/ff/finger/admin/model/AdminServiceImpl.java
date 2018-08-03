package com.ff.finger.admin.model;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ff.finger.common.CommonConstants;

@Service
public class AdminServiceImpl implements AdminService {
	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);

	@Autowired
	private AdminDAO adminDao;
	
	@Override
	public int loginAdmin(String id,String pwd) {
		
		String dbPwd = adminDao.dbPwd(id);
		logger.info("pwd={} dbPwd={}",pwd,dbPwd);
		int result=0;
		if(dbPwd != null && !dbPwd.isEmpty()) {
			if(dbPwd.equals(pwd)) {
				result = CommonConstants.LOGIN_OK;
			}else {
				result = CommonConstants.PWD_MISMATCH;
			}
		}else {
			result = CommonConstants.ID_NONE;
		}
		logger.info("servise result={}",result);
		return result;
	}

}
