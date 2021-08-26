package org.spring.my.dao;

import java.util.List;
import java.util.Map;

import org.spring.my.dto.SellBox;

public interface SellBoxDAO {
	//장바구니에 상품이 존재하는지
	public int CountCheck(String pcode, String userid) throws Exception;
	//장바구니에 상품 추가
	public void insert(SellBox sellBox) throws Exception;
	//장바구니 물품조회
	public List<Map<String, Object>> selectList(String userid) throws Exception;
	//물품수정후 물품조회
	public void Sellcntup(String userid, int sellcnt, String pcode) throws Exception;
	//배송비제외한 물품금액
	public int Amount(String userid, String pcode) throws Exception;
	//복수구매시 총금액
	public int AllAmount(String userid) throws Exception;
	//장바구니 전체 비우기
	public void Alldelete(String userid) throws Exception;
	//장바구니 단일 삭제
	public void delete(String userid, String pcode) throws Exception;
	//장바구니 단일조회
	public SellBox selectOne(int sbcode) throws Exception;
	//장바구니 단일 결제
	public List<Map<String, Object>> orderselectone(String userid,String pcode) throws Exception;
	//장바구니 복수 결제
	public List<Map<String, Object>> orderselectList(String useird) throws Exception;
	
	
	

}
