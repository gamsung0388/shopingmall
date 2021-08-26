package org.spring.my.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.spring.my.dto.Answer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AnswerDAOImpl implements AnswerDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(Answer answer) {
		sqlSession.insert("org.spring.my.AnswerMapper.insert", answer);
		
	}

	@Override
	public List<Answer> selectList(int acode) {
		return sqlSession.selectList("org.spring.my.AnswerMapper.selectList", acode);
	}

	@Override
	public void delete(int acode) {
		sqlSession.delete("org.spring.my.AnswerMapper.delete", acode);
		
	}

}
