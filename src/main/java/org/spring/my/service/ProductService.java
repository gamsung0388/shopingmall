package org.spring.my.service;

import java.util.List;
import java.util.Map;

import org.spring.my.dto.Page;
import org.spring.my.dto.Product;

public interface ProductService {

	public void insert(Product product) throws Exception;

	public List<Map<String, Object>> selectList(Page page) throws Exception;

	public void delete(String pcode) throws Exception;

	public Map<String, Object> selectOne(String pcode) throws Exception;

	public void update(Product product) throws Exception;

	

}
