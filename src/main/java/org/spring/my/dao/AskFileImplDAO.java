package org.spring.my.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.spring.my.dto.AskFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AskFileImplDAO implements AskFileDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertAskFiles(Map<String, Object> filesMap) {
		sqlSession.insert("org.spring.my.AskFileMapper.insert", filesMap);
		
	}

	@Override
	public List<AskFile> selectList(int acode) {
		return sqlSession.selectList("org.spring.my.AskFileMapper.selectList", acode);
	}


	@Override
	public void delete(int acode) {
		sqlSession.delete("org.spring.my.AskFileMapper.delete", acode);
		
	}

}
