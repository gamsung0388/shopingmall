package org.spring.my.dao;

import java.util.List;

import org.spring.my.dto.Big;

public interface BigDAO {

	public List<Big> selectList() throws Exception;

}
