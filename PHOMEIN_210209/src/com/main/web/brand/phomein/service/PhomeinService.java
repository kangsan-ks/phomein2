package com.main.web.brand.phomein.service;

import java.util.Map;

public interface PhomeinService {

	Map<String, Object> getMobileNoToMilage(String mobileNo);

	Map<String, Object> getCardToMilage(String cardNo);
	
	Map<String , Object> mergeCardToMilage(Map<String, Object> paramMap) throws Exception;

}
