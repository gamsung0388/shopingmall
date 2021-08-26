package org.spring.my.dao;

import java.util.List;
import java.util.Map;

import org.spring.my.dto.Guest;


public interface GuestDAO {
	public void insert(Guest guest);

	public Guest selectOne(String userid);
	public List<Guest> selectList(Map<String,String> findmap);

	public void update(Guest guest);
	
	public List<String> selectEmail(String email);

	public void delete(String userid);

	public void updateEmailAuth(String userid);

}
