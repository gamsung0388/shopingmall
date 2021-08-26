package org.spring.my.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.spring.my.dto.Ask;
import org.spring.my.dto.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AskDAOImpl implements AskDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(Ask ask) {
		sqlSession.insert("org.spring.my.AskMapper.insert", ask);
		
	}

	//전체 게시물 수
	@Override
	public int selectTotCnt(Page page) {
		return sqlSession.selectOne("org.spring.my.AskMapper.selectTotCnt", page);
	}

	//페이징처리 및 조회
	@Override
	public List<Map<String, Object>> selectList(Page page) {
		return sqlSession.selectList("org.spring.my.AskMapper.selectList", page);
	}

	@Override
	public Ask selectOne(int acode) {
		return sqlSession.selectOne("org.spring.my.AskMapper.selectOne", acode);
	}

	@Override
	public void delete(int acode) {
		sqlSession.delete("org.spring.my.AskMapper.delete", acode);
		
	}

}
