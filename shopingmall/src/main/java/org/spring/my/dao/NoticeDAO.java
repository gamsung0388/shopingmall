package org.spring.my.dao;

import java.util.List;
import java.util.Map;

import org.spring.my.dto.Notice;
import org.spring.my.dto.Page;

public interface NoticeDAO {

	public void insert(Notice notice);
	//전체 게시물 수 
	public int selectTotCnt(Page page);
	public List<Map<String, Object>> selectList(Page page);
	public Notice selectOne(int ncode);
	public void delete(int ncode);
	public void update(Notice notice);

}
