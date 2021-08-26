package org.spring.my.service;

import java.util.Map;

import org.spring.my.dto.SellBox;

public interface SellBoxService {
	//장바구니에 상품 추가
	public void insert(SellBox sellBox) throws Exception;
	//장바구니 아이디로 상품 조회
	public Map<String, Object> selectList(String userid) throws Exception;
	//장바구니 상품 전체 삭제
	public void Alldelete(String userid) throws Exception;
	//장바구니 상품 단일 삭제
	public void delete(String userid, String pcode) throws Exception;
	//장바구니 상품 단일조회
	public SellBox selectOne(int sbcode) throws Exception;
	//단일결제
	public Map<String, Object> orderselectone(String userid, String pcode) throws Exception;
	//복수결제
	public Map<String, Object> orderselectList(String userid) throws Exception;
	
	
	
	
	
	
	

}
