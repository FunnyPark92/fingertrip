package com.ff.finger.country.model;

import java.util.List;

public interface CountryDAO {
	public List<CountryVO> selectAllCountry();
	public List<CountryVO> selectSomeCountry(int continentNo);
}
