package org.spring.my.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.spring.my.dto.ProductFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductFileDAOImpl implements ProductFileDAO{
	@Autowired
	private SqlSession sqlSession; 
	
	@Override
	public void insertBoardFiles(Map<String, Object> filesMap) throws Exception{
		sqlSession.insert("org.spring.my.ProductFileMapper.insertBoardFiles", filesMap);
		
	}

	@Override
	public List<ProductFile> selectList(String pcode)throws Exception{
		return sqlSession.selectList("org.spring.my.ProductFileMapper.selectList", pcode);
	}

	@Override
	public void delete(int fcode)throws Exception {
		sqlSession.delete("org.spring.my.ProductFileMapper.delete", fcode);
		
	}

	@Override
	public void deleteAll(String pcode) {
		sqlSession.delete("org.spring.my.ProductFileMapper.deleteAll", pcode);
		
	}

}
