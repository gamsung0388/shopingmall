package org.spring.my.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.spring.my.dao.GuestDAO;
import org.spring.my.dao.ProductFileDAO;
import org.spring.my.dao.SellDAO;
import org.spring.my.dto.Guest;
import org.spring.my.dto.ProductFile;
import org.spring.my.dto.Sell;
import org.spring.my.dto.SellBox;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SellServiceImpl implements SellService{

	@Autowired
	private GuestDAO guestDAO;
	@Autowired
	private SellDAO sellDAO;
	@Autowired
	private ProductFileDAO productFileDAO;
	
	//결제추가
	@Override
	public void insert(Sell sell) throws Exception{
		//결제폼추가
		sellDAO.insert(sell);
	}
	//결제 조회
	@Override
	public List<Map<String, Object>> selectList(String userid) throws Exception{
		
		return sellDAO.selectList(userid);
	}
	//결제 단일 조회
	@Override
	public Map<String, Object> selectOne(int scode, String pcode) throws Exception {
		return sellDAO.selectOne(scode,pcode);
	}
	
	
	
}
