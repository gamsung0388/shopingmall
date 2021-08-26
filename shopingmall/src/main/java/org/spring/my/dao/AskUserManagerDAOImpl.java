package org.spring.my.dao;

import org.apache.ibatis.session.SqlSession;
import org.spring.my.dto.AskUserManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AskUserManagerDAOImpl implements AskUserManagerDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void readcnt_ask(AskUserManager askUserManager) {
		sqlSession.update("org.spring.my.AskUserManagerMapper.readcnt_ask", askUserManager);
		
	}

}
