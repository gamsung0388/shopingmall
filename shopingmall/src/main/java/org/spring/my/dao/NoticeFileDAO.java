package org.spring.my.dao;

import java.util.List;
import java.util.Map;

import org.spring.my.dto.NoticeFile;

public interface NoticeFileDAO {

	public void insertNoticeFiles(Map<String, Object> filesMap);
	public List<NoticeFile> selectList(int ncode);
	public void delete(int ncode);
	public void filedelete(int fcode);

}
