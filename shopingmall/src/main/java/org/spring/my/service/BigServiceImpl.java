package org.spring.my.service;

import java.util.List;

import org.spring.my.dao.BigDAO;
import org.spring.my.dto.Big;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BigServiceImpl implements BigService {

	@Autowired
	BigDAO bigDAO;
	
	@Override
	public List<Big> selectList() throws Exception {
		return bigDAO.selectList();
	}

}
