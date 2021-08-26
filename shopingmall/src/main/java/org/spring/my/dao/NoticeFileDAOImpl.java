package org.spring.my.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.spring.my.dto.NoticeFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeFileDAOImpl implements NoticeFileDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertNoticeFiles(Map<String, Object> filesMap) {
		sqlSession.insert("org.spring.my.NoticeFileMapper.insert", filesMap);
		
	}

	@Override
	public List<NoticeFile> selectList(int ncode) {
		return sqlSession.selectList("org.spring.my.NoticeFileMapper.selectList", ncode);
	}

	@Override
	public void delete(int ncode) {
		sqlSession.delete("org.spring.my.NoticeFileMapper.delete", ncode);
		
	}

	@Override
	public void filedelete(int fcode) {
		sqlSession.delete("org.spring.my.NoticeFileMapper.filedelete", fcode);
		
	}

}
