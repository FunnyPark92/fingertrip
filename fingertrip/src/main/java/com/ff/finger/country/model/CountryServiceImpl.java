package com.ff.finger.country.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CountryServiceImpl implements CountryService {

	@Autowired
	private CountryDAO countryDao;
	
	@Override
	public List<CountryVO> selectAllCountry() {
		return countryDao.selectAllCountry();
	}

	@Override
	public List<CountryVO> selectSomeCountry(int continentNo) {
		return countryDao.selectSomeCountry(continentNo);
	}

}
