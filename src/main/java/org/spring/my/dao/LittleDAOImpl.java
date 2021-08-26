package org.spring.my.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.spring.my.dto.Little;
import org.spring.my.dto.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LittleDAOImpl implements LittleDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(Little little) throws Exception {
		sqlSession.insert("org.spring.my.LittleMapper.insert", little);
		
	}

	@Override
	public List<Little> selectList(Page page) throws Exception {
		return sqlSession.selectList("org.spring.my.LittleMapper.selectList",page);
	}

	@Override
	public void delete(String lcode) throws Exception {
		sqlSession.delete("org.spring.my.LittleMapper.delete", lcode);
		
	}

	@Override
	public int selectTotCnt(Page page) throws Exception {
		return sqlSession.selectOne("org.spring.my.ProductMapper.selectTotCnt",page);
	}
}
