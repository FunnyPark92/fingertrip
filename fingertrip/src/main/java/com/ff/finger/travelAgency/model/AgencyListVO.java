package com.ff.finger.travelAgency.model;

import java.util.List;

public class AgencyListVO {
	private List<TravelAgencyVO> agencyItems;

	
	@Override
	public String toString() {
		return "AgencyListVO [agencyItems=" + agencyItems + "]";
	}

	public List<TravelAgencyVO> getAgencyItems() {
		return agencyItems;
	}

	public void setAgencyItems(List<TravelAgencyVO> agencyItems) {
		this.agencyItems = agencyItems;
	}
	
	
}
