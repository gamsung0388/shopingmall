package org.spring.my.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.spring.my.dto.Guest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GuestDAOImpl implements GuestDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(Guest guest) {

		
		sqlSession.insert("org.spring.my.GuestMapper.insert",guest);
		
	}

	@Override
	public Guest selectOne(String userid) {
		return sqlSession.selectOne("org.spring.my.GuestMapper.selectOne",userid);
	}

	@Override
	public List<Guest> selectList(Map<String, String> findmap) {
		return sqlSession.selectList("org.spring.my.GuestMapper.selectList",findmap);
	}

	@Override
	public void update(Guest guest) {
		sqlSession.update("org.spring.my.GuestMapper.update",guest);
		
	}

	@Override
	public void delete(String userid) {
		sqlSession.delete("org.spring.my.GuestMapper.delete",userid);
		
	}

	@Override
	public void updateEmailAuth(String userid) {
		sqlSession.update("org.spring.my.GuestMapper.updateEmailAuth", userid);
		
	}

	@Override
	public List<String> selectEmail(String email) {
		
		return sqlSession.selectList("org.spring.my.GuestMapper.selectEmail",email);
	}

}
