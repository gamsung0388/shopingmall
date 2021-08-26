package org.spring.my.dao;

import java.util.List;
import java.util.Map;

import org.spring.my.dto.ProductFile;

public interface ProductFileDAO {
	public void insertBoardFiles(Map<String,Object> filesMap)throws Exception;
	public List<ProductFile> selectList(String pcode)throws Exception;
	public void delete(int fcode)throws Exception;
	public void deleteAll(String pcode);
}
