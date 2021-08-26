package org.spring.my.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.spring.my.dto.Big;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class BigDAOImpl implements BigDAO{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<Big> selectList() throws Exception {
		return sqlSession.selectList("org.spring.my.BigMapper.selectList");
	}

}
