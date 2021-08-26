package org.spring.my.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.spring.my.dto.Notice;
import org.spring.my.dto.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeDAOImpl implements NoticeDAO{

	@Autowired
	private SqlSession sqlSession;
	
	//공지글 등록
	@Override
	public void insert(Notice notice) {
		sqlSession.insert("org.spring.my.NoticeMapper.insert", notice);
		
	}
	
	//전체 게시물 수 구하기
	@Override
	public int selectTotCnt(Page page) {
		return sqlSession.selectOne("org.spring.my.NoticeMapper.selectTotCnt", page);
	}

	@Override
	public List<Map<String, Object>> selectList(Page page) {
		return sqlSession.selectList("org.spring.my.NoticeMapper.selectList", page);
	}

	@Override
	public Notice selectOne(int ncode) {
		return sqlSession.selectOne("org.spring.my.NoticeMapper.selectOne", ncode);
	}

	@Override
	public void delete(int ncode) {
		sqlSession.delete("org.spring.my.NoticeMapper.delete", ncode);
		
	}

	@Override
	public void update(Notice notice) {
		sqlSession.update("org.spring.my.NoticeMapper.update", notice);
		
	}

}
