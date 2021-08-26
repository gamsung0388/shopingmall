package org.spring.my.dao;

import java.util.List;
import java.util.Map;

import org.spring.my.dto.Page;
import org.spring.my.dto.Product;

public interface ProductDAO {
	
	//판매추가
	public void insert(Product product) throws Exception;
	//판매 검색 값
	public List<Map<String, Object>> selectList(Page page) throws Exception;
	//판매 수
	public int selectTotCnt(Page page) throws Exception;
	//판매 삭제
	public void delete(String pcode) throws Exception;
	//판매 단일 조회
	public Map<String, Object> selectOne(String pcode) throws Exception;
	//판매 수정
	public void update(Product product) throws Exception;
	

	

	

	

}
