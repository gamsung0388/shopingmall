package org.spring.my.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.spring.my.dto.Sell;
import org.spring.my.dto.SellBox;
import org.spring.my.dto.SellDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SellDetailDAOImpl implements SellDetailDAO{
	@Autowired
	private SqlSession sqlsession;

	@Override
	public void insert(SellDetail selldetail) throws Exception{
		sqlsession.insert("org.spring.my.SelldetailMapper.insert",selldetail) ;
	}

	
	
	

	

	
}
