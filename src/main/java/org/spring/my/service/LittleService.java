package org.spring.my.service;

import java.util.List;

import org.spring.my.dto.Little;
import org.spring.my.dto.Page;

public interface LittleService {

	public void insert(Little little) throws Exception;

	public List<Little> selectList(Page page) throws Exception;

	public void delete(String lcode) throws Exception;

}
