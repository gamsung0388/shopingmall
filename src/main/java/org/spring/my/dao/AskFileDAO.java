package org.spring.my.dao;

import java.util.List;
import java.util.Map;

import org.spring.my.dto.AskFile;

public interface AskFileDAO {

	public void insertAskFiles(Map<String, Object> filesMap);
	public List<AskFile> selectList(int acode);
	public void delete(int acode);

}
