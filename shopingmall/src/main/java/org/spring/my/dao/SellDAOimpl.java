package org.spring.my.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.spring.my.dto.Sell;
import org.spring.my.dto.SellBox;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SellDAOimpl implements SellDAO{
	@Autowired
	private SqlSession sqlsession;
	
	//결제 추가
	@Override
	public void insert(Sell sell) throws Exception{
		sqlsession.insert("org.spring.my.SellMapper.insert",sell);
		
	}
	//결제 수정
	@Override
	public void update(Sell sell) throws Exception{
		sqlsession.update("org.spring.my.SellMapper.update",sell);
	}
	//결제 조회
	@Override
	public List<Map<String, Object>> selectList(String userid) throws Exception{
		return sqlsession.selectList("org.spring.my.SellMapper.selectList",userid);
	}
	//결제 단일 조회
	@Override
	public Map<String, Object> selectOne(int scode,String pcode) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("scode", scode);
		map.put("pcode", pcode);
		return sqlsession.selectOne("org.spring.my.SellMapper.selectOne",map);
	}

}
