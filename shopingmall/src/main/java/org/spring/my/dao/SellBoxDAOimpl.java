package org.spring.my.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.spring.my.dto.SellBox;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.net.aso.r;

@Repository
public class SellBoxDAOimpl implements SellBoxDAO{

	@Autowired
	private SqlSession sqlSession;
	
	//장바구니에 상품이 존재하는지
	@Override
	public int CountCheck(String pcode, String userid) throws Exception{
		Map<String, Object> checkMap = new HashMap<>();
		checkMap.put("pcode", pcode);
		checkMap.put("userid", userid);
		return sqlSession.selectOne("org.spring.my.SellBoxMapper.productcount",checkMap);
	}
	//장바구니 물품추가
	@Override
	public void insert(SellBox sellBox) throws Exception{
		sqlSession.insert("org.spring.my.SellBoxMapper.insert",sellBox);		
	}

	//장바구니 물품조회
	@Override
	public List<Map<String, Object>> selectList(String userid) throws Exception{
		return sqlSession.selectList("org.spring.my.SellBoxMapper.selectList",userid);
	}
	//물품 수 증가
	@Override
	public void Sellcntup(String userid,int sellcnt,String pcode) throws Exception{
		Map<String, Object> CntupMap = new HashMap<>();
		CntupMap.put("userid", userid);
		CntupMap.put("sellcnt", sellcnt);
		CntupMap.put("pcode", pcode);
		sqlSession.update("org.spring.my.SellBoxMapper.Sellcntup",CntupMap);
	}
	
	//장바구니 물품 금액(배송비 제외한)
	@Override
	public int Amount(String userid,String pcode) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("pcode", pcode);
		return sqlSession.selectOne("org.spring.my.SellBoxMapper.Amount",map);
	}
	//복수구매시 총금액
	@Override
	public int AllAmount(String userid) throws Exception{
		return sqlSession.selectOne("org.spring.my.SellBoxMapper.AllAmount",userid);
	}
	//장바구니 전체 비우기
	@Override
	public void Alldelete(String userid) throws Exception{
		sqlSession.delete("org.spring.my.SellBoxMapper.Alldelete",userid);
	}
	//장바구니 단일 비우기
	@Override
	public void delete(String userid,String pcode) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("pcode",pcode);
		sqlSession.delete("org.spring.my.SellBoxMapper.delete",map);
	}
	//장바구니 단일조회
	@Override
	public SellBox selectOne(int sbcode) throws Exception{
		return sqlSession.selectOne("org.spring.my.SellBoxMapper.selectOne",sbcode);
	}
	//장바구니 단일결제에서 출력하기
	@Override
	public List<Map<String,Object>> orderselectone(String userid,String pcode) throws Exception{
		Map<String, String> map = new HashMap<>();
		map.put("userid", userid);
		map.put("pcode",pcode);
		return sqlSession.selectList("org.spring.my.SellBoxMapper.orderselectone",map);
	}
	//장바구니 복수결제에서 출력하기
	@Override
	public List<Map<String, Object>> orderselectList(String useird) throws Exception{
		return sqlSession.selectList("org.spring.my.SellBoxMapper.orderselectList",useird);
	}
	
}
