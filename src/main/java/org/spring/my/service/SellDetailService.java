package org.spring.my.service;

import java.util.List;
import java.util.Map;

import org.spring.my.dto.SellBox;
import org.spring.my.dto.SellDetail;

public interface SellDetailService {
	public void insert(int scode, String userid, List<Integer> sbcodelist) throws Exception;
	
	

}
