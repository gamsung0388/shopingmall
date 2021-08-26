package org.spring.my.dao;

import org.apache.ibatis.session.SqlSession;
import org.spring.my.dto.NoticeUserManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeUserManagerDAOImpl implements NoticeUserManagerDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void noticeReadCnt(NoticeUserManager noticeUserManager) {
		sqlSession.update("org.spring.my.NoticeUserManagerMapper.noticeReadCnt", noticeUserManager);
		
	}

}
