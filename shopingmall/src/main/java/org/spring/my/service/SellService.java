package org.spring.my.service;

import java.util.List;
import java.util.Map;

import org.spring.my.dto.Sell;
import org.spring.my.dto.SellBox;

public interface SellService {

	public void insert(Sell sell)throws Exception;

	public List<Map<String, Object>> selectList(String userid)throws Exception;

	public Map<String, Object> selectOne(int scode,String pcode) throws Exception;

	
	
	
	
	
	
	
	
	
	
	
	
}
