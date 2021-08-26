package org.spring.my.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.spring.my.dto.Ask;
import org.spring.my.dto.Page;

public interface AskService {

	public void insert(Ask ask);
	public List<Map<String, Object>> selectList(Page page);
	public Map<String, Object> selectOne(int acode);
	public void updateReadCnt(int acode, String userid);
	public void delete(int acode);

}
