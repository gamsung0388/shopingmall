package org.spring.my.dao;

import java.util.List;

import org.spring.my.dto.Little;
import org.spring.my.dto.Page;

public interface LittleDAO {
	public void insert(Little little) throws Exception;

	public List<Little> selectList(Page page) throws Exception;

	public void delete(String lcode) throws Exception;

	public int selectTotCnt(Page page) throws Exception;

}
