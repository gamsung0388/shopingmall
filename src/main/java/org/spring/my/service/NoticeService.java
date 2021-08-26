package org.spring.my.service;

import java.util.List;
import java.util.Map;

import org.spring.my.dto.Notice;
import org.spring.my.dto.Page;

public interface NoticeService {

	public void insert(Notice notice);
	public List<Map<String, Object>> selectList(Page page);
	public Map<String, Object> selectOne(int ncode);
	public void updateReadCnt(int ncode, String userid);
	public void delete(int ncode);
	public void update(Notice notice, List<Integer> fileDeleteList);

}
