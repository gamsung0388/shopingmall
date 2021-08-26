package org.spring.my.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.spring.my.dto.Page;
import org.spring.my.dto.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAOImpl implements ProductDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(Product product) throws Exception {
		sqlSession.insert("org.spring.my.ProductMapper.insert", product);
		
	}

	@Override
	public List<Map<String, Object>> selectList(Page page) throws Exception {
		return sqlSession.selectList("org.spring.my.ProductMapper.selectList",page);
	}
	
	@Override
	public int selectTotCnt(Page page) throws Exception {
		return sqlSession.selectOne("org.spring.my.ProductMapper.selectTotCnt",page);
	}

	@Override
	public void delete(String pcode) throws Exception {
		sqlSession.delete("org.spring.my.ProductMapper.delete", pcode);
		
	}

	@Override
	public Map<String, Object> selectOne(String pcode) throws Exception {
		return sqlSession.selectOne("org.spring.my.ProductMapper.selectOne",pcode);
	}

	@Override
	public void update(Product product) throws Exception {
		sqlSession.update("org.spring.my.ProductMapper.update", product);
		
	}

}
