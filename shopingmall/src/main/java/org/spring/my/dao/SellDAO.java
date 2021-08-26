package org.spring.my.dao;

import java.util.List;
import java.util.Map;

import org.spring.my.dto.Sell;
import org.spring.my.dto.SellBox;

public interface SellDAO {
	//결제 추가
	public void insert(Sell sell) throws Exception;
	//결제 수정//결제창을 수정
	public void update(Sell sell) throws Exception;
	//결제 전체 조회
	public List<Map<String, Object>> selectList(String userid) throws Exception;
	//결제 단일 조회
	public Map<String, Object> selectOne(int scode, String pcode) throws Exception;
	
	
	
}
 