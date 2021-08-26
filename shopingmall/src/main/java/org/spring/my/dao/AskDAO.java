package org.spring.my.dao;

import java.util.List;
import java.util.Map;

import org.spring.my.dto.Ask;
import org.spring.my.dto.Page;

public interface AskDAO {

	public void insert(Ask ask);
	//전체 게시물 수 
	public int selectTotCnt(Page page);
	//페이징처리 및 조회
	public List<Map<String, Object>> selectList(Page page);
	public Ask selectOne(int acode);
	public void delete(int acode);

}
